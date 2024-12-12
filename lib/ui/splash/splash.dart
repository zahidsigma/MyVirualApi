import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/animation/myfade.dart';
import 'package:virualapi/animation/slide_top_bottom.dart';

import 'package:virualapi/utils/metrics.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller;
    //DO NOT REMOVE THIS

    // return Scaffold(
    //     body: Container(
    //       child: Image.asset(
    //             "assets/images/splash.png",
    //             height: MediaQuery.of(context).size.height,
    //             width: MediaQuery.of(context).size.width,
    //             //     child: MyFadeAnimation(
    //             //   duration: 600,
    //             //   child: SlidetoptoBottom(
    //             //       duration: 500,
    //             //       child: Image.asset(
    //             //         "assets/images/splash.png",
    //             //         width: getScreenWidth(context) * 0.9,
    //             //       )),
    //             // )),
    //           ),
    //     ));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/splash.png",
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
