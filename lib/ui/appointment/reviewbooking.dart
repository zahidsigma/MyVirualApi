import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class ReviewBooking extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      backgroundColor: Color(0xFFF7F8F9),
      body: Obx(
        () => SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: HomeTitle(title: "Review Booking"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: getScreenHeight(context) * 0.27,
                  width: getScreenWidth(context) * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/images/steth.png")),
                      border: Border.all(color: Color(0xff1B95AF), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          controller.doctorCtrl.doctor.value.name ?? "",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Color(0xff1B95AF),
                          ),
                        ),
                        Text(
                          controller.doctorCtrl.doctor.value.specialty ?? "",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.black38,
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          indent: 70,
                          endIndent: 70,
                          color: Colors.black38,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month,
                                size: 15, color: Colors.black38),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.isInstant
                                  ? "Instant visit"
                                  : DateFormat("dd-MM-yyyy")
                                      .format(controller.selectedDate.value),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                  fontFamily: 'Poppins'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 12,
                              width: 1,
                              color: COLOR_ACCENT,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            if (controller.slot.isNotEmpty)
                              Icon(Icons.alarm,
                                  size: 15, color: Colors.black38),
                            if (controller.slot.isNotEmpty)
                              SizedBox(
                                width: 5,
                              ),
                            if (controller.slot.isNotEmpty)
                              Text(
                                controller.slot.isNotEmpty
                                    ? controller.slot['display']
                                    : "",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                    fontFamily: 'Poppins'),
                              ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19.0),
                          child: RichText(
                            text: TextSpan(
                                text: "Reason: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.black45,
                                    wordSpacing: 1),
                                children: [
                                  TextSpan(
                                    text: controller.reasonTextController.text,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.black45,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        AppSpacerH(20),
                        Text(
                          "15 min Consultation",
                          style: TextStyle(
                              fontSize: 13,
                              color: COLOR_ACCENT,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (false)
                  Stack(
                    children: [
                      Container(
                        height: getScreenHeight(context) * 0.28,
                        width: getScreenWidth(context) * 0.9,
                        margin: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 1, color: Color(0xFF909090))),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 30, left: 10),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/tic.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Talk to a doctor ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              color: Colors.black45,
                                              wordSpacing: 1),
                                          children: [
                                            TextSpan(
                                              text: 'Free ',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: COLOR_ACCENT,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'every month to\n evaluate your health',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.black45,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/tic.png"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Discount on Prescription delevries",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          color: Colors.black45,
                                          wordSpacing: 1),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side:
                                          BorderSide(color: Color(0xff367D9C)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {},
                                  child: Text(
                                    "Become a Member",
                                    style: TextStyle(color: Color(0xff367D9C)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: getScreenWidth(context) * 0.27,
                          child: Image.asset("assets/images/bene.png")),
                    ],
                  ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IntrinsicWidth(
                        stepWidth: getScreenWidth(context) * 0.89,
                        child: TextField(
                          enabled: controller.isCouponApplied.isFalse,
                          controller: controller.couponController,
                          decoration: InputDecoration(
                            suffixIcon: TextButton(
                                onPressed: controller.validateCoupon,
                                child: Text(
                                  controller.isCouponApplied.isFalse
                                      ? "Apply"
                                      : "Applied",
                                  style: TextStyle(
                                      color: controller.isCouponApplied.isFalse
                                          ? COLOR_ACCENT
                                          : GREY_TEXT_COLOR.withOpacity(0.6),
                                      fontWeight: FontWeight.bold),
                                )),
                            hintText: "Enter Coupon (Optional)",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: COLOR_ACCENT),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AppSpacerH(10),
                Container(
                  height: getScreenHeight(context) * 0.1,
                  width: getScreenWidth(context) * 0.9,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffD6DEE2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff747474),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs. ${controller.totalAmount.value}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff747474),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  isLoading: controller.isBusy.value,
                  height: 50,
                  width: getScreenWidth(context) * 0.9,
                  title: "MAKE PAYMENT",
                  backgroundColor: COLOR_ACCENT,
                  onPressed: controller.makePayment,
                ),
                if (controller.doctorCtrl.doctor.value.name!
                    .toLowerCase()
                    .contains("test"))
                  TextButton(
                      onPressed: controller.createAppt,
                      child: Text("Pay Later"))
              ],
            )),
      ),
    );
  }
}
