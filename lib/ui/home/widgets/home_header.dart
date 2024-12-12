import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/home/widgets/bmi_info_popup.dart';
import 'package:virualapi/ui/home/widgets/filter_popup.dart';
import 'package:virualapi/ui/home/widgets/home_top_header.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class HomeHeader extends StatefulWidget {
  final String? hintText;
  final String? title;
  final String? subtitle;
  final Image? image;
  final String? contact;
  HomeHeader(
      {required this.hintText,
      this.title,
      this.subtitle,
      this.image,
      this.contact});
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.06, vertical: 10),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopHeader(contact: widget.contact),
            AppSpacerH(10),
            Row(
              children: [
                if (widget.title != null && widget.title!.isNotEmpty)
                  Text(
                    widget.title ?? "",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffFAFBBF),
                    ),
                  ),
                Text(
                  "${widget.subtitle ?? ""}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xffFAFBBF,
                      ),
                      fontWeight: FontWeight.bold),
                ),
                Image.asset("assets/images/clap.png"),
              ],
            ),
            if (controller.bmi.value != 0.0)
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => BMIInfoPopup());
                },
                child: Row(
                  children: [
                    Text(
                      "Your BMI is ${controller.bmi.value.toStringAsFixed(1)}",
                      style: TextStyle(color: Colors.white),
                    ),
                    AppSpacerW(5),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            AppSpacerH(15),

            // Container(
            //   height: 55,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10), color: Colors.white),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         hintText: widget.hintText ?? "",
            //         hintStyle:
            //             const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            //         // prefixIcon: Icon(Icons.search),
            //         contentPadding: EdgeInsets.only(left: 10, top: 15),
            //         prefixIcon: InkWell(
            //           onTap: () {},
            //           child: Container(
            //               height: 55,
            //               width: 55,
            //               margin: EdgeInsets.only(right: 10),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: const Color(0xffEAA221),
            //               ),
            //               child: const Icon(
            //                 Icons.search,
            //                 color: Colors.white,
            //               )),
            //         ),
            //         border: InputBorder.none),
            //   ),
            // )
            InkWell(
              // onTap: () {
              //   showDialog(
              //       context: context,
              //       builder: (BuildContext context) => (FilterPopup));
              // },
              child: Container(
                height: 55,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xFFEB8F07).withOpacity(0.32),
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.search,
                          color: COLOR_ACCENT,
                          size: 25,
                        ),
                      ),
                      Text(widget.hintText ?? ""),
                    ]),

                // child: TextFormField(
                //   decoration: InputDecoration(
                //       hintText: widget.hintText ?? "",
                //       hintStyle:
                //           const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
                //       // prefixIcon: Icon(Icons.search),
                //       contentPadding: EdgeInsets.only(left: 10, top: 15),
                //       suffixIcon: InkWell(
                //         onTap: () {},
                //         child: Container(
                //             height: 55,
                //             width: 55,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               color: const Color(0xffEAA221),
                //             ),
                //             child: const Icon(
                //               Icons.search,
                //               color: Colors.white,
                //             )),
                //       ),
                //       border: InputBorder.none),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
