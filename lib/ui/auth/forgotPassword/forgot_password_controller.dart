import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../../../core/error/failure.dart';

class ForgotPassController extends GetxController {
  ForgotPassController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;
  final formKey = GlobalKey<FormBuilderState>();

  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  forgotPassword(String username, bool isEmail) async {
    isBusy.value = true;

    var result = await _authRepository.forgotPassword(username: username);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.forgotPassword,
        logMethodName: 'forgotPassword',
        message: (failure).errorMessage.toString(),
      );
    }, (r) async {
      if (isEmail) {
        SnackbarUtil.info(
            message:
                "Reset link has been sent to $username. Please check your email for further instructions.",
            isInfo: false);
        Get.back();
      } else {
        Get.toNamed(Routers.otp, parameters: {"isForgotPassword": "Yes"});
        SnackbarUtil.info(
            message:
                "An OTP has been sent to $username. Please enter the code to continue",
            isInfo: false);
      }
    });
  }
}
