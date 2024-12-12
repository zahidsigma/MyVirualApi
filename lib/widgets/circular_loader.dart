import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';

class CircluarLoader extends StatelessWidget {
  const CircluarLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: COLOR_ACCENT),
    );
  }
}
