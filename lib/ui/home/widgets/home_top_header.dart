import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class HomeTopHeader extends StatelessWidget {
  String? contact;
  HomeTopHeader({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () => controller.homeKey.currentState!.openDrawer(),
              child: ReusableWidget.loadSvg("assets/icons/menu.svg")),
          if (contact != null && contact!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customer Support",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                AppSpacerH(5),
                GestureDetector(
                  // icon: Icon(Icons.call, color: Colors.green),
                  child: Text(
                    contact!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Util.dialNumber(contact!);
                  },
                ),
              ],
            ),

          // GestureDetector(
          //   child: ReusableWidget.loadSvg("assets/icons/bell.svg"),
          // )
        ],
      ),
    );
  }
}
