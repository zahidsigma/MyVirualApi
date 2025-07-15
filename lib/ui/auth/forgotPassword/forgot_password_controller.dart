// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/auth_repo.dart';
// import 'package:virualapi/utils/snackbar_util.dart';
// import '../../../core/error/failure.dart';

// class ForgotPassController extends GetxController {
//   ForgotPassController({required AuthRepository authRepository})
//       : _authRepository = authRepository;

//   final AuthRepository _authRepository;
//   final formKey = GlobalKey<FormBuilderState>();

//   RxBool isBusy = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   forgotPassword(String email, bool isEmail) async {
//     isBusy.value = true;

//     var result = await _authRepository.forgotPassword(email: email);
//     isBusy.value = false;

//     result.fold((failure) {
//       SnackbarUtil.error(
//         logMessage: (failure as Error).errorMessage.toString(),
//         logScreenName: Routers.forgotPassword,
//         logMethodName: 'forgotPassword',
//         message: (failure).errorMessage.toString(),
//       );
//     }, (r) async {
//       if (isEmail) {
//         SnackbarUtil.info(
//             message:
//                 "Reset link has been sent to $email. Please check your email for further instructions.",
//             isInfo: false);
//         Get.back();
//       } else {
//         Get.toNamed(Routers.otp, parameters: {"isForgotPassword": "Yes"});
//         SnackbarUtil.info(
//             message:
//                 "An OTP has been sent to $email. Please enter the code to continue",
//             isInfo: false);
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../../../core/error/failure.dart';

class ForgotPassController extends GetxController {
  ForgotPassController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;
  final formKey4 = GlobalKey<FormBuilderState>();

  RxBool isBusy = false.obs;

  void onSubmit() {
    if (formKey4.currentState?.saveAndValidate() ?? false) {
      final email = formKey4.currentState?.value['email'];
      final isEmail = true; // Assume it's an email, not phone
      forgotPassword(
        email,
      );
    } else {
      SnackbarUtil.error(message: 'Please enter a valid email.');
    }
  }

  forgotPassword(
    String email,
  ) async {
    isBusy.value = true;

    final result = await _authRepository.forgotPassword(email: email);
    isBusy.value = false;

    result.fold(
      (failure) {
        final errorMsg = (failure as Error).errorMessage;
        SnackbarUtil.error(
          logMessage: errorMsg,
          logScreenName: Routers.forgotPassword,
          logMethodName: 'forgotPassword',
          message: errorMsg,
        );
      },
      (responseData) {
        final user = responseData['data'];
        final message = responseData['message'];
        final userEmail = user['email'];

        SnackbarUtil.info(
          message: message,
          isInfo: false,
        );

// Wait for snackbar to appear briefly before navigating
        Future.delayed(Duration(milliseconds: 300));

// Then navigate to OTP screen
        Get.toNamed(Routers.otp, arguments: {
          "email": email,
          // "isForgotPassword": true,
        });

        // Get.back();
        // } else {
        //   Get.toNamed(Routers.otp, parameters: {
        //     "isForgotPassword": "Yes",
        //     "email": userEmail,
        //     "userId": user['id'].toString(),
        //   });
        //   SnackbarUtil.info(
        //     message:
        //         "An OTP has been sent to $message. Please enter the code to continue.",
        //     isInfo: false,
        //   );
        // }
      },
    );
  }
}
