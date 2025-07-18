import 'package:get/get.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/ui/Addon/Addon_screen.dart';
import 'package:virualapi/ui/ConfirmScreen/confirm_screen.dart';
import 'package:virualapi/ui/DetailsScreen/fileds.dart';
import 'package:virualapi/ui/PrivacyPolicy/privac_pplicy.dart';
import 'package:virualapi/ui/RecentActivity/recent_activity.dart';
import 'package:virualapi/ui/Review/review_screen.dart';
import 'package:virualapi/ui/Stripe/stripe.dart';
import 'package:virualapi/ui/about/aboutScreen.dart';

import 'package:virualapi/ui/auth/forgotPassword/forgot_password.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/ui/auth/otp/otp_page.dart';
import 'package:virualapi/ui/auth/reset_password.dart';
import 'package:virualapi/ui/auth/signup/signup.dart';
import 'package:virualapi/ui/childrens/add_children.dart';
import 'package:virualapi/ui/compare/compare_screen.dart';
import 'package:virualapi/ui/home/home.dart';
import 'package:virualapi/ui/home/home_screeen.dart';
import 'package:virualapi/ui/on_boarding/on_boarding.dart';
import 'package:virualapi/ui/notification/notification.dart';
import 'package:virualapi/ui/profile/edit_profile.dart';
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

    GetPage(
      name: Routers.resetPassword,
      page: () => ResetPassword(),
    ),

    GetPage(
      name: Routers.details,
      page: () => FieldsScreen(),
    ),

    GetPage(
      name: Routers.addons,
      page: () => AddonScreen(),
    ),
    GetPage(
      name: Routers.compare,
      page: () => CompareScreen(),
    ),
    GetPage(
      name: Routers.confirmScreen,
      page: () => ConfirmScreen(),
    ),

    GetPage(
      name: Routers.stripe,
      page: () => PaymentScreen(),
    ),
    // GetPage(
    //   name: Routers.stripe,
    //   page: () {
    //     final args = Get.arguments as Map<String, dynamic>;

    //     return StripeSandbox(
    //       useremail: args['useremail'] ?? '',
    //       tahoeId: args['tahoeId'] ?? '',
    //       selectedItems:
    //           List<Map<String, dynamic>>.from(args['selectedItems'] ?? []),
    //       isComprehensive: args['isComprehensive'] ?? false,
    //     );
    //   },
    // ),

    // GetPage(
    //   name: Routers.addons,
    //   page: () => AddonScreen(),
    // ),

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
      name: Routers.reviewScreen,
      page: () => ReviewScreen(
        onBack: () {
          // Your back action, e.g., navigate back or update controller state
          Get.back();
        },
      ),
    ),
    GetPage(
      name: Routers.about,
      page: () => AboutScreen(
        onBack: () {
          // Your back action, e.g., navigate back or update controller state
          Get.back();
        },
      ),
    ),

    GetPage(
      name: Routers.privacy,
      page: () => PrivacyScreen(
        onBack: () {
          // Your back action, e.g., navigate back or update controller state
          Get.back();
        },
      ),
    ),

    // GetPage(
    //   name: Routers.recent_Activiy,
    //   page: () => RecentActivity(),
    // ),

    GetPage(
      name: Routers.otp,
      page: () => OtpScreen(),
    ),
    GetPage(name: Routers.homeScreen, page: () => HomeScreen()),
    GetPage(name: Routers.forgotPassword, page: () => ForgotScreen()),
  ];
}
