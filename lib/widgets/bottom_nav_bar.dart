import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:collection/collection.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int index) indexChanged;
  BottomNavBar({super.key, required this.indexChanged});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedScreenIndex = 0;
  final selectedItemColor = COLOR_PRIMARY;
  final unselectedItemColor = Colors.grey;

  isSelected(index) => selectedScreenIndex == index;
  getColor(index) =>
      isSelected(index) ? selectedItemColor : unselectedItemColor;

  BottomNavigationBarItem getNavItem(item, index) => BottomNavigationBarItem(
        label: item["title"],
        icon: Image.asset(
          "assets/images/${item['icon']}",
          width: getScreenWidth(context) * (index != 1 ? 0.075 : 0.1),
          height: getScreenHeight(context) * 0.05,
          color: getColor(index),
          fit: BoxFit.scaleDown,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        key: Get.find<HomeController>().bottomWidgetKey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        backgroundColor: Colors.white,
        currentIndex: selectedScreenIndex,
        onTap: (index) {
          widget.indexChanged(index);
          setState(() {
            selectedScreenIndex = index;
          });
        },
        items: bottomNavList.mapIndexed((i, e) => getNavItem(e, i)).toList());
  }
}
