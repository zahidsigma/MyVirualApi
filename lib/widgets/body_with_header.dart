import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/widgets/home_top_header.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class BodyWithHeader extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  bool? isBackVisible = true;
  bool? isMenuVisible = false;
  BodyWithHeader(
      {super.key,
      required this.body,
      this.isBackVisible,
      this.isMenuVisible,
      this.backgroundColor = const Color.fromARGB(255, 241, 239, 239)});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                          ))
                    else if (isMenuVisible != null &&
                        isMenuVisible == true) ...[
                      Container(
                          width: getScreenWidth(context),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: HomeTopHeader()),
                      AppSpacerH(70),
                    ]
                  ],
                ),
                Expanded(
                  child: Container(
                    child: body,
                    width: MediaQuery.of(context).size.width,
                    // height: getScreenHeight(context) * 0.834,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
