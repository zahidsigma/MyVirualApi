import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/ui/doctor/doctor_details/doctor_details_controller.dart';
import 'package:virualapi/ui/home/widgets/doctor_details.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/avatar_with_loader.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class DoctorDetails extends GetView<DoctorDetailsController> {
  // ImageProvider<Object> getDoctorImage() {
  //   var doctor = controller.doctor.value;
  //   return doctor.picMetaData != null
  //       ? NetworkImage(doctor.picMetaData!.publicUrl!)
  //       : AssetImage("assets/images/doc.png") as ImageProvider<Object>;
  // }
  ImageProvider<Object> getDoctorImage() {
    var doctor = controller.doctor.value;
    return doctor.picMetaData != null
        ? NetworkImage(doctor.picMetaData!.publicUrl!)
        : AssetImage("assets/images/doc.png") as ImageProvider<Object>;
  }

  @override
  Widget build(BuildContext context) {
    final double screen_width = getScreenWidth(context);

    return Scaffold(
        backgroundColor: COLOR_PRIMARY,
        body: SafeArea(child: Obx(() {
          var doctor = controller.doctor.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ))),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          padding: EdgeInsets.only(top: 90, bottom: 10),
                          // height: getScreenHeight(context),
                          width: getScreenHeight(context),
                          decoration: const BoxDecoration(
                              color: Color(0xffF7F8F9),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: controller.isBusy.isTrue
                              ? SizedBox(
                                  height: getScreenHeight(context) * 0.7,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: COLOR_PRIMARY),
                                  ),
                                )
                              : Column(
                                  children: [
                                    Text(
                                      controller.doctor.value.name ?? "",
                                      style: TextStyle(
                                          fontFamily: 'Gotham',
                                          fontSize: 20,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        (doctor.notes?.contains("|") ?? false)
                                            ? doctor.notes!.split("|")[0]
                                            : "",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          doctor.doctorRating?.rating
                                                  ?.toStringAsFixed(1) ??
                                              "",
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
                                        ),
                                        Text(
                                          " (${doctor.doctorRating?.totalReviews ?? "0"})",
                                          style: TextStyle(
                                              color: COLOR_ACCENT,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Fees: ",
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Rs ${doctor.consultingCost}",
                                            style: TextStyle(
                                                color: COLOR_PRIMARY,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(right: 10),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.end,
                                    //     children: [
                                    //       Text(
                                    //         "Free ",
                                    //         style: TextStyle(
                                    //           color: COLOR_ACCENT,
                                    //           fontWeight: FontWeight.bold,
                                    //           fontFamily: "Poppins",
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         "for Premimum Members ",
                                    //         style: TextStyle(
                                    //           color: Colors.black45,
                                    //           fontWeight: FontWeight.w600,
                                    //           fontFamily: "Poppins",
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: Colors.black45,
                                    ),
                                    if (doctor.id != null)
                                      DocrorDetailList(doctor: doctor),
                                    Text(
                                      "Skills",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                          fontFamily: 'Poppins'),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        (doctor.notes?.contains("|") ?? false)
                                            ? doctor.notes!.split("|")[1]
                                            : doctor.keywords?.join(", ") ?? "",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ),
                                    AppSpacerH(20),
                                    // Container(
                                    //   margin: EdgeInsets.symmetric(
                                    //       horizontal: 10, vertical: 10),
                                    //   width: getScreenWidth(context),
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(20),
                                    //       color: Colors.white),
                                    //   child: Column(
                                    //     children: [
                                    //       Text(
                                    //         "Qualification",
                                    //         style: TextStyle(
                                    //             fontSize: 20,
                                    //             color: Colors.black45,
                                    //             fontFamily: 'Poppins',
                                    //             fontWeight: FontWeight.w700),
                                    //       ),
                                    //       SizedBox(
                                    //         height: 10,
                                    //       ),
                                    //       ListTile(
                                    //         leading:
                                    //             Image.asset("assets/images/tic.png"),
                                    //         title: Text(
                                    //             "BECE-Basic Education Certificate Examination"),
                                    //       ),
                                    //       ListTile(
                                    //         leading:
                                    //             Image.asset("assets/images/tic.png"),
                                    //         title: Text(
                                    //             "MSLC-Middle School leaving Certifcate"),
                                    //       ),
                                    //       ListTile(
                                    //         leading:
                                    //             Image.asset("assets/images/tic.png"),
                                    //         title: Text(
                                    //             "GCE-General Certificate of Education"),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    if (doctor.online == true)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: COLOR_PRIMARY),
                                              minimumSize: Size.fromHeight(60),
                                            ),
                                            onPressed: () async {
                                              Get.toNamed(
                                                  Routers.patientSelection);
                                              await Get.delete<
                                                  AppointmentController>();
                                            },
                                            child: Text(
                                              "SEE DOCTOR NOW",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: COLOR_PRIMARY,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    // Button(
                                    //   height: 60,
                                    //   width: getScreenWidth(context) * 0.95,
                                    //   title: "BOOK APPOINTMENT",
                                    //   backgroundColor: COLOR_PRIMARY,
                                    //   isLight: true,
                                    //   onPressed: () {
                                    //     Get.toNamed(Routers.appointmentSlot);
                                    //   },
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Button(
                                      height: 60,
                                      width: getScreenWidth(context) * 0.95,
                                      title: "BOOK APPOINTMENT",
                                      backgroundColor: COLOR_ACCENT,
                                      onPressed: () async {
                                        Get.toNamed(Routers.appointmentSlot);
                                        await Get.delete<
                                            AppointmentController>();
                                      },
                                    )
                                  ],
                                ),
                        ),
                        if (controller.isBusy.isFalse)
                          Positioned(
                            left: screen_width * 0.34,
                            child: AvatarWithLoader(
                              imageUrl: doctor.picMetaData?.publicUrl,
                              placeholderImageUrl: "assets/images/doctor.jpg",
                              radius: 70,
                            ),
                            // CircleAvatar(
                            //     radius: 70,
                            //     backgroundColor: COLOR_BG_LIGHT,
                            //     backgroundImage: getDoctorImage())
                          ),
                        Positioned(
                          right: 20,
                          top: getScreenHeight(context) * 0.12,
                          child: Text(
                            doctor.gender?.toUpperCase() ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: COLOR_ACCENT),
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ),
            ],
          );
        })));
  }
}
