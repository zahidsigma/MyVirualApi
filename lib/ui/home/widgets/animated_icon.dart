import 'dart:math';

import 'package:flutter/material.dart';

class LiveStreamingIcon extends StatefulWidget {
  @override
  _LiveStreamingIconState createState() => _LiveStreamingIconState();
}

class _LiveStreamingIconState extends State<LiveStreamingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.141,
          child: Icon(
            Icons.fiber_manual_record,
            size: 100,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
