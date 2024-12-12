import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class LabReportDetails extends StatelessWidget {
  const LabReportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTitle(title: "Pathoogy"),
          Text(
            "Quest Diagnostics",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                color: COLOR_ACCENT,
                fontWeight: FontWeight.bold),
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: "Pathology results after surgery for ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Colors.black38,
                    wordSpacing: 1),
                children: [
                  TextSpan(
                    text: '"Anna Lissa"',
                    // text: "Sun jan 1, 2022",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: COLOR_ACCENT,
                        wordSpacing: 1),
                  )
                ]),
          ),
          AppSpacerH(10),
          Row(
            children: [
              Icon(Icons.calendar_month, size: 16, color: Colors.black38),
              AppSpacerW(10),
              Text(
                "10-Dec-2021",
                style: TextStyle(
                    fontSize: 15, color: Colors.black38, fontFamily: 'Poppins'),
              ),
              AppSpacerW(10),
              Container(
                height: 12,
                width: 1,
                color: COLOR_ACCENT,
              ),
              AppSpacerW(10),
              Icon(Icons.access_time, size: 16, color: Colors.black38),
              AppSpacerW(10),
              Text("10:15am",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontFamily: 'Poppins')),
            ],
          ),
          AppSpacerH(20),
          Text(
            "Report type",
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                color: Colors.black38,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Pathology",
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              color: Colors.black38,
            ),
          ),
          AppSpacerH(20),
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTitle(title: "Doctor Notes"),
                  Text(
                    "Lorem Ipsum is simply dummy text of theprinting and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap.",
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
          ),
          AppSpacerH(10),
          Text(
            "Attachment",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                color: Colors.black38,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
  }
}
