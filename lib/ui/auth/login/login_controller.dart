import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/app_preferences.dart';
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
    loadUserFromPrefs();
  }

  void onLogin() {
    if (formKey.currentState != null &&
        formKey.currentState!.saveAndValidate()) {
      final formData = formKey.currentState!.value;
      login(formData["email"], formData["password"]);
    }
  }

  Future<void> login(String email, String password) async {
    isBusy.value = true;

    final result =
        await _authRepository.login(email: email, password: password);
    isBusy.value = false;

    result.fold(
      (failure) {
        final errorMsg = failure.errorMessage ?? 'Login failed';
        SnackbarUtil.error(
          logMessage: errorMsg,
          logScreenName: Routers.login,
          logMethodName: 'login',
          message: failure.errorMessage ?? 'Unknown error',
        );
      },
      (responseData) async {
        if (responseData.token == null) {
          SnackbarUtil.error(
            message: responseData.message ?? "Login failed",
          );
          return;
        }
        // Save token if needed
        if (responseData.token != null) {
          await AppPreferences.setLoginData(responseData);
        }

        // Fetch user profile and save to preferences
        final profileResult = await _userRepository.fetchUser();
        await profileResult.fold(
          (error) async {
            print("Failed to fetch profile: ${error.errorMessage}");
          },
          (profileData) async {
            await AppPreferences.setUserData(profileData);
            print(
                "Saved user to prefs: ${profileData.data?.name}, ${profileData.data?.email}");

            // Only navigate after saving!
            SnackbarUtil.info(
              message: responseData.message ?? "User Not Found",
              isInfo: false,
            );
            final token = AppPreferences.getAuthToken();
            if (token != null && token.isNotEmpty) {
              Get.offAllNamed(Routers.homeScreen);
            }
          },
        );
      },
    );
  }

//   final auth = AuthService();
// final result = await auth.signInWithGoogle(); // or signInWithApple()

// if (result != null) {
//   print("✅ Signed in: ${result.user?.email}");
//   AppPreferences.setUserData(result.user);
//   Get.offAllNamed(Routers.homeScreen);
// }

  void forgotPassword() {
    Get.toNamed(Routers.forgotPassword);
  }

  void loadUserFromPrefs() {
    var data = AppPreferences.getData("rememberMe");
    print(data);
    Future.delayed(Duration(seconds: 1)).then((_) {
      formKey.currentState?.patchValue({...data ?? {}, 'password': ''});
    });
  }
}
