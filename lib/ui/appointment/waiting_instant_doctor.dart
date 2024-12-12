import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class WaitingInstantDoctor extends GetView<AppointmentController> {
  const WaitingInstantDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          AppSpacerH(10),
          Text("Waiting for your Dr..."),
          TextButton(
              onPressed: () {
                Get.offAndToNamed(Routers.homeScreen);
              },
              child: Text(
                "I want to exit",
                style: TextStyle(
                    color: COLOR_PRIMARY, fontWeight: FontWeight.bold),
              ))
        ],
      )),
    );
  }
}
