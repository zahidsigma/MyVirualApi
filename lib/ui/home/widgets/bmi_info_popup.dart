import 'package:flutter/material.dart';

class BMIInfoPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        'Body Mass Index (BMI)',
        textAlign: TextAlign.center,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'BMI is a measure of body fat based on height and weight that applies to adult men and women.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            'Under weight = below 18.5 \nNormal weight = 18.5 to 24.9\nOver weight = 25 to 29.9\nObesity = 30 or greater',
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
