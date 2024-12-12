import 'package:flutter/material.dart';

class PatientWidget extends StatelessWidget {
  final Map<String, dynamic> patient;
  final VoidCallback onTap;
  final bool isSelected;
  const PatientWidget(
      {super.key,
      required this.patient,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var color = Color(0xffD2E8F0);
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: isSelected ? color : Colors.white,
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(50)),
          child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: patient["name"],
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(text: " - "),
                TextSpan(
                    text: patient["relation"],
                    style: TextStyle(color: Colors.black87))
              ]),
              style: TextStyle(fontSize: 12)),
        ));
  }
}
