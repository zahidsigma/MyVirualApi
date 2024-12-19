import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/home_top_header.dart';

import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class BodyWithHeader extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  bool? isBackVisible = true;
  bool? isMenuVisible = false;
  bool? islogovisible = false;
  bool? isrofile = false;
  String? title;
  String? subtitle;
  BodyWithHeader(
      {super.key,
      required this.body,
      this.isBackVisible,
      this.isMenuVisible,
      this.title,
      this.isrofile,
      this.subtitle,
      this.islogovisible,
      this.backgroundColor = const Color.fromARGB(255, 241, 239, 239)});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isMenuVisible == true ? Color(0xffF6F6F6) : DARK_BG_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
              crossAxisAlignment: islogovisible == true
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (islogovisible == true)
                  Image.asset(
                    'assets/images/logoapi.png',
                    height: getScreenHeight(context) * 0.18,
                  ),
                Row(
                  children: [
                    if (isBackVisible == true || isBackVisible == null)
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            size: 32,
                            color: Colors.white,
                          )),
                    if (isMenuVisible != null && isMenuVisible == true) ...[
                      Container(
                        width: getScreenWidth(context),
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${title}\n',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: subtitle),
                                ],
                              ),
                            ),
                            GestureDetector(
                                // onTap: () => controller.homeKey.currentState!.openDrawer(),
                                child: ReusableWidget.loadSvg(
                              "assets/icons/munuapi.svg",
                            )),
                          ],
                        ),
                      ),
                      AppSpacerH(70),
                    ]
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        child: body,
                        width: MediaQuery.of(context).size.width,
                        height: getScreenHeight(context) * 0.7,
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: isMenuVisible == true
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)
                                    // topRight: Radius.circular(45)
                                    )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                  )),
                      ),
                      Positioned(
                          top: 0,
                          left: getScreenWidth(context) / 2 - 50,
                          child: isrofile == true
                              ? Image.asset("assets/images/profile.png")
                              : SizedBox()),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
