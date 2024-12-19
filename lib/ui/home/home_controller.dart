import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/models/specialties.dart';
import 'package:virualapi/models/telemed_session.dart';
import 'package:virualapi/repos/appointment_repo.dart';
import 'package:virualapi/repos/doctor_repo.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/utils/image_utils.dart';
import '../../../core/error/failure.dart';
import '../../models/user.dart';
import '../../utils/snackbar_util.dart';

class HomeController extends GetxController {
  HomeController({required UserRepository userRepository});
  //      : _userRepository = userRepository;

  // final UserRepository _userRepository;
  // final DoctorRepository _doctorRepository = Get.find();
  // final AppointmentRepository _appointmentRepository = Get.find();

  // RxBool isBusy = false.obs;
  // RxBool isUpcomingApptsLoading = false.obs;
  // RxBool isCategoryLoading = false.obs;
  // RxBool isExpanded = true.obs;
  // Rx<User?> user = User().obs;
  // RxList<Specialties> specialties = RxList<Specialties>();
  // RxList<TelemedSession> sessions = RxList<TelemedSession>();
  // RxList<Map<String, dynamic>> recentConsultations =
  //     RxList<Map<String, dynamic>>();
  // RxList<Map<String, dynamic>> upcomingAppts = RxList();
  // RxMap<String, dynamic> ongoingSession = RxMap();
  // List<String> keywords = [];
  final GlobalKey<ScaffoldState> homeKey = GlobalKey(); // Create a key
  var bottomWidgetKey = GlobalKey<State<BottomNavigationBar>>();
  // final Rx<File?> userImageSource = Rx<File?>(null);
  // RxDouble bmi = 0.0.obs;

  List<String> priorityCategories = [
    'General Physician',
    'Family Medicine',
    'Dentistry',
    'Pediatric',
    'ENT',
    'Dermatology',
    'Pain Management',
    'Gynaecology',
    'Cardiology',
  ];
  final List<Map<String, dynamic>> regionalPartners = [
    {
      "name": "Sehet.pk",
      "image": "assets/images/Sehat_Logo.png",
      "url": "https://sehet.pk/services"
    }
  ];

  @override
  void onInit() {
    super.onInit();
    // fetchUser();
    // fetchTelemedSession();
    // getRecentConsultations();
    // getUpcomingAppts();
    // loadJson();
    // var cachedSession = AppPreferences.getData(AppPreferences.session);
    // if (cachedSession.isNotEmpty) {
    //   var isPast = isHalfHourPast(cachedSession['sessionStartedAt']);
    //   if (!isPast)
    //     ongoingSession.value = cachedSession;
    //   else
    //     AppPreferences.removeData(AppPreferences.session);
    // }
  }

