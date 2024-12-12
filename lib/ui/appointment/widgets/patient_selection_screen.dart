import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/ui/appointment/widgets/bookingtext.dart';
import 'package:virualapi/ui/appointment/widgets/patient_widget.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/button.dart';

class PatientSelectionScreen extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: COLOR_PRIMARY,
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffF7F8F9),
                  ))),
          Expanded(
              child: SingleChildScrollView(
                  child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(top: 20),
                              // height: getScreenHeight(context) * 0.85,
                              width: getScreenHeight(context),
                              decoration: const BoxDecoration(
                                  color: Color(0xffF7F8F9),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "${controller.isInstant ? 'Instant Visit' : 'Booking appointment'} with ${controller.doctorCtrl.doctor.value.name}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Poppins',
                                                color: Colors.black54),
                                          ),
                                          if (controller.patient.isNotEmpty)
                                            Text(
                                              "for ${controller.patient['name']}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black45),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                                text: controller.isInstant
                                                    ? "Consult Now"
                                                    : DateFormat(
                                                            "EEE MMM dd, yyyy")
                                                        .format(controller
                                                            .selectedDate
                                                            .value),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    color: COLOR_ACCENT,
                                                    wordSpacing: 1),
                                                children: [
                                                  if (!controller.isInstant)
                                                    TextSpan(
                                                      text:
                                                          ' (${controller.slot['display']})',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        color: COLOR_ACCENT,
                                                      ),
                                                    )
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    controller.isBusy.isTrue
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                        text: "Select Patient",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black45,
                                                            wordSpacing: 1),
                                                        children: [
                                                          TextSpan(
                                                            text: '*',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Colors.red,
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                  FloatingActionButton(
                                                    tooltip: "Add Child",
                                                    backgroundColor:
                                                        COLOR_ACCENT,
                                                    mini: true,
                                                    onPressed: () =>
                                                        Get.toNamed(
                                                            Routers.addChild),
                                                    child: Icon(Icons.add),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Wrap(
                                        spacing: 8.0,
                                        children: (controller
                                                    .userExt
                                                    .value["familyMembers"]
                                                    ?.keys ??
                                                [])
                                            .map<Widget>((key) {
                                          var item = controller.userExt
                                              .value["familyMembers"][key];
                                          return PatientWidget(
                                            patient: item,
                                            isSelected: item["name"] ==
                                                controller
                                                    .patient.value["name"],
                                            onTap: () {
                                              controller.patient.value = item;
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Form(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 20),
                                            child: BookingText(
                                              title: "Reason Of Visit",
                                              controller: controller
                                                  .reasonTextController,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 20),
                                            child: BookingText(
                                              title:
                                                  "How long have you had this?",
                                              controller: controller
                                                  .durationTextController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Spacer(),
                                    Button(
                                      height: 55,
                                      title: "CONTINUE",
                                      width: getScreenWidth(context),
                                      onPressed: controller.onContinue,
                                      backgroundColor: Color(0xFFEB8F07),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]))))
        ])));
  }
}
