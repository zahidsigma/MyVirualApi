import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomHeader({
    Key? key,
    required this.title,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      color: COLOR_PRIMARY,
      child: Row(
        children: [
          if (onBackPressed != null)
            GestureDetector(
              onTap: onBackPressed,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),

          SizedBox(width: 28 + 16), // reserve space so title stays aligned

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
