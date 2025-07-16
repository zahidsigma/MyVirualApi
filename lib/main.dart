import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/config.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/core/di.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/firebase_service.dart';
import 'package:virualapi/utils/context_less_nav.dart';
import 'core/routing/router.dart';
import 'services/app_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
// IMPORTANT: Replace 'your_app_name' with your actual Flutter project name

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Fully transparent status bar
    // Change to dark if needed
  ));
  // final firebaseService = FirebaseService();
  // await firebaseService.init();
  await AppPreferences.init();
  await DI.initServices();

  try {
    await dotenv.load(fileName: "assets/.env"); // Specify the full path
  } catch (e) {
    print('Error loading .env file: $e');
  }
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
  await Stripe.instance.applySettings();

  // await dotenv.load(fileName: "/Users/mac/Desktop/FlutterProjects/virualapi/.env");
  await Permission.camera.request();
  await Permission.microphone.request();
  AppConfig.setEnv(EnvironmentEnum.dev);
  print(AppConfig.baseUrl);
  // FirebaseService().init();
  HttpOverrides.global = MyHttpOverrides();
  print("Stripe Key Loaded: ${dotenv.env['STRIPE_PUBLISHABLE_KEY']}");

  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // designSize: const Size(375, 812), // XD Design Size
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'Poppinsr',
                useMaterial3: false,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: COLOR_PRIMARY,
                  // ···
                  brightness: Brightness.light,
                ),
                textTheme: const TextTheme(
                    titleLarge: TextStyle(
                        color: COLOR_PRIMARY,
                        fontSize: 25,
                        fontFamily: 'Poppinsb'))),
            initialRoute: Routers.splashScreen,
            getPages: PageRouter.pages,
            navigatorKey: ContextLess
                .navigatorkey, //Setting Global navigator key to navigate from anywhere without Context
            builder: EasyLoading.init(),
          );
        });
  }
}
