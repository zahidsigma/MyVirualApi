import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class EmptyList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  EmptyList(
      {required this.title, required this.subtitle, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${imagePath}.png",
            // width: 100,
            // height: 100,
          ),
          AppSpacerH(16.0),
          Text(
            title,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                textBaseline: TextBaseline.alphabetic,
                color: Colors.black54),
          ),
          AppSpacerH(5),
          Divider(
            thickness: 5,
            indent: getScreenWidth(context) * 0.42,
            endIndent: getScreenWidth(context) * 0.42,
            color: COLOR_ACCENT.withOpacity(0.5),
          ),
          AppSpacerH(8.0),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 14, fontFamily: 'Poppins', color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
