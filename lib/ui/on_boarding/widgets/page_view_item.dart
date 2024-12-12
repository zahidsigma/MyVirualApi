import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/navigator_service.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/utils/metrics.dart';

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
        width: getScreenWidth(context) * 0.7,
        height: getScreenHeight(context) * 0.5,
        child: Column(
          children: [
            Image.asset(
              item["image"],
              fit: BoxFit.cover,
              width: getScreenWidth(context) * 0.7,
              height: getScreenHeight(context) * 0.62,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5),
                    alignment: Alignment.centerLeft,
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPage == index
                          ? Color(0xFFEB8F07)
                          : Colors.black12,
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container()),
            Text(
              item["title"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Poppinsb', fontSize: 24, color: COLOR_PRIMARY),
            ),
            Text(
              item["content"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppinsb',
                  fontSize: 15,
                  color: Color(0xFF414141)),
            ),
          ],
        ));
  }
}
