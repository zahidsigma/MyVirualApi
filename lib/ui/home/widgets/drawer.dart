import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/widgets/avatar_with_loader.dart';
import 'package:virualapi/widgets/misc_widget.dart';

enum DrawerType { Profile, Payments, Logout }

class CustomDrawer extends GetView<HomeController> {
  final List<Map<String, dynamic>> drawerList = [
    {
      "title": "Account View/Edit",
      "icon": "profile_ic.png",
      "type": DrawerType.Profile,
      "route": Routers.updateProfile,
    },
    {
      "title": "Payment History",
      "icon": "payment_ic.png",
      "type": DrawerType.Payments,
      "route": Routers.PaymentScreen
    },
    {
      "title": "Logout",
      "icon": "logout_ic.png",
      "type": DrawerType.Logout,
      "route": ""
    }
  ];

  _onDrawerItemTapped(item) async {
    try {
      controller.homeKey.currentState!.closeDrawer();
    } catch (e) {
      print("_onDrawerItemTapped_error $e");
    }

    await Future.delayed(Duration(milliseconds: 150));
    if (item["type"] == DrawerType.Logout) {
      controller.logout();
    } else if (item["route"].toString().isNotEmpty) {
      Get.toNamed(item["route"]);
    }
  }

  Widget _renderItem(Map<String, dynamic> item) => GestureDetector(
        onTap: () => _onDrawerItemTapped(item),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/${item['icon']}",
                      width: 18,
                      height: 18,
                    ),
                  ),
                ),
                Text(item["title"]),
              ],
            ),
            Divider(),
          ],
        ),
      );

  // ImageProvider<Object> getUserImage() {
  //   if (controller.userImageSource.value != null)
  //     return FileImage(controller.userImageSource.value!);
  //   else if (controller.user.value?.picMetaData != null)
  //     return NetworkImage(controller.user.value!.picMetaData!.publicUrl!);
  //   return AssetImage("assets/images/profile.png");
  // }

  getName() => controller.user.value?.name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5.0, right: 10),
                                  child: AvatarWithLoader(
                                    radius: 40,
                                    imageUrl: controller
                                        .user.value?.picMetaData?.publicUrl,
                                    fileImage: controller.userImageSource.value,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: COLOR_ACCENT,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        size: 17,
                                        color: Colors.white,
                                      ),
                                      onPressed: controller.getImage,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            AppSpacerW(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: Get.width * 0.38,
                                  child: Text(
                                    getName() ?? "",
                                    style: TextStyle(
                                        color: COLOR_PRIMARY,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Text(
                                //   "Anna Lisa",
                                //   style: TextStyle(
                                //       color: Colors.black38,
                                //       fontSize: 13,
                                //       fontWeight: FontWeight.bold),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ...drawerList.map((e) => _renderItem(e)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 17.0),
              child: Text(
                "Powered by Digicare LLC, USA",
                style: TextStyle(color: Colors.black38),
              ),
            )
          ],
        ),
      ),
    );
  }
}
