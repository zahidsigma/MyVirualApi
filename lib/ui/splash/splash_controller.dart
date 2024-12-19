import 'package:virualapi/core/routing/router_str.dart';
import 'package:get/get.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/repos/user_repo.dart';
import '../../../../core/error/failure.dart';
import '../../../utils/snackbar_util.dart';

class SplashController extends GetxController {
  SplashController({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;
  @override
  void onInit() async {
    super.onInit();
    // await Future.delayed(const Duration(seconds: 3));
    // Get.offNamed(Routers.appointmentSlot);
    // return;
    var user = AppPreferences.getLoginData();
    if (user != null) {
      var result = await _userRepository.fetchUser();
      result.fold(
        (failure) {
          SnackbarUtil.error(
            logMessage: (failure as Error).errorMessage.toString(),
            logScreenName: Routers.login,
            logMethodName: 'login',
            message: (failure).errorMessage.toString(),
          );

          Get.offNamed(Routers.homeScreen);
        },
        (r) {
          if (r.picMetaData != null &&
              r.picMetaData!.publicUrl != null &&
              r.picMetaData!.publicUrl!.isNotEmpty)
            Get.offAllNamed(Routers.homeScreen);
          else
            Get.offAllNamed(Routers.profile);
        },
      );
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed(Routers.onBoarding);
    }
  }
}
