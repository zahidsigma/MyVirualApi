import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/PrivacyPolicy/privac_pplicy.dart';
import 'package:virualapi/ui/Review/review_screen.dart';
import 'package:virualapi/ui/about/aboutScreen.dart';
import 'package:virualapi/ui/home/custom_drawer.dart';
import 'package:virualapi/ui/home/home.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/notification/notification.dart';
import 'package:virualapi/ui/profile/profile.dart';
import 'package:virualapi/ui/support/support.dart';
import 'package:virualapi/utils/metrics.dart';
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
        endDrawer: Padding(
          padding:
              EdgeInsets.symmetric(vertical: getScreenHeight(context) * 0.1),
          child: SizedBox(
            height: getScreenHeight(context) * 0.8,
            width: getScreenWidth(context) / 1.5,
            child: CustomDrawer(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(indexChanged: _indexChanged),
        backgroundColor: COLOR_BACKGROUND,
        body: Obx(() {
          switch (controller.activeDrawerScreen.value) {
            case DrawerScreen.about:
              return AboutScreen(onBack: controller.closeDrawerScreen);
            case DrawerScreen.review:
              return ReviewScreen(onBack: controller.closeDrawerScreen);
            case DrawerScreen.privacy:
              return PrivacyScreen(onBack: controller.closeDrawerScreen);
            // case DrawerScreen.legit:
            //   return LegitScreen(onBack: controller.closeDrawerScreen);
            default:
              return pages[selectedIndex];
          }
        }));

    // body: pages[selectedIndex]);
  }
}

// _showSimpleModalDialog(context) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//           child: Container(
//             constraints: BoxConstraints(maxHeight: 350),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     textAlign: TextAlign.justify,
//                     text: TextSpan(
//                         text: "Text",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14,
//                             color: Colors.black,
//                             wordSpacing: 1)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }
