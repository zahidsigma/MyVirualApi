import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/singleton.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// import 'package:virualapi/ui/video_calling/video_calling.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class CardWidget extends StatelessWidget {
  final Map<String, dynamic> item;
  CardWidget({Key? key, required this.item});

  cancelAppt() async {
    // var ctrl = Get.find<HomeController>();
    var ctrl = Get.find();
    ctrl.cancelAppt(item['id']);
  }

  showConfirmation(bool isPending) {
    Util.showConfirmationDialog(
      Get.context!,
      'Cancel Confirmation',
      '${isPending ? '' : "Note that if your appointment is within the next 24 hours and you cancel it then no refund will be provided.\n\n"}Do you want to cancel this appointment?',
      'Yes, Cancel',
      "No, Don't Cancel",
      cancelAppt,
    );
  }

  showEarlyAlert() {
    Util.showConfirmationDialog(
        Get.context!,
        'Joining Too Early',
        "It's not your appointment time yet. You can join this session 10 min before the selected time",
        'Ok',
        "Ok",
        () => {},
        isConfirmation: false);
  }

  bool IsWithin10MinutesOrPast() {
    var date =
        DateTime.fromMillisecondsSinceEpoch(item["start_date"], isUtc: true);
    var timeStr = item["slotStartTime"].toString().length == 3
        ? "0${item["slotStartTime"]}"
        : item["slotStartTime"].toString();
    int hours = int.parse(timeStr.substring(0, 2));
    int minutes = int.parse(timeStr.substring(2, 4));
    DateTime combinedDateTime =
        DateTime(date.year, date.month, date.day, hours, minutes);
    DateTime now = DateTime.now();
    int differenceInMilliseconds =
        (now.millisecondsSinceEpoch - combinedDateTime.millisecondsSinceEpoch)
            .abs();

    // Check if the difference is less than or equal to 10 minutes (600,000 milliseconds)
    bool isWithin10Minutes = differenceInMilliseconds <= (10 * 60 * 1000);
    bool isPast = now.isAfter(combinedDateTime);
    return isWithin10Minutes || isPast;
  }

  Widget build(BuildContext context) {
    int time = item["slotStartTime"];
    String formattedTime = "";

    int hours = time ~/ 100;
    int minutes = time % 100;

    if (hours >= 12) {
      formattedTime =
          "${(hours == 12 ? hours : hours - 12).toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} PM";
    } else {
      formattedTime =
          "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} AM";
    }

    bool isPending = item['status'] == "PENDING";

    return Container(
      decoration: BoxDecoration(
          color: isPending
              ? COLOR_ACCENT_LIGHT.withOpacity(0.5)
              : Color(0xFF76AC71).withOpacity(0.22),
          borderRadius: BorderRadius.circular(25)),
      width: getScreenWidth(context) * 0.85,
      height: 210,
      padding: EdgeInsets.only(top: 30),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/steth.png",
              color: isPending ? Colors.red : Colors.green,
            ),
          ),
          Column(children: [
            Text(
              item["doctor_name"] ?? item["doctorName"],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.black),
            ),
            AppSpacerH(5),
            Text(item["reason"], style: TextStyle(color: Colors.black)),
            AppSpacerH(10),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.black45,
            ),
            AppSpacerH(10),
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month, size: 15, color: Colors.black),
                    AppSpacerW(5),
                    Text(
                      Util.timeStampDateFormat(item["start_date"]),
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poopins',
                          color: Colors.black),
                    ),
                    AppSpacerW(5),
                    Container(
                      height: 10,
                      width: 1,
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                    ),
                    AppSpacerW(5),

                    Icon(Icons.access_time, size: 15, color: Colors.black),
                    AppSpacerW(5),
                    Text(
                      formattedTime,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poopins',
                          color: Colors.black),
                    ),
                    Text(
                      " (${item['doctor_timezone'].toString().split('/')[1].replaceAll("_", " ")} time)",
                      style: TextStyle(fontSize: 10),
                    ),
                    // Container(
                    //   height: 10,
                    //   width: 1,
                    //   color: Colors.black,
                    //   margin: EdgeInsets.symmetric(horizontal: 5),
                    // ),
                    // Container(
                    //   height: 10,
                    //   width: 1,
                    //   color: Colors.black,
                    // ),
                    // AppSpacerW(5),
                  ],
                ),
                AppSpacerH(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item['status'] == 'PENDING'
                        ? Icon(Icons.warning, size: 15, color: Colors.amber)
                        : Icon(Icons.check_circle,
                            size: 15, color: Colors.green),
                    AppSpacerW(5),
                    Text(
                      item["status"],
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'poopins',
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            AppSpacerH(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => showConfirmation(isPending),
                  child: Text(
                    "CANCEL",
                    style: TextStyle(
                        color: isPending ? COLOR_ACCENT : COLOR_PRIMARY,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21)),
                      backgroundColor: Colors.white,
                      fixedSize: Size(140, 42)),
                ),
                AppSpacerW(10),
                if (item['status'] == "CONFIRMED")
                  ElevatedButton(
                    onPressed: () {
                      if (IsWithin10MinutesOrPast()) {
                        print("item $item");
                        Singleton.instance.session = {
                          "sessionId": item["session_id"],
                          "requestedBy": item["createdBy"],
                          "doctorName": item["doctor_name"],
                          "patientName": item["patient_name"],
                          "doctorId": item["doctor_id"],
                        };
                        // Get.to(() => VideoCallingScreen());
                      } else
                        showEarlyAlert();
                    },
                    child: Text(
                      "JOIN SESSION",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        backgroundColor: COLOR_PRIMARY,
                        fixedSize: Size(140, 42)),
                  )
              ],
            )
          ]),
        ],
      ),
    );
  }
}
