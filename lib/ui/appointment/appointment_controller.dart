import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/user.dart';
import 'package:virualapi/repos/appointment_repo.dart';
import 'package:virualapi/repos/doctor_repo.dart';
import 'package:virualapi/repos/payment_repo.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/ui/doctor/doctor_details/doctor_details_controller.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/webview/app_webview.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/utils/util.dart';
import '../../../core/error/failure.dart';
import 'package:timezone/timezone.dart' as tz;

class AppointmentController extends GetxController {
  RxBool isBusy = false.obs;
  final _userRepository = Get.find<UserRepository>();
  final _paymentRepository = Get.find<PaymentRepository>();
  final _appointmentRepository = Get.find<AppointmentRepository>();
  final _doctorRepository = Get.find<DoctorRepository>();
  RxMap userExt = {}.obs;
  RxMap patient = {}.obs;
  User user = AppPreferences.getUserData()!;
  var doctorCtrl = Get.find<DoctorDetailsController>();
  final reasonTextController = TextEditingController();
  final durationTextController = TextEditingController();
  final couponController = TextEditingController();

  RxList<Map<String, dynamic>> slots = RxList();
  RxString timeZone = "".obs;
  RxMap slot = {}.obs;
  Rx<DateTime> selectedDate = Rx(DateTime.now());
  bool isInstant = true;
  RxString imagePath = "".obs;
  RxBool isWaitingForDoctor = false.obs;
  RxDouble totalAmount = 0.0.obs;
  RxBool isCouponApplied = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserExt();
    fetchSlots(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  double getDiscountAmount(Map<String, dynamic> response, double amount) {
    if (response['discount_amount'] ?? 0 > 0) {
      return double.parse(response["discount_amount"].toString());
    } else if (response["discount_rate"] > 0) {
      return amount *
          (double.parse(response["discount_rate"].toString()) / 100);
    } else {
      return 0;
    }
  }

  onDateSelected(DateTime date) {
    selectedDate.value = date;
    fetchSlots(DateFormat('yyyy-MM-dd').format(date));
  }

  onContinueBooking() {
    if (slot.isEmpty) {
      SnackbarUtil.info(message: "Please select slot");
    } else {
      isInstant = false;
      Get.toNamed(Routers.patientSelection);
    }
  }

  onContinue() {
    var doctorCtrl = Get.find<DoctorDetailsController>();
    if (patient.isEmpty) {
      SnackbarUtil.info(message: "Please select patient");
    } else if (reasonTextController.text.isEmpty) {
      SnackbarUtil.info(message: "Reason field is required");
    } else if (durationTextController.text.isEmpty) {
      SnackbarUtil.info(message: "Duration field is required");
    } else {
      totalAmount.value = doctorCtrl.doctor.value.consultingCost ?? 0.0;
      Get.toNamed(Routers.uploadImage);
    }
  }

  onCreateAppt() {
    if (patient.isEmpty) {
      SnackbarUtil.info(message: "Please select patient");
    } else if (reasonTextController.text.isEmpty) {
      SnackbarUtil.info(message: "Reason field is required");
    } else if (durationTextController.text.isEmpty) {
      SnackbarUtil.info(message: "Duration field is required");
    } else {
      var doctor = Get.find<DoctorDetailsController>().doctor.value;
      // var user = Get.find<User>();
      var payload = {
        "doctor_id": doctor.username,
        "doctor_name": doctor.name,
        "patient_id": user.username,
        "patient_name": patient["name"],
        "reason": reasonTextController.text,
        "details": "Problem since: ${durationTextController.text}"
      };
      createInstantVisit(payload);
    }
  }

  checkUploadImage() {
    if (imagePath.isNotEmpty) {
      uploadImage();
    } else {
      Get.toNamed(Routers.reviewBooking);
    }
  }

  createAppt() {
    var doctor = Get.find<DoctorDetailsController>().doctor.value;
    var payload = {
      "doctor_id": doctor.username,
      "doctor_name": doctor.name,
      "patient_id": user.username,
      "patient_name": patient["name"],
      "reason": reasonTextController.text,
      "details": "Problem since: ${durationTextController.text}"
    };
    if (isInstant)
      createInstantVisit(payload);
    else {
      payload["start_date"] =
          DateFormat('yyyy-MM-dd').format(selectedDate.value);
      //selectedDate.value.toIso8601String();
      payload["slot"] = slot["data"];
      // payload["slot"] = getSlot(slot["data"]);
      createAppointment(payload);
    }
  }

  makePayment() async {
    isBusy.value = true;
    var doctorCtrl = Get.find<DoctorDetailsController>();
    var doctor = doctorCtrl.doctor.value;
    var data = {
      "doctorId": doctor.username,
      "doctorName": doctor.name,
      "patientId": user.username,
      "patientEmail": user.email,
      "patientName": patient['name'],
      "discountCode":
          isCouponApplied.isTrue ? couponController.text.toUpperCase() : null
    };
    var result = await _paymentRepository.makeAbhipayPayment(data);
    isBusy.value = false;
    result.fold((failure) {
      isBusy.value = false;
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.reviewBooking,
        logMethodName: 'makePayment',
        message: (failure).errorMessage.toString(),
      );
    }, (r) => Get.to(AppWebview(uri: r, title: "Appointment Payment")));
  }

