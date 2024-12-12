import 'package:flutter/material.dart';
import 'package:virualapi/models/doctor.dart';
import 'package:virualapi/utils/metrics.dart';

class DocrorDetailList extends StatelessWidget {
  final Doctor doctor;
  DocrorDetailList({super.key, required this.doctor});

  List<Map<String, dynamic>> getDoctordetails() => [
        {
          "image": "assets/images/bag.png",
          "title": "Experience",
          "subtitle": doctor.experience ?? "",
          "color": Color(0xff11C92E)
        },
        {
          "image": "assets/images/exp.png",
          "title": "License",
          "subtitle": doctor.regNo ?? "",
          "color": Color(0xff98026E)
        },
        {
          "image": "assets/images/lang.png",
          "title": "Languages",
          "subtitle": doctor.languages?.join(",").isNotEmpty ?? true
              ? doctor.languages?.reversed.join(", ")
              : "Urdu",
          "color": Color(0xffEAA221)
        },
        {
          "image": "assets/images/edu.png",
          "title": "Education",
          "subtitle": doctor.education,
          "color": Color(0xff25566B),
        },
      ];
  @override
  Widget build(BuildContext context) {
    var doctordetails = getDoctordetails();
    return Container(
      width: double.infinity,
      height: getScreenHeight(context) * 0.295,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: doctordetails.length,
          itemBuilder: (BuildContext ctx, index) {
            var item = doctordetails[index];
            return Column(
              children: [
                Image.asset(
                  item["image"],
                ),
                Text(
                  item["title"],
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: getScreenWidth(context) * 0.25,
                  child: Text(
                    item["subtitle"],
                    maxLines: 3,
                    style: TextStyle(
                        color: item["color"], fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          }),
    );
  }
}
