import 'package:flutter/material.dart';
import 'widgets/body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber, height: double.infinity, child: Body());
  }
}
