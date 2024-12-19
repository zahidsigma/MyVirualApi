import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/navigator_service.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class PageViewItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isLast;

  final PageController controller;
  final double currentPage;
  const PageViewItem(
      {super.key,
      required this.item,
      required this.isLast,
      required this.currentPage,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: getScreenWidth(context) * 0.9,
      // height: getScreenHeight(context) * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            item["image"],
            fit: BoxFit.cover,
            width: getScreenWidth(context) * 9,
            height: getScreenHeight(context) * 0.62,
          ),
          AppSpacerH(18.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                // Default color
              ),
              children: [
                TextSpan(
                    text: item['title'],
                    style: TextStyle(
                        color: GREY_TEXT_COLOR, fontSize: 25)), // Normal style
                TextSpan(
                  text: item['subtitle'], // Bold style
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                TextSpan(
                  text: item['content'], // Bold style
                  style: TextStyle(color: GREY_TEXT_COLOR, fontSize: 25),
                ),
              ],
            ),
          ),
          // Text(
          //   item["title"],
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //       fontFamily: 'Poppinsb', fontSize: 24, color: COLOR_PRIMARY),
          // ),
          // Text(
          //   item["content"],
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       fontFamily: 'Poppinsb', fontSize: 15, color: Color(0xFF414141)),
          // ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) {
                return Container(
                  margin: EdgeInsets.only(right: 5),
                  alignment: Alignment.centerLeft,
                  height: 9,
                  width: currentPage == index ? 25 : 10,
                  decoration: BoxDecoration(
                    borderRadius: currentPage == index
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(12.5),
                    color:
                        currentPage == index ? Colors.white : GREY_TEXT_COLOR,
                    // shape: currentPage == index
                    //     ? BoxShape.rectangle
                    //     : BoxShape.circle,
                    // color: currentPage == index
                    //     ? Color(0xFFEB8F07)
                    //     : Colors.black12,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


//  Image.asset("assets/images/bg.png",
//                 fit: BoxFit.cover,
//                 width: getScreenWidth(context),
//                 height: getScreenHeight(context)),