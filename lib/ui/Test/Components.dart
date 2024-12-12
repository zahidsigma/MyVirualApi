import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/medical_drop_down.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  String? temperature = "1";
  String? bp_high = "40";
  String? bp_low = "40";
  String? bg_fasting = "40";
  String? bg_after_meal = "40";
  String? ox_st = "70";

  _renderSeparator({top = 0.0, bottom = 10.0}) => Padding(
      padding: EdgeInsets.only(bottom: bottom, top: top),
      child: Divider(thickness: 1, color: Colors.black12));

  _renderBottomTitles(title1, title2) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title1,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black26,
                    fontFamily: 'Poppinsl'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                title2,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black26,
                    fontFamily: 'Poppinsl'),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Booking appointment with Dr. Talha Seraj (Test) for Test Patient 1",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jan 14, 2022 (04:30 pm)",
                    style:
                        TextStyle(color: COLOR_ACCENT, fontFamily: "Poppinssb"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MedicalDropDown(
                      icon: "assets/images/temprature.png",
                      title: "Temprature",
                      value: temperature,
                      maxCount: 110,
                      units: "F",
                      onChanged: (val) => setState(() {
                            temperature = val;
                          })),
                  _renderSeparator(),
                  MedicalDropDown(
                      icon: "assets/images/blood_pressure.png",
                      title: "Blood Pressure",
                      units: "mg/dl",
                      value: bp_high,
                      maxCount: 110,
                      onChanged: (val) => setState(() {
                            bp_high = val;
                          }),
                      units1: "mmHg",
                      value1: bp_low,
                      maxCount1: 110,
                      onChanged1: (val) => setState(() {
                            bp_low = val;
                          })),
                  _renderSeparator(top: 5.0, bottom: 0.0),
                  _renderBottomTitles("high (sys)", "low (dia)"),
                  SizedBox(
                    height: 15,
                  ),
                  MedicalDropDown(
                      icon: "assets/images/blood_glucose.png",
                      title: "Blood Glucose",
                      units: "mg/dl",
                      value: bg_fasting,
                      maxCount: 110,
                      onChanged: (val) => setState(() {
                            bg_fasting = val;
                          }),
                      units1: "mg/dl",
                      value1: bg_after_meal,
                      maxCount1: 110,
                      onChanged1: (val) => setState(() {
                            bg_after_meal = val;
                          })),
                  _renderSeparator(top: 5.0, bottom: 0.0),
                  _renderBottomTitles("Fasting", "After Meal"),
                  SizedBox(
                    height: 15,
                  ),
                  MedicalDropDown(
                    icon: "assets/images/oxygen_saturation.png",
                    title: "Oxygen Saturation",
                    units: "%",
                    value: ox_st,
                    maxCount: 110,
                    onChanged: (val) => setState(() {
                      ox_st = val;
                    }),
                  ),
                  _renderSeparator(top: 5.0, bottom: 0.0),
                  _renderBottomTitles("SpO", ""),
                  SizedBox(
                    height: 25,
                  ),
                  Button(
                    title: "CONTINUE",
                    onPressed: () {},
                    height: 50,
                    backgroundColor: COLOR_ACCENT,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Back",
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
