import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/doctor/doctor_controller.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/misc_widget.dart';

import 'widgets/doctor_card.dart';

class DoctorScreen extends GetView<DoctorController> {
  const DoctorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    controller; //
    return BodyWithHeader(
        backgroundColor: LIGHT_BACKGROUND_COLOR,
        body: Obx(() => controller.isBusy.isTrue
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 20),
                    child: HomeTitle(
                        fontSize: 18,
                        title:
                            "${controller.dataList[0].doctors?.length} ${Get.parameters.isNotEmpty && Get.parameters.containsKey("name") ? Get.parameters["name"] : ""} Doctor(s) found"),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30.0, left: 20),
                  //   // "${controller.dataList[0].doctors?.length} Doctor(s) found",
                  //   child: Text(
                  //     "${controller.dataList[0].doctors?.length} ${Get.parameters.isNotEmpty && Get.parameters.containsKey("name") ? Get.parameters["name"] : ""} Doctor(s) found",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 18,
                  //         color: Colors.black45),
                  //   ),
                  // ),
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.only(
                            top: 30, left: 10, right: 10, bottom: 10),
                        itemCount: controller.dataList[0].doctors!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisExtent: 250),
                        itemBuilder: ((context, index) {
                          var item = controller.dataList[0].doctors![index];
                          return DoctorCard(item: item, recentItem: null);
                        })),
                  ),
                ],
              )));
  }
}
