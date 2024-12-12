import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/medication/medication_controller.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/empt_list_widget.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/utils/util.dart';

class MedicationScreen extends GetView<MedicationController> {
  MedicationScreen({super.key});
  final List<Color> colors = [
    Color(0xFFEBFECD),
    Color(0xFFCFE6EC),
    Color(0xFFFFD2FB),
    Color(0xFFFFF6C5)
  ];

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        isBackVisible: false,
        isMenuVisible: true,
        backgroundColor: LIGHT_BACKGROUND_COLOR,
        body: Obx(() => controller.isBusy.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.isBusy.isFalse && controller.dataList.isEmpty
                ? EmptyList(
                    title: "No Medications Yet",
                    subtitle: "No Medications currently available",
                    imagePath: "treatment")
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: HomeTitle(title: "Prescribed Medications"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, top: 5, bottom: 5, right: 20),
                          child: Text(
                            "You have ${controller.dataList.length} medicines in past 2 years",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Expanded(
                          child: MasonryGridView.count(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              itemCount: controller.dataList.length,
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              // gridDelegate:
                              //     SliverGridDelegateWithFixedCrossAxisCount(
                              //         crossAxisCount: 2,
                              //         crossAxisSpacing: 10,
                              //         mainAxisSpacing: 10,
                              //         childAspectRatio: 200 / 2,
                              //         mainAxisExtent: 450),
                              itemBuilder: ((context, index) {
                                var item = controller.dataList[index];
                                var color = colors[index % 4];
                                return GestureDetector(
                                  onTap: () {
                                    // Get.to(MedicationDetails(item: item));
                                  },
                                  child: Stack(children: [
                                    Card(
                                      color: Colors.white,
                                      surfaceTintColor: Colors.white,
                                      margin: EdgeInsets.only(top: 45),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 60,
                                            left: 10,
                                            right: 10,
                                            bottom: 10),
                                        child: Column(
                                          children: [
                                            RichText(
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: item["name"] ?? "",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color:
                                                              Color(0xff747474),
                                                          fontFamily:
                                                              'Poppinsb')),
                                                  TextSpan(
                                                    text:
                                                        " (${item["strength"] ?? ""})",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ])),
                                            AppSpacerH(10),
                                            Text(
                                              "${item['dose']} ${item['route']} ${item['frequency']}",
                                              style: TextStyle(
                                                  color: GREY_TEXT_COLOR),
                                              textAlign: TextAlign.center,
                                            ),
                                            if (item["notes"] != null)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text(
                                                  item["notes"] ?? "",
                                                  style: TextStyle(
                                                    color: COLOR_ACCENT,
                                                    // decoration: TextDecoration
                                                    //     .underline,
                                                    // decorationColor:
                                                    //     COLOR_PRIMARY
                                                  ),
                                                ),
                                              ),
                                            AppSpacerH(10),
                                            Text(
                                              "Prescribed on",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.calendar_month,
                                                    size: 16,
                                                    color: Colors.black38),
                                                AppSpacerW(10),
                                                Text(Util.timeStampDateFormat(
                                                    item["createdDate"])),
                                              ],
                                            ),
                                            AppSpacerH(10),
                                            Text(
                                              "Take until",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.calendar_month,
                                                    size: 16,
                                                    color: Colors.black38),
                                                AppSpacerW(10),
                                                Text(Util.timeStampDateFormat(
                                                    item["endDate"])),
                                              ],
                                            ),
                                            AppSpacerH(5),
                                            Text(
                                              item["doctorName"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: COLOR_PRIMARY),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: CircleAvatar(
                                          backgroundColor: color,
                                          radius: 45,
                                          child: Image.asset(
                                            "assets/images/pills_1.png",
                                            width: 50,
                                            height: 50,
                                          )),
                                    )
                                  ]),
                                );
                              })),
                        ),
                      ])));
  }
}