  uploadImage() async {
    var result = await _userRepository.uploadImage(
        file: File(imagePath.value), fileType: FileType.labreport.name);
    result.fold((failure) {
      isBusy.value = false;
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.profile,
        logMethodName: 'uploadImage',
        message: (failure).errorMessage.toString(),
      );
    }, (r) => Get.toNamed(Routers.reviewBooking));
  }

  createInstantVisit(data) async {
    isBusy.value = true;

    var result = await _appointmentRepository.createInstantVisit(data: data);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.patientSelection,
        logMethodName: 'fetchUserExt',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      isWaitingForDoctor.value = true;
      Get.toNamed(Routers.waitingInstantDoctor);
      // Get.toNamed(Routers.homeScreen);
      // HomeController homeController = Get.find();
      // homeController.fetchTelemedSession();
      // Get.delete<AppointmentController>();
      // SnackbarUtil.info(message: "Appointment created successfully!");
      SnackbarUtil.info(message: "Request sent successfully!", isInfo: false);
    });
  }

  fetchUserExt() async {
    isBusy.value = true;

    var result = await _userRepository.fetchUserExt();
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.patientSelection,
        logMethodName: 'fetchUserExt',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      if (!r.containsKey("familyMembers")) {
        r["familyMembers"] = {};
      }
      r["familyMembers"][user.username] = {
        "name": user.name,
        "relation": "Self",
        "gender": user.gender
      };
      userExt.value = r;
      patient.value = r["familyMembers"][user.username];
    });
  }

  fetchSlots(date) async {
    isBusy.value = true;
    if (slots.isNotEmpty) {
      slots.clear();
      slot.value = {};
    }
    var doctorCtrl = Get.find<DoctorDetailsController>();

    var result = await _doctorRepository.getAvailableSlots(
        username: doctorCtrl.doctor.value.username!, date: date);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.appointmentSlot,
        logMethodName: 'fetchSlots',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      if (r.containsKey("slots")) {
        r["slots"].forEach((item) {
          var display = formattedTimeRange(item);
          if (display.isNotEmpty) slots.add({"data": item, "display": display});
        });
        timeZone.value =
            "${r['doctor_timezone'].toString().split('/')[1].replaceAll("_", " ")} time";
      }
    });
  }

  createAppointment(data) async {
    isBusy.value = true;

    var result = await _appointmentRepository.createAppointment(data: data);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.patientSelection,
        logMethodName: 'fetchUserExt',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      Util.showConfirmationDialog(
          Get.context!,
          'Your Appoitment request has been successfully received!',
          'Our staff is considering your appointment request and will confirm promptly. Please look for the confirmation text \n\n Thank you for booking appointment through Prodoc',
          'Close',
          "Close",
          _onClose,
          isConfirmation: false);
      Get.offAndToNamed(Routers.homeScreen);
      // SnackbarUtil.info(
      //     message: "Appointment created successfully!", isInfo: false);

      var homectrl = Get.find<HomeController>();
      homectrl.getUpcomingAppts();
    });
  }

  _onClose() {
    Get.delete<AppointmentController>();
    Get.toNamed(Routers.homeScreen);
  }

  validateCoupon() async {
    if (couponController.text.isEmpty) {
      SnackbarUtil.info(
        message: "Coupon is required",
      );
      return;
    }
    ;
    isBusy.value = true;

    var result = await _appointmentRepository.validateCoupon(
        coupon: couponController.text.toUpperCase());
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.patientSelection,
        logMethodName: 'fetchUserExt',
        message: failure.errorMessage == "Object not found"
            ? "Invalid coupon code"
            : failure.errorMessage.toString(),
      );
    }, (r) {
      var discount = getDiscountAmount(r, totalAmount.value);
      totalAmount.value = totalAmount.value - discount;
      isCouponApplied.value = true;
    });
  }

  String formattedTimeRange(List<dynamic> timeRange) {
    if (timeRange.length != 2) {
      return 'Invalid time range';
    }

    int startTime = timeRange[0];
    DateTime now = DateTime.now();
    bool isToday = DateFormat.yMMMEd().format(selectedDate.value) ==
        DateFormat.yMMMEd().format(now);
    int currentHour = now.hour * 100 + now.minute;
    if (isToday && startTime < currentHour) {
      // Time range has already passed
      return '';
    }
    // int endTime = timeRange[1];

    String formattedStartTime = formatTimeWithAmPm(startTime);
    // String formattedEndTime = formatTimeWithAmPm(endTime);

    return '$formattedStartTime';
  }

  String formatTime(int time) {
    String formattedTime = time.toString();
    if (formattedTime.length == 3) {
      formattedTime = '0' + formattedTime;
    }
    return formattedTime.substring(0, 2) + ':' + formattedTime.substring(2);
  }

  String formatTimeWithAmPm(int time) {
    String formattedTime = time.toString();
    if (formattedTime.length == 3) {
      formattedTime = '0' + formattedTime;
    }

    int hours = int.parse(formattedTime.substring(0, 2));
    int minutes = int.parse(formattedTime.substring(2));

    String amPm = hours < 12 ? 'AM' : 'PM';

    if (hours > 12) {
      hours -= 12;
    } else if (hours == 0) {
      hours = 12;
    }
    // var locations = tz.timeZoneDatabase.locations;
    // String sourceTimezone = "America/New_York";
    // var detroit = tz.getLocation(sourceTimezone);
    // // Define the target timezone
    // String targetTimezone = "Asia/Karachi";
    // var date = selectedDate.value;
    // // Define the source time
    // tz.TZDateTime sourceTime = tz.TZDateTime(detroit, date.year, date.month,
    //     date.day, hours, minutes, hours, minutes);

    // // Convert source time to local time
    // tz.TZDateTime localTime =
    //     tz.TZDateTime.from(sourceTime, tz.getLocation(targetTimezone));
    // return DateFormat('hh:mm a').format(localTime);

    return '$hours:${minutes.toString().padLeft(2, '0')} $amPm';
  }

  List<String> getSlot(List<dynamic> slot) {
    List<String> _slot = [];
    slot.forEach((time) {
      String formattedTime = time.toString();
      if (formattedTime.length == 3) {
        formattedTime = '0' + formattedTime;
      }

      int hours = int.parse(formattedTime.substring(0, 2));
      int minutes = int.parse(formattedTime.substring(2));
      String sourceTimezone = "America/New_York";
      var detroit = tz.getLocation(sourceTimezone);
      // Define the target timezone
      String targetTimezone = "Asia/Karachi";
      var date = selectedDate.value;
      // Define the source time
      tz.TZDateTime sourceTime = tz.TZDateTime(detroit, date.year, date.month,
          date.day, hours, minutes, hours, minutes);

      // Convert source time to local time
      tz.TZDateTime localTime =
          tz.TZDateTime.from(sourceTime, tz.getLocation(targetTimezone));
      _slot.add(
          "${localTime.hour}${localTime.minute < 10 ? '${localTime.minute}0' : localTime.minute}");
    });
    return _slot;

    // return '$hours:${minutes.toString().padLeft(2, '0')} $amPm';
  }
}
