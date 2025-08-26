import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/utils/snackbar_util.dart';

import '../../../constants/config.dart';
import '../../../repos/auth_repo.dart';
import '../../../core/error/failure.dart';

class SignupController extends GetxController {
  SignupController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  final formKey = GlobalKey<FormBuilderState>();
  RxBool isBusy = false.obs;
  RxBool isObsecure = true.obs;
  RxBool isConfirmPasswordObscure = true.obs;
  RxBool isPasswordObscure = true.obs;
  RxBool whatsAppInstalled = false.obs;
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'PK');
  final RegExp phoneNumberRegExp = RegExp(r'^923\d{9}$');
  bool isPhoneNumberValid = false;
  String? phoneNumberVal = "";

  void handleSignupData() {
    bool isValid = formKey.currentState!.saveAndValidate();

    if (isValid) {
      var signupFormData = formKey.currentState!.value;

      // Validate Email
      if (!GetUtils.isEmail(signupFormData["email"])) {
        SnackbarUtil.info(message: "Please enter a valid email address");
        return;
      }

      // Validate Password Match
      if (signupFormData["password"] !=
          signupFormData["password_confirmation"]) {
        SnackbarUtil.info(
            message: "Password and confirm password do not match");
        return;
      }

      isBusy.value = true;

      var signupData = {
        "name": signupFormData["name"],
        "email": signupFormData["email"],
        "password": signupFormData["password"],
        "password_confirmation": signupFormData["password_confirmation"],
      };

      // Call the API to register the user
      callApi(signupData);
    } else {
      SnackbarUtil.info(
        message: "Please fill all required fields",
      );
    }
  }

  String extractMessage(dynamic message) {
    if (message == null) return 'Unknown error occurred';

    if (message is String) return message;

    if (message is List) {
      return message.map((e) => extractMessage(e)).join(', ');
    }

    if (message is Map) {
      return message.values.map((e) => extractMessage(e)).join(', ');
    }

    return message.toString();
  }

  callApi(data) async {
    var result = await _authRepository.createUser(data: data);
    isBusy.value = false;
    print(result);

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logMethodName: 'createUser',
        message: failure.errorMessage.toString(),
      );
    }, (res) {
      if (res['status'] == false) {
        var errorMessage = extractMessage(res['message']);
        print('API returned false status: $errorMessage');
        SnackbarUtil.error(message: errorMessage ?? 'Registration failed');
      } else if (res['status'] == true) {
        var successMessage = res['message'] ?? 'User registered!';
        SnackbarUtil.info(message: successMessage, isInfo: false);

        var userData = res['data'];
        print('Registered user data: $userData');

        // Navigate to login or another page
        Get.offNamed(Routers.login);
      } else {
        SnackbarUtil.error(message: 'Unexpected response');
      }
    });
  }
}
