import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:virualapi/constants/config.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/profile/edit_profile.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';
import 'package:virualapi/ui/profile/recent_history_conroller.dart';
import 'package:virualapi/utils/api_url_utils.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/listview_item.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class Profile extends StatefulWidget {
  final int startingViewIndex;
  Profile({super.key, this.startingViewIndex = 0});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with RouteAware {
  final ProfileController controller = Get.isRegistered<ProfileController>()
      ? Get.find<ProfileController>()
      : Get.put(ProfileController())
    ..fetchUser();

  // late int currentViewIndex;
  // ProfileView currentView = ProfileView.profile;

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteObserver<PageRoute>()
        .subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    RouteObserver<PageRoute>().unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when user navigates back to this screen
    controller.resetToProfile();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   currentViewIndex = widget.startingViewIndex;
  //   print("Change: $currentViewIndex");
  // }

  // }

  // @override
  // Widget build(BuildContext context) {
  //   return BodyWithHeader(
  //     isBackVisible: currentView != ProfileView.profile,
  //     isrofile: currentView == ProfileView.profile,
  //     isMenuVisible: true,
  //     onBackPressed: () {
  //       setState(() {
  //         if (currentView == ProfileView.recentDetail) {
  //           currentView = ProfileView.recentList; // go back to list
  //         } else {
  //           currentView = ProfileView.profile; // go back to profile
  //         }
  //       });
  //     },
  //     istitle: true,
  //     title: 'My',
  //     subtitle: 'Profile',
  //     body: Builder(
  //       builder: (context) {
  //         switch (currentView) {
  //           case ProfileView.profile:
  //             return _buildProfileView();
  //           case ProfileView.recentList:
  //             return _RecentActivity(onItemSelected: () {
  //               setState(() {
  //                 currentView = ProfileView.recentDetail;
  //               });
  //             });
  //           case ProfileView.recentDetail:
  //             return _RecentDetail(context);
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BodyWithHeader(
        isBackVisible: controller.currentView.value != ProfileView.profile,
        isrofile: controller.currentView.value == ProfileView.profile,
        isMenuVisible: true,
        onBackPressed: () {
          if (controller.currentView.value == ProfileView.recentDetail) {
            controller.goToRecentList();
          } else {
            controller.goToProfile();
          }
        },
        istitle: true,
        title: 'My',
        subtitle: 'Profile',
        body: Builder(
          builder: (context) {
            switch (controller.currentView.value) {
              case ProfileView.profile:
                return _buildProfileView();
              case ProfileView.recentList:
                return _RecentActivity(onItemSelected: () {
                  controller.goToRecentDetail();
                });
              case ProfileView.recentDetail:
                return _RecentDetail(context);
            }
          },
        ),
      );
    });
  }

  Widget _buildProfileView() {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: getScreenHeight(context) * 0.1),

          // Profile avatar

          // Name
          Obx(() => Text(
                controller.name.value.isNotEmpty
                    ? controller.name.value
                    : 'No Name',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 8),

          // Email
          Obx(() => Text(
                controller.email.value.isNotEmpty
                    ? controller.email.value
                    : 'No Email',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )),
          const SizedBox(height: 5),

          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: COLOR_PRIMARY,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () async {
                await Get.to(() => ProfileSettingsPage());
                controller.fetchUser();
              },
              child: const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Divider(height: 1),

          // Option list
          // OptionTile(
          //   icon: SvgPicture.asset("assets/images/subscription.svg",
          //       width: 18, height: 18),
          //   text: "Subscription Details",
          //   onTap: () => Get.to(() => SubscriptionScreen()),
          // ),
          OptionTile(
            icon: SvgPicture.asset("assets/images/time.svg",
                width: 18, height: 18),
            text: "Recent Activity",
            onTap: () {
              controller.currentView.value = ProfileView.recentList;
            },
          ),

          OptionTile(
            icon: SvgPicture.asset("assets/images/logout.svg",
                width: 18, height: 18),
            text: "Logout",
            onTap: controller.logoutUser,
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color iconColor;

  const OptionTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor = Colors.black,
    this.iconColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      color: const Color(0xffEBEFEF),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 14, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _RecentActivity({required VoidCallback onItemSelected}) {
  final controller = Get.put(RecentHistoryController());

  return Obx(() {
    if (controller.isBusy.value) {
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              children: [
                TextSpan(
                  text: 'Recent ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Activity',
                ),
              ],
            ),
          ),
        ),
        AppSpacerH(20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Obx(() {
              if (controller.isBusy.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.dataList.isEmpty) {
                return Center(child: Text('No recent activity found.'));
              }

              return ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (context, index) {
                  final item = controller.dataList[index];

                  return CompletedListItem(
                    name: '${item.firstName} ${item.lastName}',
                    orderEmail: item.email,
                    userEmail: item.user_email,
                    onDetailsTap: () {
                      controller.selectedOrder.value = item;
                      onItemSelected();
                      // TODO: Navigate to detail screen or open PDF/report link
                      print('Open report for ${item.firstName}');
                    },
                  );
                },
              );
            }),
          ),
        ),
      ],
    );
  });
}

