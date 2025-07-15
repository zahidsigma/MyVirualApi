import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/ui/auth/reset_password.dart';
import 'package:virualapi/utils/snackbar_util.dart';

class OtpController extends GetxController {
  final AuthRepository authRepo = Get.find();
  var enteredOtp = ''.obs; // Rx variable to store OTP input
  var isLoading = false.obs; // Rx variable to control loading state

  Future<void> verifyOTP(String email) async {
    if (enteredOtp.value.length < 5) {
      SnackbarUtil.error(message: "Please enter a valid OTP");
      return;
    }

    isLoading.value = true;

    final result =
        await authRepo.verifyOTP(otp: enteredOtp.value, email: email);
    result.fold(
      (failure) {
        // Handle failure
        SnackbarUtil.error(
          logMessage: failure.errorMessage.toString(),
          message: failure.errorMessage.toString(),
        );
      },
      (isSuccess) {
        // OTP verified successfully
        if (isSuccess) {
          SnackbarUtil.info(message: "OTP Verified!");
          Get.toNamed(
            Routers.resetPassword, // Make sure this is the correct route name
            arguments: {
              "email": email,
              "otp": enteredOtp.value,
              // "isForgotPassword": true, // Uncomment if needed
            },
          );
          // Proceed with further actions
        } else {
          SnackbarUtil.error(message: "OTP verification failed");
        }
      },
    );

    isLoading.value = false;
  }
}
