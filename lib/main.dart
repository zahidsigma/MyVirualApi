import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/di.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/firebase_service.dart';
import 'package:virualapi/utils/context_less_nav.dart';
import 'core/routing/router.dart';
import 'services/app_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await AppPreferences.init();
  await DI.initServices();
  await Permission.camera.request();
  await Permission.microphone.request();
  // FirebaseService().init();
  HttpOverrides.global = MyHttpOverrides();
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
        designSize: const Size(375, 812), // XD Design Size
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
