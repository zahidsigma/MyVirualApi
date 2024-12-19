import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/animation/myfade.dart';
import 'package:virualapi/animation/slide_top_bottom.dart';

import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller;
    //DO NOT REMOVE THIS

    return Scaffold(
      // backgroundColor: DARK_BG_COLOR,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset(
            "assets/images/bg.png",
            height: getScreenHeight(context),
            width: getScreenWidth(context),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: getScreenHeight(context) * 0.23,
            left: getScreenWidth(context) * 0.25,
            child: MyFadeAnimation(
              duration: 600,
              child: SlidetoptoBottom(
                  duration: 2000,
                  child: ReusableWidget.loadSvg("assets/icons/logosplash.svg")),
            ),
          ),
          Positioned(
            top: getScreenHeight(context) * 0.5,
            left: getScreenWidth(context) * 0.12,
            child: Center(
              child: RichText(
                textAlign: TextAlign
                    .center, // Ensure text inside spans is also centered
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
                    TextSpan(
                      text: 'Your AI Investigator ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    TextSpan(
                      text: 'for Secure Insight',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
