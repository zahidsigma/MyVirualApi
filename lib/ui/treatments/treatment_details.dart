import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/models/telemed_session.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/treatments/treatment_controller.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class TreatmentDetails extends GetView<TreatmentController> {
  TreatmentDetails({super.key});
  final List<String> medications = [
    'AMIZYTOL B44',
    '300 mg, 1 Caplet once a day',
    'use between Mon Jan 17 2022 and Wed Jan 26 2022 (instructions)'
  ];

  String formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours} hr ${duration.inMinutes.remainder(60)} min ${duration.inSeconds.remainder(60)} sec';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} min ${duration.inSeconds.remainder(60)} sec';
    } else {
      return '${duration.inSeconds} seconds';
    }
  }

  String parseHtmlContent(String htmlContent) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlContent.replaceAll(exp, '');
  }

  Widget buildRichText(String htmlContent) {
    List<InlineSpan> children = [];
    List<String> parts = htmlContent.split('|');

    for (int i = 0; i < parts.length; i++) {
      String part = parts[i];
      if (part.startsWith('<b>') && part.endsWith('</b>')) {
        // Bold text
        children.add(TextSpan(
          text: part.substring(
              3, part.length - 4), // Extract text between <b> and </b> tags
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      } else {
        // Regular text
        children.add(TextSpan(text: part));
      }

      // Add line break if not the last part
      if (i < parts.length - 1) {
        children.add(TextSpan(text: '\n'));
      }
    }

    // Return RichText widget with parsed content
    return RichText(
      text:
          TextSpan(children: children, style: TextStyle(color: Colors.black54)),
    );
  }

  Map<String, dynamic> getNote(String category) => controller.sessionNotes
      .firstWhere((item) => item["category"] == category, orElse: () => {});

  bool hasData() {
    return getNote("Lab Test").isNotEmpty ||
        getNote("Advice").isNotEmpty ||
        getNote("Procedures").isNotEmpty ||
        getNote("Diagnosis").isNotEmpty ||
        getNote("Complaint").isNotEmpty;
  }

  List<Widget> getNotes(String category, String title) {
    var note = getNote(category);
    return note.isEmpty
        ? []
        : [
            HomeTitle(
              title: title,
              fontSize: 18,
            ),
            buildRichText(note["note"]),
            // Text(parseHtmlContent(note["note"])),
            AppSpacerH(15),
          ];
  }

  @override
  Widget build(BuildContext context) {
    var session = Get.arguments as TelemedSession;
    Duration duration = session.startTime != null && session.endTime != null
        ? Duration(milliseconds: session.endTime! - session.startTime!)
        : Duration(seconds: 0);
    return BodyWithHeader(body: Obx(() {
      return controller.isBusy.isTrue
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeTitle(title: session.doctorName!),
                      AppSpacerH(5),
                      RichText(
                        text: TextSpan(
                            text: "Patient: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.black45,
                                wordSpacing: 1),
                            children: [
                              TextSpan(
                                text: session.patientName,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black45,
                                ),
                              )
                            ]),
                      ),
                      AppSpacerH(5),
                      RichText(
                        text: TextSpan(
                            text: "Reason: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.black45,
                                wordSpacing: 1),
                            children: [
                              TextSpan(
                                text: session.reason,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black45,
                                ),
                              )
                            ]),
                      ),
                      AppSpacerH(10),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,
                              size: 16, color: Colors.black38),
                          // Image.asset('assets/images/calender.png'),
                          AppSpacerW(5),
                          Text(Util.timeStampDateFormat(session.createdDate)),
                          AppSpacerW(10),
                          Container(
                            height: 12,
                            width: 1,
                            color: COLOR_ACCENT,
                          ),
                          AppSpacerW(10),
                          Icon(Icons.access_time,
                              size: 16, color: Colors.black38),
                          // Image.asset("assets/images/time.png"),
                          AppSpacerW(5),
                          Text(Util.timeStampDateFormat(session.createdDate,
                              format: 'hh:mm a')),
                          AppSpacerW(10),
                          Container(
                            height: 12,
                            width: 1,
                            color: COLOR_ACCENT,
                          ),
                          AppSpacerW(10),
                          Icon(Icons.timelapse,
                              size: 16, color: Colors.black38),
                          // Image.asset("assets/icons/ic_duration.png"),
                          AppSpacerW(5),
                          Text(formatDuration(duration)),
                        ],
                      ),
                      hasData()
                          ? Column(
                              children: [
                                Card(
                                    surfaceTintColor: Colors.white,
                                    // elevation: 5,
                                    margin: EdgeInsets.only(top: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...getNotes("Complaint",
                                                "Purpose of Visit"),
                                            ...getNotes(
                                                "Diagnosis", "Diagnosis"),
                                            ...getNotes(
                                                "Procedures", "Procedures"),
                                            ...getNotes("Advice",
                                                "Patient Instructions"),
                                            ...getNotes(
                                                "Lab Test", "Lab Tests"),
                                          ]),
                                    )),
                              ],
                            )
                          : Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30.0),
                                child: Text(
                                  "No Data Found",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                              ),
                            ),
                      AppSpacerH(20),
                      ...getNotes("Medicine", "Medication"),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5),
                        child: Text(
                          'This is a system generated prescription and does not require a signature and/or stamp',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ]),
              ),
            );
    }));
  }
}
