// import 'package:get/get.dart';
// import 'package:virualapi/datasource/appointment_datasource.dart';
// import 'package:virualapi/datasource/auth_datasource.dart';
// import 'package:virualapi/datasource/doctor_data_source.dart';
// import 'package:virualapi/datasource/misc_datasource.dart';
// import 'package:virualapi/datasource/payment_datasource.dart';
// import 'package:virualapi/datasource/user_datasource.dart';
// import 'package:virualapi/repos/appointment_repo.dart';
// import 'package:virualapi/repos/auth_repo.dart';
// import 'package:virualapi/repos/doctor_repo.dart';
// import 'package:virualapi/repos/misc_repo.dart';
// import 'package:virualapi/repos/payment_repo.dart';
// import 'package:virualapi/repos/user_repo.dart';
// import 'package:virualapi/services/shared_preference_service.dart';
// // import 'package:virualapi/ui/appointment/appointment_controller.dart';
// import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
// import 'package:virualapi/ui/auth/login/login_controller.dart';
// import 'package:virualapi/ui/auth/signup/signup_controller.dart';
// import 'package:virualapi/ui/childrens/children_controller.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// import 'package:virualapi/ui/person/person_search_controller.dart';
// import 'package:virualapi/ui/splash/splash_controller.dart';
// // import 'package:virualapi/ui/doctor/doctor_controller.dart';
// // import 'package:virualapi/ui/doctor/doctor_details/doctor_details_controller.dart';
// // import 'package:virualapi/ui/home/home_controller.dart';
// // import 'package:virualapi/ui/lab_reports/lab_report_controller.dart';
// // import 'package:virualapi/ui/medication/medication_controller.dart';
// // import 'package:virualapi/ui/payment/payment_controller.dart';
// // import 'package:virualapi/ui/profile/profile_controller.dart';
// // import 'package:virualapi/ui/splash/splash_controller.dart';
// // import 'package:virualapi/ui/treatments/treatment_controller.dart';

// class DI {
//   static initServices() async {
//     ///Common
//     Get.putAsync(() => SharedPreferencesService.getInstance());
//     await Future.delayed(const Duration(seconds: 1));

//     ///DataSource
//     Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(), fenix: true);
//     Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(), fenix: true);
//     Get.lazyPut<DoctorDataSource>(() => DoctorDataSourceImpl(), fenix: true);
//     Get.lazyPut<AppointmentDataSource>(() => AppointmentDataSourceImpl(),
//         fenix: true);
//     Get.lazyPut<PaymentDataSource>(() => PaymentDataSourceImpl(), fenix: true);
//     Get.lazyPut<MiscDataSource>(() => MiscDataSourceImpl(), fenix: true);

//     ///Repository
//     Get.lazyPut(() => AuthRepository(authDataSource: Get.find()), fenix: true);
//     Get.lazyPut(() => UserRepository(userDataSource: Get.find()), fenix: true);
//     Get.lazyPut(() => DoctorRepository(drDataSource: Get.find()), fenix: true);

//     Get.lazyPut(() => AppointmentRepository(), fenix: true);
//     Get.lazyPut(() => PaymentRepository(paymentDataSource: Get.find()),
//         fenix: true);

//     //controllers
//     Get.lazyPut(() => SplashController(userRepository: Get.find()),
//         fenix: true);
//     Get.lazyPut(() => LoginController(authRepository: Get.find()), fenix: true);
//     Get.lazyPut(() => ForgotPassController(authRepository: Get.find()),
//         fenix: true);
//     Get.lazyPut(() => SignupController(authRepository: Get.find()),
//         fenix: true);
//     Get.lazyPut(() => HomeController(userRepository: Get.find()), fenix: true);
//     Get.lazyPut(() => PersonSearchController(), fenix: true);
//     // Get.lazyPut(() => ProfileController(), fenix: true);
//     // Get.lazyPut(() => DoctorController(repository: Get.find()), fenix: true);
//     // Get.lazyPut(() => DoctorDetailsController(doctorRepository: Get.find()),
//     //     fenix: true);
//     // Get.lazyPut(() => AppointmentController(), fenix: true);
//     Get.lazyPut(() => ChildrenController(), fenix: true);
//     // Get.lazyPut(() => PaymentController(), fenix: true);
//     // Get.lazyPut(() => MedicationController(), fenix: true);
//     // Get.lazyPut(() => LabReportController(), fenix: true);
//     // Get.lazyPut(() => TreatmentController(), fenix: true);
//   }
// }

