import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/utils/image_utils.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';

class UploadImage extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BodyWithHeader(
          backgroundColor: Color(0xFFF7F8F9),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Booking appointment with ${controller.doctorCtrl.doctor.value.name}",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.black45),
                        ),
                        Text(
                          "for ${controller.patient.value['name']}",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.black45),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: controller.isInstant
                                  ? "Instant visit"
                                  : DateFormat("EEE MMM dd, yyyy")
                                      .format(controller.selectedDate.value),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: COLOR_ACCENT,
                                  wordSpacing: 1),
                              children: [
                                if (!controller.isInstant)
                                  TextSpan(
                                    text: ' (${controller.slot['display']})',
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
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: DottedBorder(
                          radius: Radius.circular(20),
                          borderType: BorderType.RRect,
                          color: Colors.black38,
                          child: Container(
                            height: getScreenHeight(context) * 0.45,
                            width: getScreenWidth(context) * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: controller.imagePath.isNotEmpty
                                ? Image.file(File(controller.imagePath.value))
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/img1.png"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Upload Images",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff25566B)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                            text:
                                                "Drag & drop or here just click for ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                color: Colors.black38,
                                                wordSpacing: 1),
                                            children: [
                                              TextSpan(
                                                text: 'Browse ',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: COLOR_ACCENT,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'file',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black38,
                                                ),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "(Optional)",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffEB494B)),
                                      ),
                                    ],
                                  ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    height: 45,
                    title: "CONTINUE",
                    width: getScreenWidth(context) * 0.8,
                    onPressed: controller.checkUploadImage,
                    backgroundColor: Color(0xFFEB8F07),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: Get.back,
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.black38),
                        )),
                  )
                ],
              )),
        ));
  }

  void _handleFile(File? file) {
    controller.imagePath.value = file?.path ?? "";
    print(file?.path);
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  ImageUtils.pickImage().then(_handleFile);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  ImageUtils.captureImage().then(_handleFile);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
