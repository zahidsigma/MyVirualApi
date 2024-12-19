import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/home.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/notification/notification.dart';
import 'package:virualapi/ui/profile/profile.dart';
import 'package:virualapi/ui/support/support.dart';
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
    // HomeDataScreen(),
    // Treatments(),
    // MedicationScreen(),
    // LabReportScreen(),
    Home(),
    NotificationScreen(),
    Support(),
    Profile()
  ];

  void _indexChanged(index) {
    setState(() {
      selectedIndex = index;
      print("Selected Index: $selectedIndex"); // Debugging line
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.homeKey,
        // drawer: CustomDrawer(),
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
