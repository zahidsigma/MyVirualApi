import 'package:get/get.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/ui/auth/forgotPassword/forgot_password.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/ui/auth/otp/otp_page.dart';
import 'package:virualapi/ui/auth/reset_password.dart';
import 'package:virualapi/ui/auth/signup/signup.dart';
import 'package:virualapi/ui/childrens/add_children.dart';
import 'package:virualapi/ui/home/home.dart';
import 'package:virualapi/ui/home/home_screeen.dart';
import 'package:virualapi/ui/on_boarding/on_boarding.dart';
import 'package:virualapi/ui/notification/notification.dart';
import 'package:virualapi/ui/profile/profile.dart';
import 'package:virualapi/ui/result/result.dart';
import 'package:virualapi/ui/splash/splash.dart';
import 'package:virualapi/ui/subscriptionscreen/subscription_plan.dart';
import 'package:virualapi/ui/support/support.dart';

import 'router_str.dart';

class PageRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.splashScreen,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: Routers.result,
      page: () => ResultScreen(),
    ),

    //  GetPage(
    //   name: Routers.personSearch,
    //   page: () => PersonSearch(),
    // ),
    // GetPage(
    //   name: Routers.PaymentScreen,
    //   page: () => PaymentScreen(),
    // ),

    // GetPage(
    //   name: Routers.MedicationDetails,
    //   page: () => MedicationDetails(),
    // ),

    GetPage(
      name: Routers.onBoarding,
      page: () => OnBoardingScreen(),
    ),

    GetPage(
      name: Routers.subscription,
      page: () => SubscriptionScreen(),
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
      name: Routers.home_scr,
      page: () => Home(),
    ),
    GetPage(
      name: Routers.profile,
      page: () => Profile(),
    ),
    GetPage(
      name: Routers.notification,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: Routers.support,
      page: () => Support(),
    ),

    GetPage(
      name: Routers.otp,
      page: () => OtpScreen(),
    ),
    GetPage(name: Routers.homeScreen, page: () => HomeScreen()),
    GetPage(name: Routers.forgotPassword, page: () => ForgotScreen()),
  ];
}
