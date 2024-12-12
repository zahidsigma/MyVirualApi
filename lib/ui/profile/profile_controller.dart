import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/user.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/utils/image_utils.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/utils/util.dart';
import '../../../core/error/failure.dart';

class ProfileController extends GetxController {
  final UserRepository _userRepository = Get.find();
  final formKey = GlobalKey<FormBuilderState>();
  RxBool isBusy = false.obs;
  Rx<File?> userImage = Rx<File?>(null);
  late User? user;
  bool isPhoneNumberValid = false;
  String? phoneNumberVal = "";
  Rx<PhoneNumber> phoneNumber = Rx(PhoneNumber(isoCode: 'US'));
  final RegExp phoneNumberRegExp = RegExp(r'^923\d{9}$');
  final phoneTextFieldController = new TextEditingController();

  String getFirstTwoCharacters(String input) =>
      input.isEmpty ? '' : input.substring(0, input.length < 2 ? 1 : 2);

  @override
  void onInit() {
    super.onInit();
    user = AppPreferences.getUserData();
    if (user != null && user?.id != null) {
      log(jsonEncode(user?.toJson()));
      var phoneNum = (Util.containsOnlyDigits(user?.username ?? "")
              ? user?.username
              : user?.contact?.phone1) ??
          "";

      phoneTextFieldController.text = phoneNum;
      Future.delayed(Duration(milliseconds: 500)).then((value) async {
        if (phoneNum.isNotEmpty) {
          phoneNumber.value =
              await PhoneNumber.getRegionInfoFromPhoneNumber("+${phoneNum}");
        }
        print(user);

        formKey.currentState?.patchValue(
          {
            "weight": user?.weight?.toString(),
            "height_ft": user?.height?.toInt().toString(),
            "height_in": user?.height != null
                ? getFirstTwoCharacters(user!.height.toString().split('.')[1])
                : "",
            "name": user?.name,
            "dob": DateTime.fromMillisecondsSinceEpoch(user?.dob ?? 0,
                isUtc: true),
            "address": user?.contact?.address1?.toString(),
            "city": user?.contact?.city,
            "country": user?.contact?.country,
            "gender": Util.capitalize(user?.gender?.toLowerCase() ?? "male"),
            "email": user?.email,
          },
        );
      });
    }
  }

  getImage() async {
    var file = await ImageUtils.pickImage();
    userImage.value = file;
  }

  uploadImage() async {
    var result = await _userRepository.uploadImage(
        file: userImage.value!, fileType: FileType.profilepic.name);
    result.fold((failure) {
      isBusy.value = false;
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.profile,
        logMethodName: 'uploadImage',
        message: (failure).errorMessage.toString(),
      );
    }, (r) => Get.offAllNamed(Routers.homeScreen));
  }

  updateMainProfile() async {
    if (formKey.currentState!.saveAndValidate()) {
      isBusy.value = true;
      var formValues = formKey.currentState!.value;
      var data = {
        "nama": formValues["name"],
        "email": formValues["email"],
        "dob": DateFormat("yyyy-MM-dd").format(formValues['dob']),
        "gender": formValues["gender"].toLowerCase(),
        "height":
            "${formValues['height_ft']}.${formValues['height_in']?.toString() == '10' ? '101' : formValues['height_in']}",
        "weight": formValues["weight"],
        "contact": {
          "address1": formValues["address"],
          "city": formValues["city"],
          "country": formValues["country"],
          "phone1": phoneNumberVal,
        },
      };

      var result = await _userRepository.updateUser(data: data);
      isBusy.value = false;
      result.fold((failure) {
        SnackbarUtil.error(
          logMessage: (failure as Error).errorMessage.toString(),
          logScreenName: Routers.profile,
          logMethodName: 'updateUser',
          message: (failure).errorMessage.toString(),
        );
      }, (r) {
        Get.back();
        SnackbarUtil.info(
            message: "Profile updated Successfully", isInfo: false);

        Future.delayed(Duration(milliseconds: 200)).then((value) {
          var ctrl = Get.find<HomeController>();
          ctrl.fetchUser(fetchOtherData: false);
        });
      });
    }
  }

  updateProfile() async {
    if (formKey.currentState!.saveAndValidate()) {
      if (userImage.value == null) {
        SnackbarUtil.info(message: "Image is required");
        return;
      }
      isBusy.value = true;
      var formValues = formKey.currentState!.value;
      var data = {
        "weight": formValues["weight"],
        "height": "${formValues['height_ft']}.${formValues['height_in']}",
      };

      var result = await _userRepository.updateUser(data: data);
      result.fold((failure) {
        isBusy.value = false;
        SnackbarUtil.error(
          logMessage: (failure as Error).errorMessage.toString(),
          logScreenName: Routers.profile,
          logMethodName: 'updateUser',
          message: (failure).errorMessage.toString(),
        );
      }, (r) => uploadImage());
    }
  }
}