  bool isHalfHourPast(int millisecondsSinceEpoch) {
    var date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch,
        isUtc: true);
    return date.add(Duration(minutes: 30)).isBefore(DateTime.now());
  }

  logout() {
    AppPreferences.removeUserData();
    Get.deleteAll();
    Get.offAllNamed(Routers.login);
  }

  // double calculateBMI(double weight, double heightInFeet) {
  //   // Convert height from feet to centimeters
  //   double heightInCm = heightInFeet * 30.48; // 1 foot = 30.48 centimeters
  //   // Convert height from centimeters to meters
  //   double heightInM = heightInCm / 100;
  //   // Calculate BMI
  //   double bmi = weight / (heightInM * heightInM);
  //   return bmi;
  // }
  // double feetAndInchesToFeet(int feet, int inches) {
  //   return feet + inches / 12.0;
  // }

  // double calculateBMI(double weightInLbs, double heightInFt) {
  //   print("calculateBMI $weightInLbs $heightInFt");
  //   // Convert height from feet to inches
  //   double heightInInches = heightInFt * 12; // 1 foot = 12 inches

  //   // Calculate BMI
  //   double bmi = (weightInLbs / (heightInInches * heightInInches)) * 703;
  //   return bmi;
  // }

  // loadJson() async {
  //   try {
  //     String data = await DefaultAssetBundle.of(Get.context!)
  //         .loadString("assets/json/search_keywords.json");
  //     final jsonResult = jsonDecode(data); //latest Dart
  //     keywords = List<String>.from(jsonResult);
  //     print(jsonResult);
  //   } catch (e) {
  //     print("e $e");
  //   }
  // }

  // getImage() async {
  //   var file = await ImageUtils.pickImage();
  //   if (file != null) {
  //     userImageSource.value = file;
  //     uploadImage();
  //   }
  // }

  // uploadImage() async {
  //   var result = await _userRepository.uploadImage(
  //       file: userImageSource.value!, fileType: FileType.profilepic.name);
  //   result.fold((failure) {
  //     isBusy.value = false;
  //     SnackbarUtil.error(
  //       logMessage: (failure as Error).errorMessage.toString(),
  //       logScreenName: Routers.homeScreen,
  //       logMethodName: 'uploadImage',
  //       message: (failure).errorMessage.toString(),
  //     );
  //   }, (r) => {});
  // }

  // fetchUser({bool fetchOtherData = true}) async {
  //   isBusy.value = true;

  //   var result = await _userRepository.fetchUser();
  //   isBusy.value = false;

  //   result.fold(
  //     (failure) {
  //       SnackbarUtil.error(
  //         logMessage: (failure as Error).errorMessage.toString(),
  //         logScreenName: Routers.homeScreen,
  //         logMethodName: 'fetchUser',
  //         message: (failure).errorMessage.toString(),
  //       );
  //     },
  //     (r) {
  //       user.value = r;
  //       Get.put<User>(r);
  //       AppPreferences.setUserData(r);
  //       if (r.height != null && r.weight != null) {
  //         double height = r.height!;
  //         double heightInFt = feetAndInchesToFeet(
  //             int.parse(height.toString().split('.')[0]),
  //             int.parse(height.toString().split('.')[1].substring(
  //                 0, height.toString().split('.')[1].length > 1 ? 2 : 1)));
  //         bmi.value = calculateBMI(r.weight!, heightInFt);
  //       }
  //       if (fetchOtherData) {
  //         fetchSpecialties();
  //       }
  //     },
  //   );
  // }

  // fetchSpecialties() async {
  //   isCategoryLoading.value = true;

  //   var result = await _doctorRepository.getSpecialties();
  //   isCategoryLoading.value = false;

  //   result.fold(
  //     (failure) {
  //       SnackbarUtil.error(
  //         logMessage: (failure as Error).errorMessage.toString(),
  //         logScreenName: Routers.homeScreen,
  //         logMethodName: 'fetchSpecialties',
  //         message: (failure).errorMessage.toString(),
  //       );
  //     },
  //     (r) {
  //       r.sort((a, b) {
  //         int indexA = priorityCategories.indexOf(a.name!);
  //         int indexB = priorityCategories.indexOf(b.name!);
  //         if (indexA == -1) indexA = priorityCategories.length;
  //         if (indexB == -1) indexB = priorityCategories.length;
  //         return indexA.compareTo(indexB);
  //       });
  //       specialties.value = r;
  //     },
  //   );
  // }

  // fetchTelemedSession() async {
  //   isBusy.value = true;
  //   final Login? _user = AppPreferences.getLoginData();
  //   if (_user == null) return;
  //   var result = await _appointmentRepository.getTelemedSession(_user.userId!);
  //   isBusy.value = false;

  //   result.fold(
  //     (failure) {
  //       SnackbarUtil.error(
  //         logMessage: (failure as Error).errorMessage.toString(),
  //         logScreenName: Routers.homeScreen,
  //         logMethodName: 'fetchTelemedSession',
  //         message: (failure).errorMessage.toString(),
  //       );
  //     },
  //     (r) {
  //       sessions.value =
  //           r.where((element) => element.terminatedBy == null).toList();
  //     },
  //   );
  // }

  // getRecentConsultations() async {
  //   var result = await _appointmentRepository.getRecentConsultations();
  //   isBusy.value = false;

  //   result.fold(
  //     (failure) {
  //       SnackbarUtil.error(
  //         logMessage: (failure as Error).errorMessage.toString(),
  //         logScreenName: Routers.homeScreen,
  //         logMethodName: 'fetchSpecialties',
  //         message: (failure).errorMessage.toString(),
  //       );
  //     },
  //     (r) {
  //       recentConsultations.value = r;
  //     },
  //   );
  // }

  // getUpcomingAppts() async {
  //   isUpcomingApptsLoading.value = true;
  //   final Login? _user = AppPreferences.getLoginData();
  //   if (_user == null) return;
  //   var result = await _appointmentRepository.getAppointments(
  //       _user.userId!, DateFormat("yyyy-MM-dd").format(DateTime.now()));
  //   isUpcomingApptsLoading.value = false;

  //   result.fold(
  //     (failure) {
  //       SnackbarUtil.error(
  //         logMessage: (failure as Error).errorMessage.toString(),
  //         logScreenName: Routers.homeScreen,
  //         logMethodName: 'getUpcomingAppts',
  //         message: (failure).errorMessage.toString(),
  //       );
  //     },
  //     (r) {
  //       upcomingAppts.value = r
  //           .where((element) =>
  //               element['status'] == "PENDING" ||
  //               element['status'] == "CONFIRMED")
  //           .toList();
  //     },
  //   );
  // }

  // cancelAppt(id) async {
  //   var result = await _appointmentRepository.cancelAppt(id);
  //   isBusy.value = false;
  //   result.fold(
  //     (failure) {
  //       SnackbarUtil.error(
  //         logMessage: (failure as Error).errorMessage.toString(),
  //         logScreenName: Routers.homeScreen,
  //         logMethodName: 'getUpcomingAppts',
  //         message: (failure).errorMessage.toString(),
  //       );
  //     },
  //     (r) {
  //       getUpcomingAppts();
  //     },
  //   );
  // }
}
