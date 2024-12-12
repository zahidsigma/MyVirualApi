import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/models/doctor_specialty.dart';
import 'package:virualapi/ui/doctor/doctor_controller.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/avatar_with_loader.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class DoctorCard extends StatelessWidget {
  final Doctors? item;
  final Map<String, dynamic>? recentItem;
  DoctorCard({super.key, required this.item, required this.recentItem});

  ImageProvider<Object> getDoctorImage() {
    return item != null && item!.picMetaData != null
        ? NetworkImage(item!.picMetaData!.publicUrl!)
        : AssetImage("assets/images/doctor.jpg") as ImageProvider<Object>;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final controller = Get.find<DoctorController>();
        controller.showDoctorDetails(item?.username ?? recentItem!["doctorId"]);
      },
      child: Stack(children: [
        Card(
          surfaceTintColor: Colors.white,
          margin: EdgeInsets.only(top: 45),
          child: Padding(
            padding: EdgeInsets.only(top: 55, left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Text(item?.name ?? recentItem!["doctorName"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: COLOR_PRIMARY,
                        // color: Color(0xff747474),
                        fontFamily: 'Poppinsb')),
                Text(
                    recentItem != null
                        ? "${recentItem!["totalSessions"]} Sessions"
                        : "",
                    textAlign: TextAlign.center),
                if (item != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                          item!.doctorRating?.rating?.toStringAsFixed(1) ?? ""),
                      Text(" (${item!.doctorRating?.totalReviews ?? "0"})"),
                    ],
                  ),
                if (recentItem != null) ...[
                  AppSpacerH(5),
                  Text(
                    "Last Consultation",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,
                          size: 16, color: Colors.black38),
                      AppSpacerW(10),
                      Text(Util.timeStampDateFormat(
                          recentItem!["lastSessionOn"])),
                      AppSpacerW(10),
                      Container(
                        height: 12,
                        width: 1,
                        color: COLOR_ACCENT,
                      ),
                      AppSpacerW(10),
                      Icon(Icons.access_time, size: 16, color: Colors.black),
                      AppSpacerW(10),
                      Text(Util.timeStampDateFormat(
                          recentItem!["lastSessionOn"],
                          format: 'hh:mm a')),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        Align(
            widthFactor: 2.5,
            alignment: Alignment.topCenter,
            child: AvatarWithLoader(
              imageUrl: item?.picMetaData?.publicUrl,
              placeholderImageUrl: "assets/images/doctor.jpg",
              radius: 45,
            )
            // CircleAvatar(
            //     radius: 45,
            //     backgroundColor: COLOR_BG_LIGHT,
            //     backgroundImage: getDoctorImage()),
            )
      ]),
    );
  }
}
