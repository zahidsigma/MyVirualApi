import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/lab_reports/lab_report_controller.dart';
import 'package:virualapi/ui/lab_reports/widgets/reportcard.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/empt_list_widget.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class LabReportScreen extends GetView<LabReportController> {
  const LabReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        isBackVisible: false,
        isMenuVisible: true,
        body: Obx(() => Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: controller.isBusy == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : !controller.isBusy.value && controller.dataList.isEmpty
                    ? EmptyList(
                        title: "No Lab Tests Yet",
                        subtitle: "No Lab Tests currently available",
                        imagePath: "treatment")
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            HomeTitle(title: "Prescribed Lab Tests"),
                            AppSpacerH(10),
                            Text(
                              "You have ${controller.dataList.length} reports in past 2 years",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38,
                                  fontFamily: 'Poppins'),
                            ),
                            AppSpacerH(10),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: controller.dataList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = controller.dataList[index];
                                    return ReportCard(item: item);
                                  }),
                            ),
                          ]))));
  }
}
