import 'package:get/get.dart';

import 'package:virualapi/datasource/appointment_datasource.dart';
import 'package:virualapi/datasource/auth_datasource.dart';
import 'package:virualapi/datasource/doctor_data_source.dart';
import 'package:virualapi/datasource/misc_datasource.dart';
import 'package:virualapi/datasource/payment_datasource.dart';
import 'package:virualapi/datasource/user_datasource.dart';

import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/repos/payment_repo.dart';
import 'package:virualapi/repos/user_repo.dart';

import 'package:virualapi/services/shared_preference_service.dart';

import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
import 'package:virualapi/ui/auth/login/login_controller.dart';
import 'package:virualapi/ui/auth/signup/signup_controller.dart';
import 'package:virualapi/ui/childrens/children_controller.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/person/person_search_controller.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';
import 'package:virualapi/ui/profile/recent_history_conroller.dart';
import 'package:virualapi/ui/splash/splash_controller.dart';
import 'package:virualapi/ui/support/contact_us_coroller.dart';

class DI {
  static Future<void> initServices() async {
    /// SharedPreferences singleton
    Get.putAsync(() => SharedPreferencesService.getInstance());
    await Future.delayed(const Duration(seconds: 1));

    /// Data Sources
    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(), fenix: true);
    Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(), fenix: true);
    Get.lazyPut<DoctorDataSource>(() => DoctorDataSourceImpl(), fenix: true);
    Get.lazyPut<AppointmentDataSource>(() => AppointmentDataSourceImpl(),
        fenix: true);
    Get.lazyPut<PaymentDataSource>(() => PaymentDataSourceImpl(), fenix: true);
    Get.lazyPut<MiscDataSource>(() => MiscDataSourceImpl(), fenix: true);

    /// Repositories
    Get.lazyPut(() => AuthRepository(authDataSource: Get.find()), fenix: true);
    Get.lazyPut(() => UserRepository(userDataSource: Get.find()), fenix: true);
    // In your Repositories section
    Get.lazyPut(() => PaymentRepository(paymentDataSource: Get.find()),
        fenix: true);
    Get.lazyPut(() => MiscRepository(miscDataSource: Get.find()), fenix: true);
    // In your Repositories section

    /// Controllers
    Get.lazyPut(() => SplashController(userRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => LoginController(authRepository: Get.find()), fenix: true);
    Get.lazyPut(() => ForgotPassController(authRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => SignupController(authRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => HomeController(userRepository: Get.find()), fenix: true);
    Get.lazyPut(() => PersonSearchController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<RecentHistoryController>(() => RecentHistoryController(),
        fenix: true);
    // Get.lazyPut(() => ContactUsController(miscRepository: Get.find()),
    //     fenix: true);
    Get.put(ContactUsController(miscRepository: Get.find())); // not lazyPut

    Get.lazyPut(() => ChildrenController(), fenix: true);

    // You can add other controllers/repositories here similarly...
  }
}
