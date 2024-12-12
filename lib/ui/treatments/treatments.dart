import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/treatments/components/treatment_card.dart';
import 'package:virualapi/ui/treatments/treatment_controller.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/empt_list_widget.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class Treatments extends GetView<TreatmentController> {
  const Treatments({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        isBackVisible: false,
        isMenuVisible: true,
        body: Obx(() => controller.isBusy.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.dataList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                        top: 28.0, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeTitle(title: "Treatment Plans"),
                        AppSpacerH(5),
                        Text(
                          "You had ${controller.dataList.length} treatments in past 1 year",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                              fontFamily: 'Poppins'),
                        ),
                        AppSpacerH(10),
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller.dataList.length,
                              itemBuilder: ((context, index) {
                                var item = controller.dataList[index];
                                return TreatmentCard(session: item);
                              })),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: EmptyList(
                        title: "No Past Treatments Yet",
                        subtitle: "No treatments currently available",
                        imagePath: "treatment"),
                  )));
  }
}
