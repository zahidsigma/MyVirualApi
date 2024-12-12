import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function()? onSeeAll;
  final Widget? endWidget;
  double? fontSize;
  HomeTitle(
      {super.key,
      required this.title,
      this.onSeeAll,
      this.subtitle,
      this.endWidget,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? 22,
                color: Colors.black45,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSpacerH(5),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(color: COLOR_ACCENT),
            )
            // const Divider(
            //   thickness: 5,
            //   indent: 0,
            //   endIndent: 310,
            //   color: COLOR_ACCENT,
            // ),
          ],
        ),
        if (subtitle != null && (subtitle?.isNotEmpty ?? false))
          GestureDetector(
            onTap: () => onSeeAll != null ? onSeeAll!.call() : null,
            child: Text(
              subtitle ?? "",
              style: TextStyle(fontSize: 12, color: COLOR_ACCENT),
            ),
          ),
        if (endWidget != null) endWidget!
      ],
    );
  }
}
