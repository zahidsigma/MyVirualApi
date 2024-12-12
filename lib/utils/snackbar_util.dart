import 'dart:developer';

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
        backgroundColor: isInfo ? COLOR_ACCENT : Colors.green,
        borderRadius: 50,
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Metropolis',
          ),
        ));
  }

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
                color: Colors.white.withOpacity(0.9),
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
      homeCtrl.logout();
    }
    if (!isUnexpectedError) {
      Get.rawSnackbar(
        duration: duration,
        snackPosition: snackPosition,
        onTap: onTap,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.red,
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
