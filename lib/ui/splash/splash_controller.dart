import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import '../../../utils/snackbar_util.dart';
import '../../../../core/error/failure.dart';

class SplashController extends GetxController {
  SplashController({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  void onInit() async {
    super.onInit();

    var user = AppPreferences.getLoginData();

    if (user != null) {
      var result = await _userRepository.fetchUser();
      result.fold(
        (failure) {
          SnackbarUtil.error(
            logMessage: (failure as Error).errorMessage.toString(),
            logScreenName: Routers.login,
            logMethodName: 'fetchUser',
            message: failure.errorMessage.toString(),
          );
          Get.offNamed(Routers.homeScreen);
        },
        (r) {
          // ✅ Directly navigate to homeScreen on success
          Get.offAllNamed(Routers.homeScreen);
        },
      );
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed(Routers.onBoarding);
    }
  }
}
