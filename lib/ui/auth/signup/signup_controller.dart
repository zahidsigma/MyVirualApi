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

  final signupFormKey = GlobalKey<FormBuilderState>();
  RxBool isBusy = false.obs;
  RxBool isObsecure = true.obs;
  RxBool isConfirmObsecure = true.obs;
  RxBool whatsAppInstalled = false.obs;
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'PK');
  final RegExp phoneNumberRegExp = RegExp(r'^923\d{9}$');
  bool isPhoneNumberValid = false;
  String? phoneNumberVal = "";
  // Map<String, dynamic>? signupFormData;

  // void handleSignupData() {
  //   bool isValid = signupFormKey.currentState!.saveAndValidate();

  //   if (isValid) {
  //     var signupFormData = signupFormKey.currentState!.value;
  //     if (!isPhoneNumberValid) {
  //       SnackbarUtil.info(message: "Please enter valid phone number");
  //       return;
  //     } else if (signupFormData["password"] !=
  //         signupFormData["confirmPassword"]) {
  //       SnackbarUtil.info(message: "Password & confirm password do not match");
  //       return;
  //     } else if (whatsAppInstalled.isFalse) {
  //       SnackbarUtil.info(
  //           message: "You must have WhatsApp installed on your phone");
  //       return;
  //     }
  //     print("Hello ${phoneNumber.phoneNumber}");
  //     isBusy.value = true;

  //     var signupData = {
  //       ...signupFormData,
  //       "dob": DateFormat("yyyy-MM-dd").format(signupFormData['dob']),
  //       "gender": signupFormData['gender'].toLowerCase(),
  //       "username": phoneNumberVal,
  //       // "username": signupFormData["phone"],
  //       // "employeeCode": "CTD-12345-900",
  //       "application": AppConfig.applicationId,
  //       "platform": Platform.isAndroid ? "android" : "ios",
  //       "group": "Family Medicine",
  //       "companyCode": AppConfig.companyCode,
  //     };
  //     print("handleSignupData $signupData");
  //     callApi(signupData);
  //     // FirebaseAuth.instance.verifyPhoneNumber(
  //     //     phoneNumber: signupFormKey.currentState!.value["phone"],
  //     //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     //     verificationFailed: (FirebaseAuthException e) {},
  //     //     codeSent: (String verificationId, int? resendToken) {
  //     //       isBusy.value = false;
  //     //       SnackbarUtil.info(message: "Code Sent Successfully");
  //     //       Get.toNamed(Routers.otp,
  //     //           arguments: {"verificationId": verificationId});
  //     //     },
  //     //     codeAutoRetrievalTimeout: (String verificationId) {});
  //   }
  // }
  void handleSignupData() {
    bool isValid = signupFormKey.currentState!.saveAndValidate();

    if (isValid) {
      var signupFormData = signupFormKey.currentState!.value;

      // Validate Email
      if (!GetUtils.isEmail(signupFormData["email"])) {
        SnackbarUtil.info(message: "Please enter a valid email address");
        return;
      }

      // Validate Password Match
      if (signupFormData["password"] != signupFormData["confirmPassword"]) {
        SnackbarUtil.info(
            message: "Password and confirm password do not match");
        return;
      }

      print("Full Name: ${signupFormData['fullname']}");
      print("Email: ${signupFormData['email']}");
      print("Password: ${signupFormData['password']}");
      print("Confirm Password: ${signupFormData['confirmPassword']}");

      isBusy.value = true;

      var signupData = {
        "fullname": signupFormData["fullname"],
        "email": signupFormData["email"],
        "password": signupFormData["password"],
        // "dob": DateFormat("yyyy-MM-dd").format(signupFormData['dob']),
        // "gender": signupFormData['gender'].toLowerCase(),
        // "application": AppConfig.applicationId,
        "platform": Platform.isAndroid ? "android" : "ios",
        // "group": "Family Medicine",
        // "companyCode": AppConfig.companyCode,
      };

      print("Signup Data: $signupData");
      // callApi(signupData);
    } else {
      SnackbarUtil.info(message: "Please fill all required fields");
    }
  }

  signup() {
    // if (signup1FormKey.currentState != null &&
    //     signup1FormKey.currentState!.saveAndValidate()) {
    // isBusy.value = true;
    // final formData = signup1FormKey.currentState!.value;

    // var dob = "${formData['year']}-${formData['month']}-${formData['day']}";
    // var signupData = {
    //   ...signupFormData!,
    //   ...formData,
    //   "dob": dob,
    //   "username": signupFormData!["phone"],
    //   // "employeeCode": "CTD-12345-900",
    //   "gender": gender.obs == Gender.Male.obs ? "male" : "female",
    //   "application": AppConfig.applicationId,
    //   "platform": Platform.isAndroid ? "Android" : "iOS",
    //   "group": "Family Medicine",
    //   "companyCode": AppConfig.companyCode,
    // };
    // signupData.remove("day");
    // signupData.remove("month");
    // signupData.remove("year");
    // callApi(signupData);
    // }
  }

  callApi(data) async {
    var result = await _authRepository.createUser(data: data);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.login,
        logMethodName: 'login',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      // signup1FormKey.currentState?.reset();
      SnackbarUtil.info(
          message: "User Registered Successfully!", isInfo: false);
      Get.offNamed(Routers.otp);
    });
  }
}
