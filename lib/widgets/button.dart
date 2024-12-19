import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/util.dart';

class Button extends StatelessWidget {
  final String title;
  final Function() onPressed;
  Color? backgroundColor = COLOR_PRIMARY;
  Color? foregroundColor = Colors.white;
  double? width;
  double height;
  final bool isLoading;
  final AlignmentGeometry alignment;
  final String? loadingMessage;
  bool? isLight = false;

  Button(
      {super.key,
      required this.title,
      required this.onPressed,
      this.loadingMessage,
      this.foregroundColor,
      this.isLoading = false,
      this.backgroundColor,
      this.width,
      this.alignment = Alignment.center,
      this.isLight,
      this.height = 45});

  @override
  Widget build(BuildContext context) {
    var color = isLight == true
        ? Util.getLightColor(backgroundColor!)
        : backgroundColor;
    return Align(
      alignment: alignment,
      child: Column(
        children: [
          isLoading && loadingMessage != null
              ? Text(loadingMessage!)
              : SizedBox(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: isLight == true ? Colors.transparent : color,
                  elevation: isLight == true ? 0 : 10,
                  fixedSize:
                      Size(width ?? getScreenWidth(context) * 0.8, height),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  backgroundColor: color),
              onPressed: !isLoading
                  ? () {
                      FocusManager.instance.primaryFocus
                          ?.unfocus(); //Dimiss keyboard
                      onPressed();
                    }
                  : null,
              child: isLoading
                  ? CircularProgressIndicator(
                      color: COLOR_ACCENT,
                    )
                  : Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Poppinsb',
                          color:
                              isLight == true ? backgroundColor : COLOR_ACCENT),
                    )),
        ],
      ),
    );
  }
}
