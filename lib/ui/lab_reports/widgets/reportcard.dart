import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class ReportCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const ReportCard({super.key, required this.item});

  bool isTest() {
    var input = (item["name"] ?? item['doctor_name'])?.toString().toLowerCase();
    if (input == null) return false;
    return input.contains('x-ray') ||
        input.contains('x ray') ||
        input.contains('ultra sound') ||
        input.contains('ultrasound');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: LIGHT_BACKGROUND_COLOR,
      surfaceTintColor: Colors.white,
      elevation: 5,
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
                  width: getScreenWidth(context) * 0.78,
                  child: Text(
                    item["name"] ?? item['doctor_name'],
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
                AppSpacerH(5),
                // Text(
                //   item["doctor_name"],
                //   style: TextStyle(fontSize: 14, color: Colors.black45),
                // ),
                // AppSpacerH(5),
                Text(
                  isTest() ? 'Test scheduled' : "Sample collection",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 16, color: Colors.black38),
                    AppSpacerW(10),
                    Text(Util.timeStampDateFormat(item["scheduled_for"])),
                    AppSpacerW(10),
                    Container(
                      height: 12,
                      width: 1,
                      color: COLOR_ACCENT,
                    ),
                    AppSpacerW(10),
                    Icon(Icons.access_time, size: 16, color: Colors.black38),
                    AppSpacerW(10),
                    Text(Util.timeStampDateFormat(item["scheduled_for"],
                        format: 'hh:mm a')),
                  ],
                ),
                AppSpacerH(5),
                Text(
                  item["doctor_name"],
                  style: TextStyle(fontSize: 14, color: COLOR_PRIMARY),
                ),
              ],
            ),
            // Image.asset('assets/images/tap.png'),
          ],
        ),
      ),
    );
  }
}
