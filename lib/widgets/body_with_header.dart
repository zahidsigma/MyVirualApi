// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// import 'package:virualapi/ui/home/home_top_header.dart';

// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/widgets/misc_widget.dart';
// import 'package:virualapi/widgets/resusable_widget.dart';

// class BodyWithHeader extends StatelessWidget {
//   final Widget body;
//   final Color backgroundColor;
//   bool? isBackVisible = true;
//   bool? isMenuVisible = false;
//   bool? islogovisible = false;
//   bool? isrofile = false;
//   String? title = "";
//   String? subtitle;
//   BodyWithHeader(
//       {super.key,
//       required this.body,
//       this.isBackVisible,
//       this.isMenuVisible,
//       this.title,
//       this.isrofile,
//       this.subtitle,
//       this.islogovisible,
//       this.backgroundColor = const Color.fromARGB(255, 241, 239, 239)});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomeController>();
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor:
//           isMenuVisible == true ? Color(0xffF6F6F6) : DARK_BG_COLOR,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(top: 10),
//           child: Column(
//               crossAxisAlignment: islogovisible == true
//                   ? CrossAxisAlignment.center
//                   : CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 if (islogovisible == true)
//                   Image.asset(
//                     'assets/images/logoapi.png',
//                     height: getScreenHeight(context) * 0.18,
//                   ),
//                 Row(
//                   children: [
//                     if (isBackVisible == true)
//                       IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: Icon(
//                             Icons.chevron_left,
//                             size: 32,
//                             color: Colors.black,
//                           )),
//                     if (isMenuVisible != null && isMenuVisible == true) ...[
//                       Expanded(
//                         child: Container(
//                           width: getScreenWidth(context),
//                           height: 150,
//                           padding: EdgeInsets.symmetric(horizontal: 5),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 28,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w300,
//                                   ),
//                                   children: [
//                                     TextSpan(
//                                       text: '${title ?? ""}\n',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     TextSpan(text: subtitle),
//                                   ],
//                                 ),
//                               ),
//                               GestureDetector(
//                                   onTap: () => controller.homeKey.currentState!
//                                       .openEndDrawer(),
//                                   child: ReusableWidget.loadSvg(
//                                     "assets/icons/munuapi.svg",
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ),
//                       AppSpacerH(70),
//                     ]
//                   ],
//                 ),
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       Container(
//                         child: body,
//                         width: MediaQuery.of(context).size.width,
//                         height: getScreenHeight(context) * 0.7,
//                         margin: EdgeInsets.only(top: 40),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: isMenuVisible == true
//                                 ? BorderRadius.only(
//                                     topLeft: Radius.circular(50),
//                                     topRight: Radius.circular(50)
//                                     // topRight: Radius.circular(45)
//                                     )
//                                 : BorderRadius.only(
//                                     topLeft: Radius.circular(100),
//                                   )),
//                       ),
//                       Positioned(
//                           top: 0,
//                           left: getScreenWidth(context) / 2 - 50,
//                           child: isrofile == true
//                               ? Image.asset("assets/images/profile.png")
//                               : SizedBox()),
//                     ],
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/config.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/home/home_top_header.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/resusable_widget.dart';
import 'dart:io'; // for File handling
import 'package:shared_preferences/shared_preferences.dart';

class BodyWithHeader extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  bool? isBackVisible = false;
  bool? isMenuVisible = false;
  bool? islogovisible = false;
  final VoidCallback? onBackPressed;
  bool? isrofile = false;
  String? title = "";
  String? subtitle;
  String? middletext;
  bool? istitle;
  BodyWithHeader({
    super.key,
    required this.body,
    this.isBackVisible,
    this.isMenuVisible,
    this.istitle,
    this.title,
    this.isrofile,
    this.onBackPressed,
    this.subtitle,
    this.middletext,
    this.islogovisible,
    this.backgroundColor = const Color.fromARGB(255, 241, 239, 239),
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    final homecontroller = Get.find<HomeController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: istitle == true ? Color(0xffF6F6F6) : DARK_BG_COLOR,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(top: isBackVisible == true ? 0 : 30),
          child: Column(
              crossAxisAlignment: islogovisible == true
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (islogovisible == true)
                  Image.asset('assets/images/logoapi.png',
                      height: getScreenHeight(context) * 0.15),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    if (isMenuVisible == false)
                      Row(
                        children: [
                          IconButton(
                              onPressed: onBackPressed ??
                                  () {
                                    Navigator.of(context).pop();
                                  },
                              icon: Icon(
                                Icons.chevron_left,
                                size: 32,
                                color: istitle == true
                                    ? Colors.black
                                    : Colors.white,
                              )),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                              children: [
                                TextSpan(
                                  text: '${title ?? ""}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                TextSpan(
                                  text: '${middletext ?? ""}\n',
                                ),
                                TextSpan(
                                    text: subtitle,
                                    style: TextStyle(fontSize: 25)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (isMenuVisible != null && isMenuVisible == true) ...[
                      Expanded(
                        child: Container(
                          width: getScreenWidth(context),
                          height: 120,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: isBackVisible == true ? 20 : 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isBackVisible == true
                                    ? InkWell(
                                        onTap: onBackPressed ??
                                            () {
                                              Navigator.of(context).pop();
                                            },
                                        child: Icon(
                                          Icons.chevron_left,
                                          size: 32,
                                          color: istitle == true
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      )
                                    // ? IconButton(
                                    //     onPressed: onBackPressed ??
                                    //         () {
                                    //           Navigator.of(context).pop();
                                    //         },
                                    //     icon: Icon(
                                    //       Icons.chevron_left,
                                    //       size: 32,
                                    //       color: istitle == true
                                    //           ? Colors.black
                                    //           : Colors.white,
                                    //     ))
                                    : RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '${title ?? ""}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25),
                                            ),
                                            TextSpan(
                                              text: '${middletext ?? ""}\n',
                                            ),
                                            TextSpan(
                                                text: subtitle,
                                                style: TextStyle(fontSize: 25)),
                                          ],
                                        ),
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    homecontroller.homeKey.currentState!
                                        .openEndDrawer();
                                  },
                                  child: ReusableWidget.loadSvg(
                                      height: 40, "assets/icons/munuapi.svg"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      AppSpacerH(70),
                    ]
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        child: body,
                        width: MediaQuery.of(context).size.width,
                        // height: getScreenHeight(context) * 0.9,
                        margin: EdgeInsets.only(top: 30),
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: istitle == true
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)
                                    // topRight: Radius.circular(45)
                                    )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                  )),
                      ),
                      Positioned(
                        top: 0,
                        left: getScreenWidth(context) / 2 - 50,
                        child: isrofile == true
                            ? Obx(() {
                                final path = controller.profileImagePath.value;
                                ImageProvider? imageProvider;

                                if (path.isNotEmpty) {
                                  if (path.startsWith('http')) {
                                    imageProvider = NetworkImage(path);
                                  } else {
                                    final file = File(path);
                                    if (file.existsSync()) {
                                      imageProvider = FileImage(file);
                                    } else {
                                      print(
                                          "⚠️ File does not exist at path: $path");
                                    }
                                  }
                                }

                                return CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey[300],
                                  backgroundImage: imageProvider,
                                  child: imageProvider == null
                                      ? Icon(Icons.person,
                                          size: 50, color: Colors.grey)
                                      : null,
                                );
                              })
                            : Container(
                                height: 50,
                                color: Colors.blue,
                              ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Future<String?> loadProfileImage() async {
    final user = await AppPreferences.getUserData();
    if (user != null) {
      final imagePath = user.data.image;
      return imagePath != null ? "${AppConfig.imageBaseUrl}/$imagePath" : null;
    }
    return null;
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'package:virualapi/constants/config.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/widgets/misc_widget.dart';
// import 'package:virualapi/widgets/resusable_widget.dart';

// class BodyWithHeader extends StatelessWidget {
//   final Widget body;
//   final Color backgroundColor;
//   bool? isBackVisible = true;
//   bool? isMenuVisible = false;
//   bool? islogovisible = false;
//   bool? isrofile = false;
//   String? title = "";
//   String? subtitle;

//   BodyWithHeader({
//     super.key,
//     required this.body,
//     this.isBackVisible,
//     this.isMenuVisible,
//     this.title,
//     this.isrofile,
//     this.subtitle,
//     this.islogovisible,
//     this.backgroundColor = const Color.fromARGB(255, 241, 239, 239),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor:
//           isMenuVisible == true ? Color(0xffF6F6F6) : DARK_BG_COLOR,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(top: 10),
//           child: Column(
//             crossAxisAlignment: islogovisible == true
//                 ? CrossAxisAlignment.center
//                 : CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               if (islogovisible == true)
//                 Image.asset(
//                   'assets/images/logoapi.png',
//                   height: getScreenHeight(context) * 0.18,
//                 ),
//               Row(
//                 children: [
//                   if (isBackVisible == true)
//                     IconButton(
//                       onPressed: () => Get.back(),
//                       icon: Icon(Icons.chevron_left,
//                           size: 32, color: Colors.white),
//                     ),
//                   if (isMenuVisible == true)
//                     Expanded(
//                       child: Container(
//                         width: getScreenWidth(context),
//                         height: 150,
//                         padding: EdgeInsets.symmetric(horizontal: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                   fontSize: 28,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: '${title ?? ""}\n',
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   TextSpan(text: subtitle),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   AppSpacerH(70),
//                 ],
//               ),
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Container(
//                       child: body,
//                       width: MediaQuery.of(context).size.width,
//                       height: getScreenHeight(context) * 0.8,
//                       margin: EdgeInsets.only(top: 30),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: isMenuVisible == true
//                             ? BorderRadius.only(
//                                 topLeft: Radius.circular(50),
//                                 topRight: Radius.circular(50),
//                               )
//                             : BorderRadius.only(
//                                 topLeft: Radius.circular(100),
//                               ),
//                       ),
//                     ),
//                     if (isrofile == true)
//                       FutureBuilder<String?>(
//                         future: loadProfileImage(),
//                         builder: (context, snapshot) {
//                           final path = snapshot.data;
//                           ImageProvider? imageProvider;

//                           if (path != null && path.isNotEmpty) {
//                             if (path.startsWith('http')) {
//                               imageProvider = NetworkImage(path);
//                             } else if (File(path).existsSync()) {
//                               imageProvider = FileImage(File(path));
//                             }
//                           }

//                           return Positioned(
//                             top: 0,
//                             left: getScreenWidth(context) / 2 - 50,
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundColor: Colors.grey[300],
//                               backgroundImage: imageProvider,
//                               child: imageProvider == null
//                                   ? Icon(Icons.person,
//                                       size: 50, color: Colors.grey)
//                                   : null,
//                             ),
//                           );
//                         },
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<String?> loadProfileImage() async {
//     final user = await AppPreferences.getUserData();
//     final imagePath = user?.data.image;
//     return imagePath != null && imagePath.isNotEmpty
//         ? "${AppConfig.imageBaseUrl}/$imagePath"
//         : null;
//   }
// }
