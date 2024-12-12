import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/ui/doctor/doctor_details/doctor_details_controller.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/horizontal_calendar.dart';
import 'package:collection/collection.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class AppoinmentSlot extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    var drDetailsController = Get.find<DoctorDetailsController>();
    var color = Color(0xffD2E8F0);
    return Scaffold(
        backgroundColor: COLOR_BACKGROUND,
        body: SafeArea(
            child: Obx(() =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: IconButton(
                          onPressed: Get.back,
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xffF7F8F9),
                          ))),
                  HorizontalCalendar(
                    onChanged: controller.onDateSelected,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(top: 50, bottom: 10),
                      width: getScreenWidth(context),
                      decoration: const BoxDecoration(
                          color: Color(0xffF7F8F9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeTitle(title: "Slots Available"),
                            AppSpacerH(10),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text:
                                      "${drDetailsController.doctor.value.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                      color: COLOR_ACCENT,
                                      wordSpacing: 1),
                                  children: [
                                    TextSpan(
                                      text: " has below time slots available",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          color: Colors.black38,
                                          wordSpacing: 1),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: "Pick a time for ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Colors.black45,
                                      wordSpacing: 1),
                                  children: [
                                    TextSpan(
                                      text: DateFormat('EEE MMM dd, yyyy')
                                          .format(
                                              controller.selectedDate.value),
                                      // text: "Sun jan 1, 2022",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: COLOR_ACCENT,
                                          wordSpacing: 1),
                                    ),
                                    TextSpan(
                                      text: " (${controller.timeZone.value})",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          color: COLOR_ACCENT,
                                          wordSpacing: 1),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: controller.isBusy.isTrue
                                  ? Center(child: CircularProgressIndicator())
                                  : Scrollbar(
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          children: controller.slots
                                              .mapIndexed((index, item) {
                                            bool isSelected =
                                                controller.slot == item;
                                            return InkWell(
                                              onTap: () =>
                                                  controller.slot.value = item,
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 10),
                                                height: 45,
                                                width: getScreenWidth(context) *
                                                    0.27,
                                                decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? color
                                                        : Colors.white,
                                                    border: Border.all(
                                                        color: color, width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Text(item["display"]),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                            ),
                            AppSpacerH(10),
                            Button(
                              height: 55,
                              title: "CONTINUE BOOKING",
                              width: getScreenWidth(context),
                              onPressed: controller.onContinueBooking,
                              backgroundColor: Color(0xFFEB8F07),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]))));
  }
}