import 'package:get/get.dart';
import 'package:virualapi/datasource/appointment_datasource.dart';
import 'package:virualapi/datasource/auth_datasource.dart';
import 'package:virualapi/datasource/doctor_data_source.dart';
import 'package:virualapi/datasource/misc_datasource.dart';
import 'package:virualapi/datasource/payment_datasource.dart';
import 'package:virualapi/datasource/user_datasource.dart';
import 'package:virualapi/repos/appointment_repo.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/repos/doctor_repo.dart';
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/repos/payment_repo.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/shared_preference_service.dart';
// import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
import 'package:virualapi/ui/auth/login/login_controller.dart';
import 'package:virualapi/ui/auth/signup/signup_controller.dart';
import 'package:virualapi/ui/childrens/children_controller.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/person/person_search_controller.dart';
import 'package:virualapi/ui/splash/splash_controller.dart';
// // import 'package:virualapi/ui/doctor/doctor_controller.dart';
// // import 'package:virualapi/ui/doctor/doctor_details/doctor_details_controller.dart';
// // import 'package:virualapi/ui/home/home_controller.dart';
// // import 'package:virualapi/ui/lab_reports/lab_report_controller.dart';
// // import 'package:virualapi/ui/medication/medication_controller.dart';
// // import 'package:virualapi/ui/payment/payment_controller.dart';
// // import 'package:virualapi/ui/profile/profile_controller.dart';
// // import 'package:virualapi/ui/splash/splash_controller.dart';
// // import 'package:virualapi/ui/treatments/treatment_controller.dart';

class DI {
  static initServices() async {
    ///Common
    Get.putAsync(() => SharedPreferencesService.getInstance());
    await Future.delayed(const Duration(seconds: 1));

    ///DataSource
    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(), fenix: true);
    Get.lazyPut<UserDataSource>(() => UserDataSourceImpl(), fenix: true);
    Get.lazyPut<DoctorDataSource>(() => DoctorDataSourceImpl(), fenix: true);
    Get.lazyPut<AppointmentDataSource>(() => AppointmentDataSourceImpl(),
        fenix: true);
    Get.lazyPut<PaymentDataSource>(() => PaymentDataSourceImpl(), fenix: true);
    Get.lazyPut<MiscDataSource>(() => MiscDataSourceImpl(), fenix: true);

    ///Repository
    Get.lazyPut(() => AuthRepository(authDataSource: Get.find()), fenix: true);
    Get.lazyPut(() => UserRepository(userDataSource: Get.find()), fenix: true);
    Get.lazyPut(() => DoctorRepository(drDataSource: Get.find()), fenix: true);
    Get.lazyPut(() => MiscRepository(miscDataSource: Get.find()),
        fenix: true); // Register MiscRepository
    Get.lazyPut(() => AppointmentRepository(), fenix: true);
    Get.lazyPut(() => PaymentRepository(paymentDataSource: Get.find()),
        fenix: true);

    //controllers
    Get.lazyPut(() => SplashController(userRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => LoginController(authRepository: Get.find()), fenix: true);
    Get.lazyPut(() => ForgotPassController(authRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => SignupController(authRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => HomeController(userRepository: Get.find()), fenix: true);
    Get.lazyPut(() => PersonSearchController(), fenix: true);
    // Get.lazyPut(() => ProfileController(), fenix: true);
    // Get.lazyPut(() => DoctorController(repository: Get.find()), fenix: true);
    // Get.lazyPut(() => DoctorDetailsController(doctorRepository: Get.find()), fenix: true);
    // Get.lazyPut(() => AppointmentController(), fenix: true);
    Get.lazyPut(() => ChildrenController(), fenix: true);
    // Get.lazyPut(() => PaymentController(), fenix: true);
    // Get.lazyPut(() => MedicationController(), fenix: true);
    // Get.lazyPut(() => LabReportController(), fenix: true);
    // Get.lazyPut(() => TreatmentController(), fenix: true);
  }
}
