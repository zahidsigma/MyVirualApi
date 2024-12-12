import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/services/singleton.dart';
import 'package:virualapi/ui/doctor/widgets/doctor_card.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/home/widgets/home_categories.dart';
import 'package:virualapi/ui/home/widgets/home_header.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/video_calling/video_calling.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/alert_card.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDataScreen extends GetView<HomeController> {
  const HomeDataScreen({super.key});

  Widget _buildRegionalPartners() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppSpacerH(20),
      HomeTitle(
        title: "Healthcare Partners",

        // subtitle: "Pakistan",
      ),
      AppSpacerH(10),
      Container(
        width: double.infinity,
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = controller.regionalPartners[index];
            return Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          item["image"],
                          width: Get.width * 0.25,
                          height: Get.width * 0.25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item["name"],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: COLOR_PRIMARY,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Text(
                                "Tamaam medical sahuliyaat aap key dehleez per",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: COLOR_GRAY,
                                ),
                              ),
                            ),
                            AppSpacerH(5),
                            ElevatedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Color(0xFFe8f0fe),
                                    fixedSize: Size(80, 30),
                                    elevation: 0,
                                    shape: StadiumBorder()),
                                onPressed: () {
                                  launchUrl(Uri.parse(item["url"].toString()));
                                },
                                child: Text(
                                  "Visit",
                                  style: TextStyle(
                                      color: COLOR_BACKGROUND, fontSize: 12),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black38,
                          )),
                      child: Text(
                        "Pakistan",
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: controller.regionalPartners.length,
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                HomeHeader(
                  hintText: "Search a doctor for health issues",
                  subtitle: "Hello ${controller.user.value?.name ?? ''} ",
                  contact: "+92 (21) 34688106",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffF7F8F9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Column(
                          children: [
                            // ElevatedButton(
                            //     onPressed: () {

                            //     },
                            //     child: Text("Go")),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.offNamed(Routers.videoCalling);
                                  },
                                  child: HomeTitle(
                                    title: "Popular Categories",
                                    // onSeeAll: () {
                                    //   controller.isExpanded.value =
                                    //       !controller.isExpanded.value;
                                    // },
                                  ),
                                ),
                                HomeCategories(
                                  isExpanded: controller.isExpanded.value,
                                  categories: controller.specialties.value,
                                  isBusy: controller.isCategoryLoading.value,
                                ),
                                if (controller.upcomingAppts.isNotEmpty) ...[
                                  HomeTitle(
                                    title: "Upcoming Appointments",
                                    endWidget: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: controller
                                              .isUpcomingApptsLoading.isTrue
                                          ? SizedBox(
                                              width: 20,
                                              height: 20,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : GestureDetector(
                                              child: Icon(
                                                Icons.refresh_outlined,
                                                color: Colors.black26,
                                              ),
                                              onTap: () {
                                                controller.getUpcomingAppts();
                                              },
                                            ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: controller.upcomingAppts
                                            .map((element) => Row(
                                                  children: [
                                                    CardWidget(
                                                      item: element,
                                                    ),
                                                    AppSpacerW(10),
                                                  ],
                                                ))
                                            .toList()),
                                  ),
                                ],

                                ///telemed/apt/65f69b9256ab857765909746/?status=CANCELLED
                                // ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //     itemCount: controller.upcomingAppts.length,
                                //     itemBuilder: ((context, index) {
                                //       var item = controller.upcomingAppts[index];
                                //       return CardWidget(
                                //         item: item,
                                //       );
                                //     })),
                                if (controller.recentConsultations.isNotEmpty)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HomeTitle(
                                        title: "Recent Consultations",
                                        // subtitle: "See All",
                                      ),
                                      AppSpacerH(10),
                                      Container(
                                        width: double.infinity,
                                        height: getScreenWidth(context) * 0.53,
                                        child: controller
                                                .recentConsultations.isEmpty
                                            ? Column(
                                                children: [
                                                  Text(
                                                    "No Recent Consultations",
                                                    style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Book an appointment or instantly visit a doctor",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )
                                                ],
                                              )
                                            : ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  var item = controller
                                                          .recentConsultations[
                                                      index];
                                                  return Row(
                                                    children: [
                                                      if (index != 0)
                                                        AppSpacerW(10),
                                                      DoctorCard(
                                                          recentItem: item,
                                                          item: null),
                                                    ],
                                                  );
                                                },
                                                itemCount: controller
                                                    .recentConsultations.length,
                                              ),
                                      ),
                                      _buildRegionalPartners(),

                                      if (controller.ongoingSession.isNotEmpty)
                                        AppSpacerH(50),

                                      // Container(
                                      //   width: double.infinity,
                                      //   height: getScreenWidth(context) * 0.35,
                                      //   child: ListView.builder(
                                      //     scrollDirection: Axis.horizontal,
                                      //     itemCount:
                                      //         controller.sessions.value.length,
                                      //     itemBuilder: (context, index) {
                                      //       var item =
                                      //           controller.sessions.value[index];

                                      //       return InkWell(
                                      //         onTap: () {
                                      //           var user =
                                      //               AppPreferences.getUserData();
                                      //           var appttCtrl = Get.find<
                                      //               AppointmentController>();
                                      //           appttCtrl.session = item.toJson();

                                      //           Get.to(VideoCallingScreen());
                                      //         },
                                      //         child: Container(
                                      //           margin: EdgeInsets.only(top: 20),
                                      //           height: getScreenWidth(context) *
                                      //               0.35,
                                      //           width: getScreenWidth(context),
                                      //           decoration: BoxDecoration(
                                      //               color: Colors.white,
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       20)),
                                      //           child: Padding(
                                      //               padding:
                                      //                   const EdgeInsets.only(
                                      //                 top: 30,
                                      //               ),
                                      //               child: Column(
                                      //                 crossAxisAlignment:
                                      //                     CrossAxisAlignment
                                      //                         .start,
                                      //                 children: [
                                      //                   ListTile(
                                      //                     leading: Image.asset(
                                      //                       "assets/images/brufen.png",
                                      //                       height: 100,
                                      //                     ),
                                      //                     title: Text(
                                      //                         item.doctorName!),
                                      //                     subtitle: Row(
                                      //                       children: const [
                                      //                         Icon(Icons.alarm),
                                      //                         Text("10:15am"),
                                      //                         VerticalDivider(
                                      //                           thickness: 2,
                                      //                           color:
                                      //                               Colors.amber,
                                      //                         ),
                                      //                         Text(
                                      //                             "After Eating"),
                                      //                       ],
                                      //                     ),
                                      //                   )
                                      //                 ],
                                      //               )),
                                      //         ),
                                      //       );
                                      //     },
                                      //   ),
                                      // )
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (controller.ongoingSession.isNotEmpty)
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 7.0, bottom: 7, left: 15),
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: COLOR_ACCENT_LIGHT,
                          // borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(20),
                          //     topRight: Radius.circular(20))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: COLOR_ACCENT,
                                    size: 18,
                                  ),
                                  // LiveStreamingIcon(),
                                  AppSpacerW(5),
                                  Flexible(
                                    child: Text(
                                      'Your session with ${controller.ongoingSession['doctorName']} is live',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: COLOR_ACCENT,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  AppSpacerW(5),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Singleton.instance.session =
                                        controller.ongoingSession;
                                    Get.to(() => VideoCallingScreen());
                                  },
                                  child: Text(
                                    "JOIN",
                                    style: TextStyle(
                                        color: COLOR_ACCENT,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.ongoingSession.value = {};
                                      AppPreferences.removeData(
                                          AppPreferences.session);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: COLOR_ACCENT,
                                    ))
                              ],
                            ),
                          ],
                        )),
                    // Positioned(
                    //     right: 0,
                    //     top: -10,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         Get.snackbar("Hello", "World");
                    //       },
                    //       child: CircleAvatar(
                    //         radius: 14,
                    //         backgroundColor: COLOR_ACCENT,
                    //         child: Icon(
                    //           Icons.close,
                    //           size: 14,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ))
                  ],
                ))
        ],
      ),
    );
  }
}
