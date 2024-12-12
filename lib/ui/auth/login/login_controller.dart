import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/services/shared_preference_service.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../../../repos/auth_repo.dart';
import '../../../core/error/failure.dart';
import '../../../repos/user_repo.dart';

class LoginController extends GetxController {
  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;
  final UserRepository _userRepository = Get.find();
  final formKey = GlobalKey<FormBuilderState>();
  RxBool isBusy = false.obs;
  RxBool isObsecure = true.obs;

  @override
  void onInit() {
    super.onInit();
    var data = AppPreferences.getData("rememberMe");
    print(data);
    Future.delayed(Duration(seconds: 1)).then((_) {
      formKey.currentState!.patchValue({...data, 'password': ''});
    });
  }

  onLogin() {
    var _formKey = formKey;
    if (_formKey.currentState != null &&
        _formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;
      login(formData["username"], formData["password"]);
    }
  }

  login(username, password) async {
    isBusy.value = true;

    var result =
        await _authRepository.login(username: username, password: password);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.login,
        logMethodName: 'login',
        message: (failure).errorMessage.toString(),
      );
    }, (r) async {
      if (formKey.currentState!.value["rememberMe"] == true) {
        AppPreferences.setData("rememberMe", formKey.currentState!.value);
      } else {
        AppPreferences.removeData("rememberMe");
      }
      var result = await _userRepository.fetchUser();
      result.fold(
        (failure) {
          SnackbarUtil.error(
            logMessage: (failure as Error).errorMessage.toString(),
            logScreenName: Routers.login,
            logMethodName: 'login',
            message: (failure).errorMessage.toString(),
          );
        },
        (r) {
          if (AppPreferences.getFCMToken() != null)
            _userRepository.registerDeviceFCM(
                deviceType: Platform.isAndroid ? 'Android' : 'iOS',
                token: (AppPreferences.getFCMToken()!));
          if (r.picMetaData != null &&
              r.picMetaData!.publicUrl != null &&
              r.picMetaData!.publicUrl!.isNotEmpty)
            Get.offAllNamed(Routers.homeScreen);
          else
            Get.offAllNamed(Routers.profile);
        },
      );
    });
  }

  forgotPassword() {
    Get.toNamed(Routers.forgotPassword);
  }
}
