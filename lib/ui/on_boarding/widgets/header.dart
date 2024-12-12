import 'package:flutter/material.dart';
import 'package:virualapi/utils/metrics.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.2,
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