Widget _RecentDetail(BuildContext context) {
  final controller = Get.find<RecentHistoryController>();
  final selected = controller.selectedOrder.value;

  if (selected == null) return Center(child: Text("No detail selected"));

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              children: [
                TextSpan(
                  text: 'Recent ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Activity',
                ),
              ],
            ),
          ),
        ),
        AppSpacerH(10),
        Row(
          children: [
            // Left info box
            Expanded(
              child: Container(
                height: getScreenHeight(context) * 0.23,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableWidget.loadSvg("assets/icons/infosearch.svg",
                        height: 60),
                    SizedBox(height: 10),
                    Text("Investigation Search",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(selected.createdAt.split('T').first),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          selected.createdAt.split('T').last.split('.').first,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            // Right status box
            Expanded(
              child: Container(
                height: getScreenHeight(context) * 0.23,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xff0252C9), Color(0xff000000)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 60),
                    SizedBox(height: 10),
                    Text(
                      "Search request for ${selected.firstName} ${selected.lastName} has been completed.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        // ElevatedButton(
        //   onPressed: () {
        //     final url = selected.reportLinks.isNotEmpty
        //         ? selected.reportLinks.first
        //         : null;
        //     if (url != null) {
        //       print("Download: $url");
        //       SnackbarUtil.info(message: "Your Report Has Been Downloaded");
        //       // TODO: implement PDF viewer or download logic
        //     }
        //   },
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.black,
        //     minimumSize: Size.fromHeight(45),
        //     shape: const StadiumBorder(),
        //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        //   ),
        //   child: Text("Download Report"),
        // ),

// Inside your widget or function:
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: COLOR_PRIMARY,
            minimumSize: Size.fromHeight(45),
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          ),
          onPressed: () async {
            final relativeUrl =
                'storage/app/public/reports/workplace_records_1752163008.pdf';
            final baseUrl =
                'https://server.testlinkwebsitespace.com/virtual-pi-backend/';
            final fullUrl = Uri.parse(baseUrl).resolve(relativeUrl).toString();

            final status = await Permission.storage.request();
            if (!status.isGranted) {
              SnackbarUtil.error(message: "Storage permission denied");
              return;
            }

            Directory? dir;
            try {
              if (Platform.isAndroid) {
                dir = await getExternalStorageDirectory();
              } else if (Platform.isIOS) {
                dir = await getApplicationDocumentsDirectory();
              } else {
                dir = await getApplicationDocumentsDirectory(); // fallback
              }
            } catch (e) {
              SnackbarUtil.error(message: "Cannot access storage directory");
              return;
            }

            if (dir == null) {
              SnackbarUtil.error(message: "Cannot access storage directory");
              return;
            }

            final fileName =
                "report_${DateTime.now().millisecondsSinceEpoch}.pdf";
            final savePath = "${dir.path}/$fileName";

            try {
              print('Downloading from: $fullUrl');
              print('Saving to: $savePath');

              await Dio().download(fullUrl, savePath);

              SnackbarUtil.info(message: "Report Download And Saved");
              print("PDF saved to $savePath");
            } catch (e) {
              print("Download failed: $e");
              SnackbarUtil.error(message: "Download failed");
            }
          },
          child: Text("Download Report"),
        )
      ],
    ),
  );
}
