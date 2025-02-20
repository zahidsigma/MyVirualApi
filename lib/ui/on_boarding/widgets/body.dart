import 'package:flutter/material.dart';
import 'package:virualapi/utils/metrics.dart';
import 'page_view.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.cover)),
        child: MyPageView(),
      ),
    );
  }
}
