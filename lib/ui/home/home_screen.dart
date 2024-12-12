import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/home/home_data_screen.dart';
import 'package:virualapi/ui/treatments/treatments.dart';
import 'package:virualapi/ui/home/widgets/drawer.dart';
import 'package:virualapi/ui/lab_reports/lab_report.dart';
import 'package:virualapi/ui/medication/medication.dart';
import 'package:virualapi/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final controller = Get.find<HomeController>();
  List<Widget> pages = [
    HomeDataScreen(),
    Treatments(),
    MedicationScreen(),
    LabReportScreen(),
  ];

  void _indexChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.homeKey,
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomNavBar(indexChanged: _indexChanged),
        backgroundColor: COLOR_BACKGROUND,
        body: pages[selectedIndex]);
  }
}

_showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: "Text",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1)),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
