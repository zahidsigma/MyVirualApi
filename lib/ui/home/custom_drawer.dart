// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// import 'package:virualapi/widgets/avatar_with_loader.dart';
// import 'package:virualapi/widgets/misc_widget.dart';

// enum DrawerType { Profile, Payments, Logout }

// class CustomDrawer extends GetView<HomeController> {
//   final List<Map<String, dynamic>> drawerList = [
//     {
//       "title": "Account View/Edit",
//       "icon": "profile_ic.png",
//       "type": DrawerType.Profile,
//       "route": Routers.updateProfile,
//     },
//     {
//       "title": "Payment History",
//       "icon": "payment_ic.png",
//       "type": DrawerType.Payments,
//       "route": Routers.PaymentScreen
//     },
//     {
//       "title": "Logout",
//       "icon": "logout_ic.png",
//       "type": DrawerType.Logout,
//       "route": ""
//     }
//   ];

//   _onDrawerItemTapped(item) async {
//     try {
//       controller.homeKey.currentState!.closeDrawer();
//     } catch (e) {
//       print("_onDrawerItemTapped_error $e");
//     }

//     await Future.delayed(Duration(milliseconds: 150));
//     if (item["type"] == DrawerType.Logout) {
//       // controller.logout();
//     } else if (item["route"].toString().isNotEmpty) {
//       Get.toNamed(item["route"]);
//     }
//   }

