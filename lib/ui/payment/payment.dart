import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/payment/payment_controller.dart';
import 'package:virualapi/ui/payment/widgets/payment_card.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        body: Obx(() => controller.isBusy.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HomeTitle(title: "Payments"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "You have made ${controller.dataList.length} payments in past 3 years",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black45),
                      ),
                    ),
                    AppSpacerH(10),
                    Expanded(
                        child: ListView.builder(
                      itemCount: controller.dataList.length,
                      itemBuilder: ((context, index) {
                        var item = controller.dataList[index];
                        return PaymentCard(item: item);
                      }),
                    ))
                  ],
                ),
              )));
  }
}
