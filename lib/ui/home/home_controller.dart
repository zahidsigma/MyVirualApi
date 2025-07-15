import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/user.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/utils/image_utils.dart';
import '../../core/error/failure.dart';
import '../../utils/snackbar_util.dart';

enum DrawerScreen { legit, about, review, privacy, none }

class HomeController extends GetxController {
  HomeController({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  final GlobalKey<ScaffoldState> homeKey = GlobalKey();
  final GlobalKey<State<BottomNavigationBar>> bottomWidgetKey = GlobalKey();
  var activeDrawerScreen = DrawerScreen.none.obs;
  final Rx<User?> user = Rx<User?>(null);
  final RxBool isBusy = false.obs;
  final Rx<File?> userImageSource = Rx<File?>(null);
  final RxString userName = RxString('Haris');
  RxString name = RxString('hay');
  RxString email = RxString('hay');

  void openDrawerScreen(DrawerScreen screen) {
    activeDrawerScreen.value = screen;
    homeKey.currentState?.closeDrawer();
  }

  void closeDrawerScreen() {
    activeDrawerScreen.value = DrawerScreen.none;
  }

  @override
  void onInit() {
    super.onInit();

    if (AppPreferences.isLoggedIn()) {
      fetchUser();
    } else {
      print("User is not logged in — skipping fetchUser()");
    }
  }

  bool isHalfHourPast(int millisecondsSinceEpoch) {
    final date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch,
        isUtc: true);
    return date.add(const Duration(minutes: 30)).isBefore(DateTime.now());
  }

  Future<void> loadJson() async {
    try {
      final data = await DefaultAssetBundle.of(Get.context!)
          .loadString("assets/json/search_keywords.json");
      final jsonResult = jsonDecode(data);
      final keywords = List<String>.from(jsonResult);
      print(keywords);
    } catch (e) {
      print("loadJson error: $e");
    }
  }

  Future<void> fetchUser({bool fetchOtherData = true}) async {
    isBusy.value = true;

    final result = await _userRepository.fetchUser();
    isBusy.value = false;

    result.fold(
      (failure) {
        print("Error: ${failure.errorMessage}"); // Log detailed error message
        SnackbarUtil.error(
          logMessage: (failure as Error).errorMessage.toString(),
          logScreenName: Routers.homeScreen,
          logMethodName: 'fetchUser',
          message: failure.errorMessage.toString(),
        );
      },
      (userData) {
        print("Fetched User Data: ${userData.toJson()}"); // Log user data
        user.value = userData;
        userName.value = userData.data.name ?? 'User';
        AppPreferences.setUserData(userData);
        Get.put<User>(userData); // Optional if needed elsewhere
      },
    );
  }
}
