import 'package:flutter/material.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:dotted_line/dotted_line.dart';

class BookingText extends StatelessWidget {
  String title;
  TextEditingController? controller;
  String? Function(String?)? validator;
  BookingText({required this.title, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Colors.black45,
                    wordSpacing: 1),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.red,
                    ),
                  )
                ]),
          ),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty)
                return "This field is required";
              return null;
            },
            decoration: InputDecoration(border: InputBorder.none),
          ),
          DottedLine(
            dashLength: 8.0,
            lineLength: getScreenWidth(context) * 0.4,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
