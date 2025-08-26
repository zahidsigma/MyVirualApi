import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import 'package:virualapi/constants/config.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/datasource/user_datasource.dart';
import 'package:virualapi/models/user.dart';
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/services/firebase_service.dart';
import 'package:virualapi/ui/support/contact_us_coroller.dart';
import 'package:virualapi/utils/snackbar_util.dart';

enum ProfileView { profile, recentList, recentDetail }

class ProfileController extends GetxController {
  final UserRepository _userRepository = Get.find();
  final UserDataSource userDataSource = UserDataSourceImpl();
  final FirebaseService _firebaseService = FirebaseService();
  final ImagePicker _picker = ImagePicker();
  final Dio dio = Dio();
  Rx<File?> userImageFile = Rx<File?>(null);
  RxString profileImagePath = ''.obs;
  RxBool isBusy = false.obs;

  // Form fields
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString address = ''.obs;
  RxString city = ''.obs;
  RxString zipcode = ''.obs;

  late User? user;

  var currentView = ProfileView.profile.obs;

  void goToRecentList() {
    currentView.value = ProfileView.recentList;
  }

  void goToRecentDetail() {
    currentView.value = ProfileView.recentDetail;
  }

  void goToProfile() {
    currentView.value = ProfileView.profile;
  }

  void resetToProfile() {
    currentView.value = ProfileView.profile;
  }

  @override
  void onInit() {
    super.onInit();

    loadUserFromPrefs();
    print("ProfileController created: $hashCode");

    // Fetch fresh user data from API
  }

  void loadUserFromPrefs() {
    user = AppPreferences.getUserData();
    print("Loaded user from prefs: ${user?.data.name}, ${user?.data.email}");
    if (user != null) {
      _updateUserFields(user!);
    } else {
      // Initialize with empty values if no cached data
      name.value = '';
      email.value = '';
      phone.value = '';
      address.value = '';
      city.value = '';
      zipcode.value = '';
      profileImagePath.value = '';
    }
  }

  // Future<void> fetchUser() async {
  //   isBusy.value = true;
  //   final result = await _userRepository.fetchUser();
  //   isBusy.value = false;

  //   result.fold(
  //     (failure) => SnackbarUtil.error(message: failure.errorMessage.toString()),
  //     (userData) {
  //       AppPreferences.setUserData(userData);
  //       _updateUserFields(userData);
  //     },
  //   );
  // }

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
        name.value = userData.data.name ?? 'User';
        email.value = userData.data.email ?? '';
        phone.value = userData.data.phone ?? '';
        address.value = userData.data.address ?? '';
        city.value = userData.data.city ?? '';
        zipcode.value = userData.data.zipCode ?? '';
        profileImagePath.value = userData.data.image?.isNotEmpty == true
            ? "${AppConfig.imageBaseUrl}/${userData.data.image}"
            : '';
        AppPreferences.setUserData(userData.toJson());
      },
    );
  }

  void _updateUserFields(User userData) {
    if (userData.data == null) return;

    name.value = userData.data?.name ?? '';
    email.value = userData.data?.email ?? '';
    phone.value = userData.data?.phone ?? '';
    address.value = userData.data?.address ?? '';
    city.value = userData.data?.city ?? '';
    zipcode.value = userData.data?.zipCode ?? '';

    final imgPath = userData.data?.image ?? '';
    profileImagePath.value =
        imgPath.isNotEmpty ? "${AppConfig.imageBaseUrl}/$imgPath" : '';
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        userImageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      SnackbarUtil.error(message: 'Failed to pick image');
    }
  }

  Future<void> updateProfile(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      final File? imageFile = userImageFile.value;

      isBusy.value = true;

      final updateData = {
        'name': formData['name'],
        'email': formData['email'],
        'phone': formData['phone'],
        'address': formData['address'],
        'city': formData['city'],
        'zip': formData['zip'],
      };

      try {
        await userDataSource.updateUserwithProfile(updateData,
            imageFile: imageFile);

        final updatedData = Data(
          name: formData['name'],
          email: formData['email'],
          phone: formData['phone'],
          address: formData['address'],
          city: formData['city'],
          zipCode: formData['zip'],
          image: imageFile != null
              ? imageFile.path.split('/').last
              : user?.data?.image,
        );

        final updatedUser = User(
          status: true,
          data: updatedData,
          message: 'Profile updated successfully',
        );

        await AppPreferences.setUserData(updatedUser.toJson());
        _updateUserFields(updatedUser);

        SnackbarUtil.info(message: updatedUser.message ?? "Profile updated");
      } catch (e) {
        SnackbarUtil.error(message: "Failed to update profile");
      } finally {
        isBusy.value = false;
      }
    } else {
      SnackbarUtil.info(message: "Please fill all required fields");
    }
  }

  // Future<void> logoutUser() async {
  //   isBusy.value = true;
  //   await AppPreferences.clearUserData();
  //   Get.deleteAll();
  //   if (Get.isRegistered<ProfileController>()) {
  //     Get.delete<ProfileController>();
  //   }

  //   isBusy.value = false;
  //   Get.offAllNamed('/login');
  // }

//   Future<void> logoutUser({String? provider}) async {
//     isBusy.value = true;

//     try {
//       // Sign out social provider if any
//       if (provider == 'google.com') {
//         await _firebaseService.signOut();
//         print("Signed out from Google");
//       }
//       // For Apple, just sign out Firebase (no explicit Apple sign out)

//       // Sign out Firebase auth
//       // await _auth.signOut();
//       print("Signed out from Firebase");

//       // Clear local stored data
//       await AppPreferences.clearUserData();

//       // Clear controllers
//       Get.deleteAll();
//       if (Get.isRegistered<ProfileController>()) {
//         Get.delete<ProfileController>();
//       }

//       // Navigate to login screen
//       Get.offAllNamed('/login');
//     } catch (e) {
//       print("Error during logout: $e");
//       // Optionally show snackbar or error message here
//     } finally {
//       isBusy.value = false;
//     }
//   }
// }

  Future<void> logoutUser({String? provider}) async {
    isBusy.value = true;

    try {
      // 🔹 Fetch tokens inside (no need to pass them in)
      final token = await AppPreferences.getAuthToken();
      final fcmToken = await AppPreferences.getFCMToken();
      print("logout,$fcmToken");
      print("logout:$token");
      // 1. Call logout API
      final dio = Dio(BaseOptions(
        baseUrl:
            'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api',
      ));

      await dio.post(
        '/logout?fcm_token=$fcmToken',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      // print("Logout API called successfully", $options);

      // 2. Social provider handling
      if (provider == 'google.com') {
        await _firebaseService.signOut();
        print("Signed out from Google");
      } else if (provider == 'apple.com') {
        print("Apple user, skipping explicit provider logout");
      }

      // 3. Firebase logout
      // await _auth.signOut();
      print("Signed out from Firebase");

      // 4. Clear local data
      await AppPreferences.clearUserData();

      // 5. Clear controllers
      Get.deleteAll();
      if (Get.isRegistered<ProfileController>()) {
        Get.delete<ProfileController>();
      }

      // 6. Navigate to login
      Get.offAllNamed('/login');
    } catch (e) {
      print("Error during logout: $e");
    } finally {
      isBusy.value = false;
    }
  }
}
