import 'package:get/get.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/ui/appointment/waiting_instant_doctor.dart';
import 'package:virualapi/ui/treatments/treatment_details.dart';
import 'package:virualapi/ui/treatments/treatments.dart';
import 'package:virualapi/ui/profile/update_profile.dart';
import 'package:virualapi/ui/review/review_screen.dart';
import 'package:virualapi/ui/appointment/appoinment_slot.dart';
import 'package:virualapi/ui/appointment/widgets/patient_selection_screen.dart';
import 'package:virualapi/ui/auth/forgotPassword/forgot_password.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/ui/auth/otp/otp_page.dart';
import 'package:virualapi/ui/auth/reset_password.dart';
import 'package:virualapi/ui/auth/signup/signup.dart';
import 'package:virualapi/ui/childrens/add_children.dart';
import 'package:virualapi/ui/doctor/doctor_details/doctor_details.dart';
import 'package:virualapi/ui/home/home_screen.dart';
import 'package:virualapi/ui/lab_reports/lab_report.dart';
import 'package:virualapi/ui/lab_reports/report_details.dart';
import 'package:virualapi/ui/medication/medication.dart';
import 'package:virualapi/ui/on_boarding/on_boarding.dart';
import 'package:virualapi/ui/payment/payment.dart';
import 'package:virualapi/ui/profile/profile_page.dart';
import 'package:virualapi/ui/appointment/reviewbooking.dart';
import 'package:virualapi/ui/splash/splash.dart';
import 'package:virualapi/ui/appointment/upload_image.dart';

import '../../ui/doctor/doctor_screen.dart';
import 'router_str.dart';

class PageRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routers.PaymentScreen,
      page: () => PaymentScreen(),
    ),
    GetPage(
      name: Routers.LabReportDetails,
      page: () => LabReportDetails(),
    ),

    GetPage(
      name: Routers.LabReportScreen,
      page: () => LabReportScreen(),
    ),
    // GetPage(
    //   name: Routers.MedicationDetails,
    //   page: () => MedicationDetails(),
    // ),
    GetPage(
      name: Routers.MedicationScreen,
      page: () => MedicationScreen(),
    ),
    GetPage(
      name: Routers.onBoarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: Routers.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routers.signUp,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: Routers.profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routers.otp,
      page: () => OtpScreen(),
    ),
    GetPage(name: Routers.homeScreen, page: () => HomeScreen()),
    GetPage(name: Routers.forgotPassword, page: () => ForgotScreen()),
    GetPage(
      name: Routers.doctors,
      page: () => DoctorScreen(),
    ),
    GetPage(
      name: Routers.doctorDetails,
      page: () => DoctorDetails(),
    ),
    GetPage(
      name: Routers.appointmentSlot,
      page: () => AppoinmentSlot(),
    ),
    GetPage(
      name: Routers.patientSelection,
      page: () => PatientSelectionScreen(),
    ),
    GetPage(
      name: Routers.addChild,
      page: () => AddChildren(),
    ),
    GetPage(
      name: Routers.uploadImage,
      page: () => UploadImage(),
    ),
    GetPage(
      name: Routers.reviewBooking,
      page: () => ReviewBooking(),
    ),
    GetPage(
      name: Routers.resetPassword,
      page: () => ResetPassword(),
    ),
    GetPage(
      name: Routers.reviewScreen,
      page: () => ReviewScreen(),
    ),
    GetPage(
      name: Routers.waitingInstantDoctor,
      page: () => WaitingInstantDoctor(),
    ),
    GetPage(
      name: Routers.updateProfile,
      page: () => UpdateProfile(),
    ),
    GetPage(
      name: Routers.treatments,
      page: () => Treatments(),
    ),
    GetPage(
      name: Routers.treatmentDetails,
      page: () => TreatmentDetails(),
    ),
  ];
}
