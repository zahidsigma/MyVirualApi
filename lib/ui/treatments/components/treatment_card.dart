import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/telemed_session.dart';
import 'package:virualapi/ui/treatments/treatment_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class TreatmentCard extends StatelessWidget {
  final TelemedSession session;
  const TreatmentCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.printInfo(info: jsonEncode(session.toJson()));
        var ctrl = Get.find<TreatmentController>();
        ctrl.getSessionNotes(session.sessionId!);
        Get.toNamed(Routers.treatmentDetails, arguments: session);
      },
      child: Card(
        surfaceTintColor: Colors.white,
        // color: LIGHT_BACKGROUND_COLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: getScreenWidth(context) * 0.7,
                    child: Text(
                      session.doctorName!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 30,
                    color: COLOR_ACCENT,
                  ),
                  AppSpacerH(10),
                  Text(
                    "Session Conducted",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,
                          size: 16, color: Colors.black38),
                      AppSpacerW(10),
                      Text(Util.timeStampDateFormat(session.createdDate)),
                      AppSpacerW(10),
                      Container(
                        height: 12,
                        width: 1,
                        color: COLOR_ACCENT,
                      ),
                      AppSpacerW(10),
                      Icon(Icons.access_time, size: 16, color: Colors.black38),
                      AppSpacerW(10),
                      Text(Util.timeStampDateFormat(session.createdDate,
                          format: 'hh:mm a')),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/images/tap.png'),
            ],
          ),
        ),
      ),
    );
  }
}