//   Widget _renderItem(Map<String, dynamic> item) => GestureDetector(
//         onTap: () => _onDrawerItemTapped(item),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 36,
//                   height: 36,
//                   margin: EdgeInsets.only(left: 5, right: 5),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Center(
//                     child: Image.asset(
//                       "assets/icons/${item['icon']}",
//                       width: 18,
//                       height: 18,
//                     ),
//                   ),
//                 ),
//                 Text(item["title"]),
//               ],
//             ),
//             Divider(),
//           ],
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 DrawerHeader(
//                   child: Row(
//                     children: [
//                       Stack(
//                         children: [
//                           Positioned(
//                             right: 0,
//                             bottom: 0,
//                             child: CircleAvatar(
//                               radius: 17,
//                               backgroundColor: COLOR_GREEEN_TEXT,
//                               child: IconButton(
//                                 icon: Icon(Icons.edit,
//                                     size: 17, color: Colors.white),
//                                 onPressed: () {
//                                   // Trigger observable state changes here
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       AppSpacerW(10),
//                       // Column(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   children: [
//                       //     Container(
//                       //       margin: EdgeInsets.only(bottom: 10),
//                       //       width: Get.width * 0.38,
//                       //       child: Obx(() {
//                       //         // Update only this part when observable changes
//                       //         return Text(
//                       //           controller.userName
//                       //               .value, // Example observable variable
//                       //           style: TextStyle(
//                       //             color: COLOR_PRIMARY,
//                       //             fontSize: 19,
//                       //             fontWeight: FontWeight.bold,
//                       //           ),
//                       //         );
//                       //       }),
//                       //     ),
//                       //   ],
//                       // )
//                     ],
//                   ),
//                 ),
//                 ...drawerList.map((e) => _renderItem(e)),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 17.0),
//             child: Text(
//               "Powered by Digicare LLC, USA",
//               style: TextStyle(color: COLOR_PRIMARY),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ImageProvider<Object> getUserImage() {
//   if (controller.userImageSource.value != null)
//     return FileImage(controller.userImageSource.value!);
//   else if (controller.user.value?.picMetaData != null)
//     return NetworkImage(controller.user.value!.picMetaData!.publicUrl!);
//   return AssetImage("assets/images/profile.png");
// // }

// getName() => controller.user.value?.name;

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // Add a ListView to the drawer. This ensures the user can scroll
//       // through the options in the drawer if there isn't enough vertical
//       // space to fit everything.
//       child: Obx(
//         () => Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 // Important: Remove any padding from the ListView.
//                 padding: EdgeInsets.zero,
//                 children: [
//                   DrawerHeader(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Stack(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       bottom: 5.0, right: 10),
//                                   child: AvatarWithLoader(
//                                     radius: 40,
//                                     // imageUrl: controller
//                                     //     .user.value?.picMetaData?.publicUrl,
//                                     // fileImage: controller.userImageSource.value,
//                                   ),
//                                 ),
//                                 Positioned(
//                                   right: 0,
//                                   bottom: 0,
//                                   child: CircleAvatar(
//                                     radius: 17,
//                                     backgroundColor: COLOR_ACCENT,
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.edit,
//                                         size: 17,
//                                         color: Colors.white,
//                                       ),
//                                       onPressed: () {},
//                                       // onPressed: controller.getImage,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             AppSpacerW(10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(bottom: 10),
//                                   width: Get.width * 0.38,
//                                   child: Text(
//                                     // getName() ?? "",
//                                     "Haris",
//                                     style: TextStyle(
//                                         color: COLOR_PRIMARY,
//                                         fontSize: 19,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 // Text(
//                                 //   "Anna Lisa",
//                                 //   style: TextStyle(
//                                 //       color: Colors.black38,
//                                 //       fontSize: 13,
//                                 //       fontWeight: FontWeight.bold),
//                                 // ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   ...drawerList.map((e) => _renderItem(e)),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 17.0),
//               child: Text(
//                 "Powered by Digicare LLC, USA",
//                 style: TextStyle(color: Colors.black38),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/resusable_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

enum DrawerType {
  About,
  IsMylegit,
  privacypolicy,
  reviews,
}

class CustomDrawer extends GetView<HomeController> {
  final List<Map<String, dynamic>> drawerList = [
    {
      "title": "About My Virtual PI",
      "icon": "assets/icons/aboutmy.svg",
      "type": DrawerType.About,
      "route": Routers.about,
    },
    {
      "title": "Is My Virtual PI Legit?",
      "icon": "assets/icons/islegit.svg",
      "type": "",
      "route": "",
    },
    {
      "title": "Privacy Policy",
      "icon": "assets/icons/privacy.svg",
      "type": DrawerType.privacypolicy,
      "route": Routers.privacy,
    },
    {
      "title": "Reviews",
      "icon": "assets/icons/reviews.svg",
      "type": DrawerType.reviews,
      "route": Routers.reviewScreen,
    }
  ];

  // void _onDrawerItemTapped(Map<String, dynamic> item) async {
  //   try {
  //     controller.homeKey.currentState?.closeDrawer();
  //   } catch (e) {
  //     print("_onDrawerItemTapped_error $e");
  //   }

  //   await Future.delayed(Duration(milliseconds: 150));

  //   if (item["type"] == DrawerType.privacypolicy) {
  //     controller.homeKey.currentState?.closeDrawer();
  //     // Handle logout logic
  //     // controller.logout();
  //   } else if (item["route"].toString().isNotEmpty) {
  //     controller.homeKey.currentState?.closeDrawer();
  //     Get.toNamed(item["route"]);
  //   }
  //}
  // void _onDrawerItemTapped(Map<String, dynamic> item) async {
  //   try {
  //     controller.homeKey.currentState?.closeDrawer();
  //   } catch (e) {
  //     print("_onDrawerItemTapped_error $e");
  //   }

  //   await Future.delayed(const Duration(milliseconds: 150));

  //   final type = item["type"];
  //   final route = item["route"].toString();

  //   if (route.isNotEmpty) {
  //     // Navigate via route if present
  //     Get.toNamed(route);
  //   } else {
  //     // Otherwise internal screen switching
  //     if (type == DrawerType.reviews) {
  //       controller.openDrawerScreen(DrawerScreen.review);
  //     } else if (type == DrawerType.privacypolicy) {
  //       controller.openDrawerScreen(DrawerScreen.privacy);
  //     } else if (type == DrawerType.About) {
  //       controller.openDrawerScreen(DrawerScreen.about);
  //     } else if (type == DrawerType.IsMylegit) {
  //       controller.openDrawerScreen(DrawerScreen.legit);
  //     }
  //   }
  // }

  void _onDrawerItemTapped(Map<String, dynamic> item) async {
    try {
      controller.homeKey.currentState?.closeDrawer();
    } catch (e) {
      print("_onDrawerItemTapped_error $e");
    }

    await Future.delayed(Duration(milliseconds: 150));

    final route = item["route"]?.toString();
    if (route != null && route.isNotEmpty) {
      Get.toNamed(route);
    }
  }

  final share = SharePlus.instance;

  // void shareYouTube() {
  //   share.share('https://youtu.be/your_video_id' as ShareParams);
  // }

  // void shareInstagram() {
  //   share.share('https://instagram.com/yourprofile' as ShareParams);
  // }
  Widget socialShareRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text:
                    'Check this out on YouTube: https://youtu.be/your_video_id',
              ),
            );
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text: 'Like us on Facebook: https://facebook.com/myvirtualpi',
              ),
            );
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text:
                    'Follow us on Instagram: https://instagram.com/myvirtualpi',
              ),
            );
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueAccent),
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text:
                    'Connect with us on LinkedIn: https://linkedin.com/in/yourprofile',
              ),
            );
          },
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.xTwitter, color: Colors.black),
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                text:
                    'text: Follow us on Twitter: https://twitter.com/yourhandle',
              ),
            );
          },
        ),
      ],
    );
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                      child: ReusableWidget.loadSvg(item["icon"], height: 20)),
                ),
                Expanded(
                  child: Text(
                    item["title"],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  // ✅ or use Get.back()
                },
                child: Icon(Icons.close, size: 25),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              padding: EdgeInsets.zero,
              children: drawerList.map((item) => _renderItem(item)).toList(),
            ),
          ),
          AppSpacerH(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Text(
                'FOLLOW US',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: DARK_BG_COLOR,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          AppSpacerH(30),
          socialShareRow(),
          Expanded(child: Container()),
          Center(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Powered By",
                      style: TextStyle(
                        color: DARK_BG_COLOR,
                        fontSize: 12,
                      ),
                    ),
                    ReusableWidget.loadSvg("assets/icons/powerdlogo.svg",
                        height: 20),
                    Text(
                      "Virtual Pi ",
                      style: TextStyle(
                        color: DARK_BG_COLOR,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
