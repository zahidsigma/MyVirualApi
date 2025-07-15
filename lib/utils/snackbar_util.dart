import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/home/home_controller.dart';

class SnackbarUtil {
  static bool isLoggedOut = false;

  static void info({
    required String message,
    bool isInfo = true,
    Function(dynamic)? onTap,
    Duration duration = const Duration(seconds: 5),
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    Get.rawSnackbar(
      duration: duration,
      snackPosition: snackPosition,
      onTap: onTap,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.black,
      borderRadius: 50,
      boxShadows: [
        const BoxShadow(color: Colors.black12, spreadRadius: 4, blurRadius: 8)
      ],
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: 'Metropolis',
        ),
      ),
    );
  }

  // static void info({
  //   required String message,
  //   bool isInfo = true,
  //   Function(dynamic)? onTap,
  //   Duration duration = const Duration(seconds: 5),
  //   SnackPosition snackPosition = SnackPosition.TOP,
  // }) {
  //   Get.rawSnackbar(
  //     duration: duration,
  //     snackPosition: snackPosition,
  //     onTap: onTap,
  //     margin: const EdgeInsets.symmetric(horizontal: 20),
  //     borderRadius: 50.0,
  //     messageText: Stack(
  //       children: [
  //         Positioned.fill(
  //           child: BackdropFilter(
  //             filter: ImageFilter.blur(
  //                 sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
  //             child: Container(
  //                 color: (isInfo ? Colors.black : Colors.black)
  //                     .withValues(alpha: 0.3) // Adjust opacity
  //                 ),
  //           ),
  //         ),
  //         Center(
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0), // Add padding for the text
  //             child: Text(
  //               message,
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(
  //                 color:
  //                     Colors.white, // Changed text color for better visibility
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w400,
  //                 fontFamily: 'Metropolis',
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     backgroundColor:
  //         Colors.transparent, // Make the rawSnackbar background transparent
  //     padding: EdgeInsets.zero, // Remove default padding
  //     boxShadows: [
  //       BoxShadow(
  //         color: Colors.black.withValues(alpha: 0.2),
  //         spreadRadius: 2,
  //         blurRadius: 5,
  //         offset: const Offset(0, 3),
  //       ),
  //     ],
  //   );
  // }

  static void warning({
    required BuildContext context,
    required String title,
    required String message,
    Function(dynamic)? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.rawSnackbar(
        duration: duration,
        snackPosition: snackPosition,
        onTap: onTap,
        titleText: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        messageText: Text(
          message,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
        ));
  }

  static void error({
    String? title,
    required String message,
    Function(dynamic)? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackPosition snackPosition = SnackPosition.TOP,
    String? logScreenName = '',
    String? logMethodName = '',
    String? logMessage = '',
  }) {
    log('$logScreenName ----> $logMethodName ----> $logMessage');
    print(Get.currentRoute);
    bool isUnexpectedError =
        message == "Security token is either missing or invalid" ||
            message.contains("connection took longer") ||
            message.contains("took longer than");
    if (isUnexpectedError && Get.currentRoute != Routers.login) {
      var homeCtrl = Get.find<HomeController>();
      // homeCtrl.logout();
    }
    if (!isUnexpectedError) {
      Get.rawSnackbar(
        duration: duration,
        snackPosition: snackPosition,
        onTap: onTap,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.black,
        borderRadius: 50,
        boxShadows: [
          const BoxShadow(color: Colors.black12, spreadRadius: 4, blurRadius: 8)
        ],
        messageText: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'Metropolis',
          ),
        ),
      );
    }
  }
}
