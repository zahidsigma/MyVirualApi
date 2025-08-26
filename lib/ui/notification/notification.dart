// import 'package:flutter/material.dart';
// import 'package:virualapi/widgets/body_with_header.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   @override
//   void initState() {
//     super.initState();

//     print('Notification called');
//   }

//   final List<NotificationItem> notifications = List.generate(
//     5,
//     (index) => NotificationItem(
//       title: 'John Doe investigation completed.',
//       subtitle: 'Report sent to your email.',
//       timeAgo: '2 h ago',
//     ),
//   );

//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//       isBackVisible: false,
//       isMenuVisible: true,
//       title: 'Recent ',
//       subtitle: 'Notifications',
//       body: ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           final notification = notifications[index];
//           return _NotificationCard(notification: notification);
//         },
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // class NotificationScreen extends StatelessWidget {

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Notifications'),
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         centerTitle: false,
// //       ),
// //       body: Container(
// //         color: Colors.white,
// //         child:
// //       ),
// //     );
// //   }
// // }

// class NotificationItem {
//   final String title;
//   final String subtitle;
//   final String timeAgo;

//   NotificationItem({
//     required this.title,
//     required this.subtitle,
//     required this.timeAgo,
//   });
// }

// class _NotificationCard extends StatelessWidget {
//   final NotificationItem notification;

//   const _NotificationCard({Key? key, required this.notification})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//       decoration: const BoxDecoration(
//         border: Border(
//           bottom: BorderSide(color: Colors.grey, width: 0.5),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Icon container
//           Container(
//             width: 40,
//             height: 40,
//             decoration: const BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.all(Radius.circular(8)),
//             ),
//             child: const Icon(
//               Icons.mail_outline,
//               color: Colors.white,
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Notification details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: notification.title,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const TextSpan(
//                         text: '\n',
//                       ),
//                       TextSpan(
//                         text: notification.subtitle,
//                         style: const TextStyle(
//                           color: Colors.blue,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Time indicator
//           Text(
//             notification.timeAgo,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/widgets/body_with_header.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   @override
//   void initState() {
//     super.initState();
//     print('Notification called');
//   }

//   int selectedTabIndex = 0;

//   final List<NotificationItem> allNotifications = List.generate(
//     5,
//     (index) => NotificationItem(
//       title: 'John Doe investigation completed.',
//       subtitle: 'Report sent ',
//       timeAgo: '2 h ago',
//       isRead: index % 2 == 0,
//     ),
//   );

//   final List<NotificationItem> archivedNotifications = List.generate(
//     3,
//     (index) => NotificationItem(
//       title: 'Archived notification #$index.',
//       subtitle: 'This is an archived message.',
//       timeAgo: '1 day ago',
//       isRead: true,
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//       isBackVisible: false,
//       isMenuVisible: true,
//       title: 'Recent ',
//       subtitle: 'Notifications',
//       istitle: true,
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//             child: Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildTabButton('All', 0),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 _buildTabButton('Unread', 1),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 _buildTabButton('Archive', 2),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _buildTabContent(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabButton(String label, int index) {
//     final isSelected = selectedTabIndex == index;
//     return Stack(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               selectedTabIndex = index;
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: isSelected ? COLOR_PRIMARY : Colors.grey[300],
//             foregroundColor: isSelected ? Colors.white : Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Text(label),
//         ),
//         if (index == 0)
//           Positioned(
//             top: 13,
//             right: 3,
//             child: Container(
//               width: 20,
//               height: 20,
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildTabContent() {
//     List<NotificationItem> notifications;
//     if (selectedTabIndex == 0) {
//       notifications = allNotifications;
//     } else if (selectedTabIndex == 1) {
//       notifications = allNotifications.where((n) => !n.isRead).toList();
//     } else {
//       notifications = archivedNotifications;
//     }

//     return _buildNotificationList(notifications);
//   }

//   Widget _buildNotificationList(List<NotificationItem> notifications) {
//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         final notification = notifications[index];
//         return _NotificationCard(notification: notification);
//       },
//     );
//   }
// }

// class NotificationItem {
//   final String title;
//   final String subtitle;
//   final String timeAgo;
//   final bool isRead;

//   NotificationItem({
//     required this.title,
//     required this.subtitle,
//     required this.timeAgo,
//     this.isRead = false,
//   });
// }

// class _NotificationCard extends StatelessWidget {
//   final NotificationItem notification;

//   const _NotificationCard({Key? key, required this.notification})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
//       decoration: BoxDecoration(
//         color: notification.isRead ? Colors.white : Colors.black12,
//         borderRadius: BorderRadius.circular(3),
//         border: Border(
//           bottom: BorderSide(color: Colors.grey, width: 0.5),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Icon container
//           Stack(
//             children: [
//               Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: COLOR_PRIMARY,
//                     // color: notification.isRead ? Colors.black : Colo,
//                     borderRadius: const BorderRadius.all(Radius.circular(8)),
//                   ),
//                   child: Image.asset("assets/images/mail.png")),
//               if (!notification.isRead)
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     decoration: const BoxDecoration(
//                       color: Colors.green,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(width: 12),
//           // Notification details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: notification.title,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w500, color: Colors.black87),
//                       ),
//                       const TextSpan(
//                         text: '\n',
//                       ),
//                       TextSpan(
//                         text: notification.subtitle,
//                         style: const TextStyle(
//                           color: COLOR_PRIMARY,
//                           fontSize: 13,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'to your emai',
//                         style: const TextStyle(
//                           color: Colors.black87,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           // Time indicator
//           Text(
//             notification.timeAgo,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/widgets/body_with_header.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   int selectedTabIndex = 0;

//   final List<NotificationItem> allNotifications = List.generate(
//     5,
//     (index) => NotificationItem(
//       title: 'John Doe investigation completed.',
//       subtitle: 'Report sent ',
//       timeAgo: '2 h ago',
//       isRead: index % 2 == 0,
//     ),
//   );

//   final List<NotificationItem> archivedNotifications = List.generate(
//     3,
//     (index) => NotificationItem(
//       title: 'Archived notification #$index.',
//       subtitle: 'This is an archived message.',
//       timeAgo: '1 day ago',
//       isRead: true,
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//       isBackVisible: false,
//       isMenuVisible: true,
//       title: 'Recent ',
//       subtitle: 'Notifications',
//       istitle: true,
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//             child: Row(
//               children: [
//                 _buildTabButton('All', 0),
//                 const SizedBox(width: 20),
//                 _buildTabButton('Unread', 1),
//                 const SizedBox(width: 20),
//                 _buildTabButton('Archive', 2),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _buildTabContent(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabButton(String label, int index) {
//     final isSelected = selectedTabIndex == index;
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           selectedTabIndex = index;
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? COLOR_PRIMARY : Colors.grey[300],
//         foregroundColor: isSelected ? Colors.white : Colors.black,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       child: Text(label),
//     );
//   }

//   Widget _buildTabContent() {
//     List<NotificationItem> notifications;
//     if (selectedTabIndex == 0) {
//       notifications = allNotifications;
//     } else if (selectedTabIndex == 1) {
//       notifications = allNotifications.where((n) => !n.isRead).toList();
//     } else {
//       notifications = archivedNotifications;
//     }

//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         final notification = notifications[index];
//         return Dismissible(
//           key: ValueKey(notification.title + index.toString()),
//           background: Container(
//             color: Colors.green,
//             alignment: Alignment.centerLeft,
//             padding: const EdgeInsets.only(left: 20),
//             child: const Icon(Icons.archive, color: Colors.white),
//           ),
//           secondaryBackground: Container(
//             color: Colors.red,
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.only(right: 20),
//             child: const Icon(Icons.delete, color: Colors.white),
//           ),
//           onDismissed: (direction) {
//             setState(() {
//               if (selectedTabIndex == 2) {
//                 // Archive tab → remove from archive list
//                 archivedNotifications.remove(notification);
//               } else {
//                 if (direction == DismissDirection.startToEnd) {
//                   // Archive
//                   if (!archivedNotifications.contains(notification)) {
//                     archivedNotifications.add(notification);
//                   }
//                   // Mark as read so it disappears from Unread tab
//                   final indexInAll = allNotifications.indexOf(notification);
//                   if (indexInAll != -1) {
//                     allNotifications[indexInAll] =
//                         notification.copyWith(isRead: true);
//                   }
//                 } else {
//                   // Delete completely
//                   allNotifications.remove(notification);
//                   archivedNotifications.remove(notification);
//                 }
//               }
//             });
//           },
//           child: _NotificationCard(notification: notification),
//         );
//       },
//     );
//   }
// }

// class NotificationItem {
//   final String title;
//   final String subtitle;
//   final String timeAgo;
//   final bool isRead;

//   NotificationItem({
//     required this.title,
//     required this.subtitle,
//     required this.timeAgo,
//     this.isRead = false,
//   });
// }

// class _NotificationCard extends StatelessWidget {
//   final NotificationItem notification;

//   const _NotificationCard({Key? key, required this.notification})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
//       decoration: BoxDecoration(
//         color: notification.isRead ? Colors.white : Colors.black12,
//         borderRadius: BorderRadius.circular(3),
//         border: const Border(
//           bottom: BorderSide(color: Colors.grey, width: 0.5),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: const BoxDecoration(
//                   color: COLOR_PRIMARY,
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: Image.asset("assets/images/mail.png"),
//               ),
//               if (!notification.isRead)
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     decoration: const BoxDecoration(
//                       color: Colors.green,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: notification.title,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const TextSpan(text: '\n'),
//                       TextSpan(
//                         text: notification.subtitle,
//                         style: const TextStyle(
//                           color: COLOR_PRIMARY,
//                           fontSize: 13,
//                         ),
//                       ),
//                       const TextSpan(
//                         text: ' to your email',
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             notification.timeAgo,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/constants/enums.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import 'package:virualapi/utils/api_url_utils.dart';
// import 'package:virualapi/utils/snackbar_util.dart';
// import 'package:virualapi/widgets/body_with_header.dart';
// import 'package:virualapi/widgets/circular_loader.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   int selectedTabIndex = 0;
//   final Dio dio = Dio();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       getNotification();
//     });
//   }

//   Future<void> getNotification([Map<String, dynamic>? requestData]) async {
//     final token = await AppPreferences.getAuthToken();
//     final headers = {'Authorization': 'Bearer $token'};

//     try {
//       // Show loader
//       CircluarLoader();

//       var res = await dio.get(
//         ApiUrlUtils.getApiUrl(UrlEndPointEnum.notification),
//         queryParameters: requestData,
//         options: Options(headers: headers), // ✅ for GET requests
//       );

//       // Close loader
//       if (Get.isDialogOpen ?? false) Get.back();

//       print("📩 Notification API Response: ${res.data}");

//       if (res.statusCode == 200 && res.data['status'] == true) {
//         SnackbarUtil.info(
//           message: res.data["message"] ?? "Notificaion no found",
//           isInfo: false,
//         );
//       } else {
//         SnackbarUtil.info(
//           message: res.data["message"] ?? "Notificaion no found",
//           isInfo: false,
//         );
//       }
//     } catch (e) {
//       if (Get.isDialogOpen ?? false) Get.back();

//       print("❌ Notification API Error: $e");
//       Get.snackbar(
//         'Error',
//         'Something went wrong while fetching notifications.',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   final List<NotificationItem> allNotifications = List.generate(
//     5,
//     (index) => NotificationItem(
//       title: 'John Doe investigation completed.',
//       subtitle: 'Report sent ',
//       timeAgo: '2 h ago',
//       isRead: index % 2 == 0,
//     ),
//   );

//   final List<NotificationItem> archivedNotifications = List.generate(
//     3,
//     (index) => NotificationItem(
//       title: 'Archived notification #$index.',
//       subtitle: 'This is an archived message.',
//       timeAgo: '1 day ago',
//       isRead: true,
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//       isBackVisible: false,
//       isMenuVisible: true,
//       title: 'Recent ',
//       subtitle: 'Notifications',
//       istitle: true,
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//             child: Row(
//               children: [
//                 _buildTabButton('All', 0),
//                 const SizedBox(width: 20),
//                 _buildTabButton('Unread', 1),
//                 const SizedBox(width: 20),
//                 _buildTabButton('Archive', 2),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _buildTabContent(),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget _buildTabButton(String label, int index) {
//   //   final isSelected = selectedTabIndex == index;
//   //   return ElevatedButton(
//   //     onPressed: () {
//   //       setState(() {
//   //         selectedTabIndex = index;
//   //       });
//   //     },
//   //     style: ElevatedButton.styleFrom(
//   //       backgroundColor: isSelected ? COLOR_PRIMARY : Colors.grey[300],
//   //       foregroundColor: isSelected ? Colors.white : Colors.black,
//   //       shape: RoundedRectangleBorder(
//   //         borderRadius: BorderRadius.circular(20),
//   //       ),
//   //     ),
//   //     child: Text(label),
//   //             if(index == 0)
//   //         Positioned(
//   //           top: 13,
//   //           right: 3,
//   //           child: Container(
//   //             width: 20,
//   //             height: 20,
//   //             decoration: const BoxDecoration(
//   //               color: Colors.green,
//   //               shape: BoxShape.circle,
//   //             ),
//   //           ),
//   //         ),

//   //   );

//   // }

//   Widget _buildTabButton(String label, int index) {
//     final isSelected = selectedTabIndex == index;
//     return Stack(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               selectedTabIndex = index;
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: isSelected ? COLOR_PRIMARY : Colors.grey[300],
//             foregroundColor: isSelected ? Colors.white : Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Text(label),
//         ),
//         if (index == 0)
//           Positioned(
//             top: 10,
//             right: 3,
//             child: Container(
//               width: 20,
//               height: 20,
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildTabContent() {
//     List<NotificationItem> notifications;
//     if (selectedTabIndex == 0) {
//       notifications = allNotifications;
//     } else if (selectedTabIndex == 1) {
//       notifications = allNotifications.where((n) => !n.isRead).toList();
//     } else {
//       notifications = archivedNotifications;
//     }

//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         final notification = notifications[index];
//         return Slidable(
//           key: ValueKey(notification.title + index.toString()),
//           startActionPane: ActionPane(
//             motion: const DrawerMotion(),
//             children: [
//               SlidableAction(
//                 onPressed: (_) {
//                   setState(() {
//                     if (selectedTabIndex == 2) {
//                       return; // Already archived
//                     }
//                     if (!archivedNotifications.contains(notification)) {
//                       archivedNotifications.add(notification);
//                     }
//                     final idx = allNotifications.indexOf(notification);
//                     if (idx != -1) {
//                       allNotifications[idx] =
//                           notification.copyWith(isRead: true);
//                     }
//                   });
//                 },
//                 backgroundColor: Colors.green,
//                 foregroundColor: Colors.white,
//                 icon: Icons.archive,
//                 label: 'Archive',
//               ),
//             ],
//           ),
//           endActionPane: ActionPane(
//             motion: const DrawerMotion(),
//             children: [
//               SlidableAction(
//                 onPressed: (_) {
//                   setState(() {
//                     if (selectedTabIndex == 0 || selectedTabIndex == 1) {
//                       allNotifications.remove(notification);
//                       archivedNotifications.remove(notification);
//                     } else {
//                       archivedNotifications.remove(notification);
//                     }
//                   });
//                 },
//                 backgroundColor: Colors.red,
//                 foregroundColor: Colors.white,
//                 icon: Icons.delete,
//                 label: 'Delete',
//               ),
//             ],
//           ),
//           child: _NotificationCard(notification: notification),
//         );
//       },
//     );
//   }
// }

// class NotificationItem {
//   final String title;
//   final String subtitle;
//   final String timeAgo;
//   final bool isRead;

//   NotificationItem({
//     required this.title,
//     required this.subtitle,
//     required this.timeAgo,
//     this.isRead = false,
//   });

//   NotificationItem copyWith({
//     String? title,
//     String? subtitle,
//     String? timeAgo,
//     bool? isRead,
//   }) {
//     return NotificationItem(
//       title: title ?? this.title,
//       subtitle: subtitle ?? this.subtitle,
//       timeAgo: timeAgo ?? this.timeAgo,
//       isRead: isRead ?? this.isRead,
//     );
//   }
// }

// class _NotificationCard extends StatelessWidget {
//   final NotificationItem notification;

//   const _NotificationCard({Key? key, required this.notification})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
//       decoration: BoxDecoration(
//         color: notification.isRead ? Colors.white : Colors.black12,
//         borderRadius: BorderRadius.circular(3),
//         border: const Border(
//           bottom: BorderSide(color: Colors.grey, width: 0.5),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: const BoxDecoration(
//                   color: COLOR_PRIMARY,
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: Image.asset("assets/images/mail.png"),
//               ),
//               if (!notification.isRead)
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     decoration: const BoxDecoration(
//                       color: Colors.green,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: notification.title,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const TextSpan(text: '\n'),
//                       TextSpan(
//                         text: notification.subtitle,
//                         style: const TextStyle(
//                           color: COLOR_PRIMARY,
//                           fontSize: 13,
//                         ),
//                       ),
//                       const TextSpan(
//                         text: ' to your email',
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             notification.timeAgo,
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/constants/enums.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import 'package:virualapi/utils/api_url_utils.dart';
// import 'package:virualapi/utils/snackbar_util.dart';
// import 'package:virualapi/widgets/body_with_header.dart';
// import 'package:virualapi/widgets/circular_loader.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   int selectedTabIndex = 0;
//   final Dio dio = Dio();

//   @override
//   initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         getNotification();
//       }
//     });
//   }

//   List<NotificationItem> allNotifications = [];
//   List<NotificationItem> archivedNotifications = [];

//   String _formatTimeAgo(String? dateStr) {
//     if (dateStr == null) return '';
//     DateTime date = DateTime.tryParse(dateStr) ?? DateTime.now();
//     Duration diff = DateTime.now().difference(date);

//     if (diff.inDays > 0) return "${diff.inDays}d ago";
//     if (diff.inHours > 0) return "${diff.inHours}h ago";
//     if (diff.inMinutes > 0) return "${diff.inMinutes}m ago";
//     return "Just now";
//   }

//   void toggleReadStatus(int index, String id) async {
//     final current = allNotifications[index];

//     if (current.readAt == null) {
//       try {
//         // Show loader
//         Get.dialog(
//           const Center(child: CircularProgressIndicator()),
//           barrierDismissible: false,
//         );

//         final token = await AppPreferences.getAuthToken();
//         final response = await dio.post(
//           "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.markasRead)}/$id",
//           options: Options(headers: {'Authorization': 'Bearer $token'}),
//         );

//         print(id);

//         // Hide loader
//         if (Get.isDialogOpen ?? false) Get.back();

//         print(response);
//         if (response.data['status'] == true) {
//           SnackbarUtil.info(
//             message: response.data["message"] ?? "Unread",
//             isInfo: false,
//           );
//           setState(() {
//             allNotifications[index] = allNotifications[index].copyWith(
//               readAt: DateTime.now(), // mark as read
//               updatedAt: DateTime.now(), // optional: update timestamp
//             );
//           });
//         } else {
//           SnackbarUtil.error(
//             message: response.data["message"] ?? "Unread",
//           );
//           print("❌ Server says: ${response.data['message']}");
//         }
//       } catch (e) {
//         if (Get.isDialogOpen ?? false) Get.back();
//         print("❌ Failed to mark notification as read: $e");
//       }
//     }
//   }

//   @override
//   Future<void> getNotification([Map<String, dynamic>? requestData]) async {
//     final token = await AppPreferences.getAuthToken();
//     final headers = {'Authorization': 'Bearer $token'};

//     try {
//       CircluarLoader();

//       var res = await dio.get(
//         ApiUrlUtils.getApiUrl(UrlEndPointEnum.notification),
//         queryParameters: requestData,
//         options: Options(headers: headers),
//       );

//       if (Get.isDialogOpen ?? false) Get.back();

//       print("📩 Notification API Response: ${res.data}");

//       if (!mounted) return; // ✅ Prevent setState after dispose

//       if (res.statusCode == 200 && res.data['status'] == true) {
//         List<dynamic> data = res.data['data'];

//         setState(() {
//           allNotifications = data.map((item) {
//             final notifData = item['data'] ?? {};
//             return NotificationItem(
//               id: item['id'] ?? '',
//               type: notifData['type'] ?? '',
//               data: NotificationData(
//                 title: notifData['title'] ?? '',
//                 body: notifData['body'] ?? '',
//                 orderId: notifData['order_id'] ?? 0,
//               ),
//               readAt: item['read_at'] != null
//                   ? DateTime.parse(item['read_at'])
//                   : null,
//               createdAt: DateTime.parse(item['created_at']),
//               updatedAt: DateTime.parse(item['updated_at']),
//             );
//           }).toList();
//         });
//       } else {
//         SnackbarUtil.info(
//           message: res.data["message"] ?? "Notification not found",
//           isInfo: false,
//         );
//       }
//     } catch (e) {
//       if (Get.isDialogOpen ?? false) Get.back();

//       if (!mounted) return; // ✅ Prevent snackbar on disposed widget
//       print("❌ Notification API Error: $e");
//       Get.snackbar(
//         'Error',
//         'Something went wrong while fetching notifications.',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   Future<Map<String, dynamic>> _loadReport(String id) async {
//     final token = await AppPreferences.getAuthToken();
//     final response = await dio.get(
//       "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.orderView)}/$id",
//       options: Options(headers: {'Authorization': 'Bearer $token'}),
//     );

//     print("API Response: ${response.data}");

//     if (response.statusCode == 200 && response.data['status'] == true) {
//       final orderData = response.data['data'] as Map<String, dynamic>?;
//       if (orderData != null) {
//         return orderData;
//       } else {
//         throw Exception("No order data found.");
//       }
//     } else {
//       throw Exception(response.data['message'] ?? "Failed to load report.");
//     }
//   }

// // Make sure this expects a String
//   void _showReportDialog(String orderId) {
//     print("Orerid:::::::::::::$orderId");
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           content: FutureBuilder(
//             future: _loadReport(orderId), // pass directly, no indexing
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const SizedBox(
//                   height: 100,
//                   child: Center(child: CircularProgressIndicator()),
//                 );
//               } else if (snapshot.hasError) {
//                 return SizedBox(
//                   height: 100,
//                   child: Center(
//                     child: Text("❌ Error: ${snapshot.error}"),
//                   ),
//                 );
//               } else {
//                 final data = snapshot.data as Map<String, dynamic>;
//                 final reports = (data['reports'] as List)
//                     .map((r) => r['label'].toString())
//                     .join(", ");
//                 final pdfLinks = (data['report_links'] as List)
//                     .map((l) => l.toString())
//                     .toList();

//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Order #${data['id']}",
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 16)),
//                       const SizedBox(height: 8),
//                       Text(
//                           "Customer: ${data['first_name']} ${data['last_name']}"),
//                       Text("Email: ${data['email']}"),
//                       const SizedBox(height: 8),
//                       Text("Reports: $reports"),
//                       Text("Total: \$${data['total']}"),
//                       const SizedBox(height: 8),
//                       ...pdfLinks.map((link) => TextButton.icon(
//                             icon: const Icon(Icons.picture_as_pdf,
//                                 color: Colors.red),
//                             label: const Text("View PDF"),
//                             onPressed: () {
//                               final url = "${ApiUrlUtils.baseUrl}/$link";
//                               launchUrl(Uri.parse(url),
//                                   mode: LaunchMode.externalApplication);
//                             },
//                           )),
//                     ],
//                   ),
//                 );
//               }
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     int unreadCount = allNotifications.where((n) => n.readAt == null).length;

//     return BodyWithHeader(
//       isBackVisible: false,
//       isMenuVisible: true,
//       title: 'Recent ',
//       subtitle: 'Notifications',
//       istitle: true,
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//             child: Row(
//               children: [
//                 _buildTabButton('All', 0, unreadCount),
//                 const SizedBox(width: 20),
//                 _buildTabButton('Unread', 1, unreadCount),
//                 const SizedBox(width: 20),
//                 _buildTabButton('Archive', 2, unreadCount),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _buildTabContent(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabButton(String label, int index, int unreadCount) {
//     final isSelected = selectedTabIndex == index;
//     return Stack(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               selectedTabIndex = index;
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: isSelected ? COLOR_PRIMARY : Colors.grey[300],
//             foregroundColor: isSelected ? Colors.white : Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Text(label),
//         ),
//         if (index == 0 && unreadCount > 0)
//           Positioned(
//             top: 6,
//             right: 6,
//             child: Container(
//               width: 20,
//               height: 20,
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Text(
//                   unreadCount.toString(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildTabContent() {
//     List<NotificationItem> displayList;

//     if (selectedTabIndex == 0) {
//       // All notifications
//       displayList = allNotifications;
//     } else if (selectedTabIndex == 1) {
//       // Unread notifications
//       displayList = allNotifications.where((n) => n.readAt == null).toList();
//     } else {
//       // Archived notifications
//       displayList = archivedNotifications;
//     }

//     // Pick the right empty message
//     String emptyMessage;
//     if (selectedTabIndex == 0) {
//       emptyMessage = "No notifications found";
//     } else if (selectedTabIndex == 1) {
//       emptyMessage = "No unread notifications";
//     } else {
//       emptyMessage = "No archived notifications";
//     }

//     return displayList.isEmpty
//         ? Center(
//             child: Text(
//               emptyMessage,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           )
//         : ListView.builder(
//             itemCount: displayList.length,
//             itemBuilder: (context, index) {
//               final notification = displayList[index];

//               return Slidable(
//                   key: ValueKey(notification.data.title + index.toString()),
//                   startActionPane: ActionPane(
//                     motion: const DrawerMotion(),
//                     children: [
//                       SlidableAction(
//                         onPressed: (_) {
//                           if (!mounted) return;
//                           setState(() {
//                             if (selectedTabIndex == 2) return;
//                             if (!archivedNotifications.contains(notification)) {
//                               archivedNotifications.add(notification);
//                             }
//                             final idx = allNotifications.indexOf(notification);
//                             if (idx != -1) {
//                               allNotifications[idx] =
//                                   allNotifications[idx].copyWith(
//                                 readAt: DateTime.now(), // mark as read
//                                 updatedAt: DateTime
//                                     .now(), // optional: update timestamp
//                               );
//                             }
//                           });
//                         },
//                         backgroundColor: Colors.green,
//                         foregroundColor: Colors.white,
//                         icon: Icons.archive,
//                         label: 'Archive',
//                       ),
//                     ],
//                   ),
//                   endActionPane: ActionPane(
//                     motion: const DrawerMotion(),
//                     children: [
//                       SlidableAction(
//                         onPressed: (_) {
//                           if (!mounted) return;
//                           setState(() {
//                             if (selectedTabIndex == 0 ||
//                                 selectedTabIndex == 1) {
//                               allNotifications.remove(notification);
//                               archivedNotifications.remove(notification);
//                             } else {
//                               archivedNotifications.remove(notification);
//                             }
//                           });
//                         },
//                         backgroundColor: Colors.red,
//                         foregroundColor: Colors.white,
//                         icon: Icons.delete,
//                         label: 'Delete',
//                       ),
//                     ],
//                   ),
//                   child: _NotificationCard(
//                       notification: allNotifications[index],
//                       onTap: () =>
//                           toggleReadStatus(index, allNotifications[index].id),
//                       onViewReport: () {
//                         var id = allNotifications[index].data.orderId;
//                         print("Notification OrderPlaced: $id");
//                         _showReportDialog(id.toString());
//                       }));
//             },
//           );
//   }
// }

// class NotificationData {
//   final String title;
//   final String body;
//   final int orderId;

//   NotificationData({
//     required this.title,
//     required this.body,
//     required this.orderId,
//   });

//   factory NotificationData.fromJson(Map<String, dynamic> json) {
//     return NotificationData(
//       title: json['title'],
//       body: json['body'],
//       orderId: json['order_id'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'body': body,
//       'order_id': orderId,
//     };
//   }

//   NotificationData copyWith({
//     String? title,
//     String? body,
//     int? orderId,
//   }) {
//     return NotificationData(
//       title: title ?? this.title,
//       body: body ?? this.body,
//       orderId: orderId ?? this.orderId,
//     );
//   }
// }

// class NotificationItem {
//   final String id;
//   final String type;

//   final NotificationData data;
//   final DateTime? readAt;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   NotificationItem({
//     required this.id,
//     required this.type,
//     required this.data,
//     this.readAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory NotificationItem.fromJson(Map<String, dynamic> json) {
//     return NotificationItem(
//       id: json['id'],
//       type: json['type'],
//       data: NotificationData.fromJson(json['data']),
//       readAt: json['read_at'] != null ? DateTime.parse(json['read_at']) : null,
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'type': type,
//       'data': data.toJson(),
//       'read_at': readAt?.toIso8601String(),
//       'created_at': createdAt.toIso8601String(),
//       'updated_at': updatedAt.toIso8601String(),
//     };
//   }

//   NotificationItem copyWith({
//     String? id,
//     String? type,
//     String? notifiableType,
//     int? notifiableId,
//     NotificationData? data,
//     DateTime? readAt,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return NotificationItem(
//       id: id ?? this.id,
//       type: type ?? this.type,
//       data: data ?? this.data,
//       readAt: readAt ?? this.readAt,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }
// }

// class _NotificationCard extends StatelessWidget {
//   final NotificationItem notification;
//   final VoidCallback onTap;
//   final VoidCallback onViewReport; // new callback

//   const _NotificationCard({
//     Key? key,
//     required this.notification,
//     required this.onTap,
//     required this.onViewReport, // pass from parent
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
//         decoration: BoxDecoration(
//           color: notification.readAt == null ? Colors.white : Colors.black12,
//           borderRadius: BorderRadius.circular(3),
//           border: const Border(
//             bottom: BorderSide(color: Colors.grey, width: 0.5),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: const BoxDecoration(
//                         color: COLOR_PRIMARY,
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                       ),
//                       child: Image.asset("assets/images/mail.png"),
//                     ),
//                     if (notification.readAt == null) // unread
//                       Positioned(
//                         top: 0,
//                         left: 0,
//                         child: Container(
//                           width: 10,
//                           height: 10,
//                           decoration: const BoxDecoration(
//                             color: Colors.green,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: notification.data.title,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                             const TextSpan(text: '\n'),
//                             TextSpan(
//                               text: notification.data.body,
//                               style: const TextStyle(
//                                 color: COLOR_PRIMARY,
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   children: [
//                     Text(
//                       notification.createdAt.timeZoneName,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: onViewReport,
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                       ),
//                       child: const Text("View Report"),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/utils/api_url_utils.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/circular_loader.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedTabIndex = 0;
  final Dio dio = Dio();

  List<NotificationItem> allNotifications = [];
  List<NotificationItem> archivedNotifications = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) getNotification();
    });
  }

  String _formatTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return "${diff.inDays}d ago";
    if (diff.inHours > 0) return "${diff.inHours}h ago";
    if (diff.inMinutes > 0) return "${diff.inMinutes}m ago";
    return "Just now";
  }

  void toggleReadStatus(int index) async {
    final current = allNotifications[index];

    if (!current.isRead) {
      try {
        Get.dialog(
            const Center(
                child: CircularProgressIndicator(
              color: DARK_BG_COLOR,
            )),
            barrierDismissible: false);

        final token = await AppPreferences.getAuthToken();
        final response = await dio.post(
          "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.markasRead)}/${current.id}",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        if (Get.isDialogOpen ?? false) Get.back();

        if (response.data['status'] == true) {
          SnackbarUtil.info(
            message: response.data['message'] ?? "Marked as read",
            isInfo: false,
          );
          setState(() {
            allNotifications[index] = current.copyWith(
              readAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );
          });
        } else {
          SnackbarUtil.error(
            message: response.data['message'] ?? "Failed to mark read",
          );
        }
      } catch (e) {
        if (Get.isDialogOpen ?? false) Get.back();
        print("Error marking notification read: $e");
      }
    }
  }

  Future<void> getNotification([Map<String, dynamic>? requestData]) async {
    final token = await AppPreferences.getAuthToken();
    final headers = {'Authorization': 'Bearer $token'};

    try {
      CircluarLoader();

      final res = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.notification),
        queryParameters: requestData,
        options: Options(headers: headers),
      );

      if (Get.isDialogOpen ?? false) Get.back();

      if (!mounted) return;

      if (res.statusCode == 200 && res.data['status'] == true) {
        final data = res.data['data'] as List<dynamic>;

        setState(() {
          allNotifications = data.map((item) {
            final notifData = item['data'] ?? {};
            return NotificationItem(
              id: item['id'] ?? '',
              type: notifData['type'] ?? '',
              data: NotificationData(
                title: notifData['title'] ?? '',
                body: notifData['body'] ?? '',
                orderId: notifData['order_id'] ?? 0,
              ),
              readAt: item['read_at'] != null
                  ? DateTime.parse(item['read_at'])
                  : null, // <-- must be null for unread
              createdAt: DateTime.parse(item['created_at']),
              updatedAt: DateTime.parse(item['updated_at']),
            );
          }).toList();
        });
      } else {
        SnackbarUtil.info(
          message: res.data["message"] ?? "Notification not found",
          isInfo: false,
        );
      }
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      if (!mounted) return;
      Get.snackbar(
        'Error',
        'Something went wrong while fetching notifications.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<Map<String, dynamic>> _loadReport(String id) async {
    final token = await AppPreferences.getAuthToken();
    final response = await dio.get(
      "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.orderView)}/$id",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response.statusCode == 200 && response.data['status'] == true) {
      return response.data['data'] as Map<String, dynamic>;
    } else {
      throw Exception(response.data['message'] ?? "Failed to load report.");
    }
  }

  // void _showReportDialog(String orderId) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return AlertDialog(
  //         // backgroundColor: COLOR_PRIMARY,
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //         content: FutureBuilder(
  //           future: _loadReport(orderId),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return const SizedBox(
  //                 height: 100,
  //                 child: Center(child: CircularProgressIndicator()),
  //               );
  //             } else if (snapshot.hasError) {
  //               return SizedBox(
  //                 height: 100,
  //                 child: Center(child: Text("Error: ${snapshot.error}")),
  //               );
  //             } else {
  //               final data = snapshot.data as Map<String, dynamic>;
  //               final reports = (data['reports'] as List)
  //                   .map((r) => r['label'].toString())
  //                   .join(", ");
  //               final pdfLinks = (data['report_links'] as List)
  //                   .map((l) => l.toString())
  //                   .toList();

  //               return SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text("Order #${data['id']}"),
  //                     //     style: const TextStyle(
  //                     //         fontWeight: FontWeight.bold, fontSize: 16)),
  //                     // const SizedBox(height: 8),
  //                     // Text(
  //                     //     "Customer: ${data['first_name']} ${data['last_name']}"),
  //                     // Text("Email: ${data['email']}"),
  //                     // const SizedBox(height: 8),
  //                     // Text("Reports: $reports"),
  //                     // Text("Total: \$${data['total']}"),
  //                     // const SizedBox(height: 8),
  //                     // ...pdfLinks.map((link) => TextButton.icon(
  //                     //       icon: const Icon(Icons.picture_as_pdf,
  //                     //           color: Colors.red),
  //                     //       label: const Text("View PDF"),
  //                     //       onPressed: () {
  //                     //         final url = "${ApiUrlUtils.baseUrl}/$link";
  //                     //         launchUrl(Uri.parse(url),
  //                     //             mode: LaunchMode.externalApplication);
  //                     //       },
  //                     //     )),

  //                     Row(
  //                       children: [
  //                         // Left info box
  //                         Expanded(
  //                           child: Container(
  //                             height: getScreenHeight(context) * 0.23,
  //                             padding: const EdgeInsets.all(12),
  //                             decoration: BoxDecoration(
  //                               color: Colors.grey.shade200,
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 ReusableWidget.loadSvg(
  //                                     "assets/icons/infosearch.svg",
  //                                     height: 60),
  //                                 SizedBox(height: 10),
  //                                 Text("Investigation Search",
  //                                     style: TextStyle(
  //                                         fontWeight: FontWeight.bold)),
  //                                 SizedBox(height: 6),
  //                                 Row(
  //                                   children: [
  //                                     Icon(
  //                                       Icons.calendar_month_rounded,
  //                                       size: 16,
  //                                       color: Colors.grey,
  //                                     ),
  //                                     SizedBox(width: 4),
  //                                     Text(
  //                                       data['created_at'].split('T').first,
  //                                       style: TextStyle(fontSize: 12),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 6),
  //                                 Row(
  //                                   children: [
  //                                     Icon(
  //                                       Icons.access_time,
  //                                       size: 16,
  //                                       color: Colors.grey,
  //                                     ),
  //                                     SizedBox(width: 4),
  //                                     Text(
  //                                       data['created_at']
  //                                           .split('T')
  //                                           .last
  //                                           .split('.')
  //                                           .first,
  //                                       style: TextStyle(fontSize: 12),
  //                                     ),
  //                                     // Text(
  //                                     //     // selected.createdAt.split('T').last.split('.').first,
  //                                     //     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         SizedBox(width: 10),
  //                         // Right status box
  //                         Expanded(
  //                           child: Container(
  //                             height: getScreenHeight(context) * 0.23,
  //                             padding: const EdgeInsets.all(12),
  //                             decoration: BoxDecoration(
  //                               gradient: const LinearGradient(
  //                                   colors: [
  //                                     Color(0xff0252C9),
  //                                     Color(0xff000000)
  //                                   ],
  //                                   begin: Alignment.topRight,
  //                                   end: Alignment.bottomRight),
  //                               borderRadius: BorderRadius.circular(12),
  //                             ),
  //                             child: Column(
  //                               children: [
  //                                 Icon(Icons.check_circle,
  //                                     color: Colors.green, size: 60),
  //                                 SizedBox(height: 10),
  //                                 Text(
  //                                   "Search request for ${data['first_name']} ${data['last_name']} has been completed.",
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               );
  //             }
  //           },
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: const Text("Close"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _showReportDialog(String orderId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: FutureBuilder(
            future: _loadReport(orderId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return SizedBox(
                  height: 100,
                  child: Center(child: Text("Error: ${snapshot.error}")),
                );
              } else {
                final data = snapshot.data as Map<String, dynamic>;
                final pdfLinks = (data['report_links'] as List)
                    .map((l) => l.toString())
                    .toList();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order #${data['id']}"),
                      SizedBox(
                        height: 10,
                      ),
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
                                  ReusableWidget.loadSvg(
                                      "assets/icons/infosearch.svg",
                                      height: 60),
                                  const SizedBox(height: 10),
                                  Text("Investigation Search",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month_rounded,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(data['created_at']
                                          .toString()
                                          .split('T')
                                          .first),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Right status box
                          Expanded(
                            child: Container(
                              height: getScreenHeight(context) * 0.23,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff0252C9),
                                    Color(0xff000000)
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.green, size: 60),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Search request for ${data['first_name']} ${data['last_name']} has been completed.",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // PDF links

                      const SizedBox(height: 10),
                      // Download button
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: COLOR_PRIMARY,
                      //     minimumSize: const Size.fromHeight(45),
                      //     shape: const StadiumBorder(),
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 40, vertical: 12),
                      //   ),
                      //   onPressed: () async {
                      //     final relativeUrl =
                      //         'storage/app/public/reports/workplace_records_1752163008.pdf';
                      //     final baseUrl =
                      //         'https://server.testlinkwebsitespace.com/virtual-pi-backend/';
                      //     final fullUrl = Uri.parse(baseUrl)
                      //         .resolve(relativeUrl)
                      //         .toString();

                      //     Directory? dir;

                      //     try {
                      //       if (Platform.isAndroid) {
                      //         // Downloads folder (no need for storage permission)
                      //         dir = (await getExternalStorageDirectories(
                      //                 type: StorageDirectory.downloads))
                      //             ?.first;
                      //       } else if (Platform.isIOS) {
                      //         dir = await getApplicationDocumentsDirectory();
                      //       } else {
                      //         dir = await getApplicationDocumentsDirectory();
                      //       }
                      //     } catch (e) {
                      //       SnackbarUtil.error(
                      //           message: "Cannot access storage directory");
                      //       return;
                      //     }

                      //     if (dir == null) {
                      //       SnackbarUtil.error(
                      //           message: "Cannot access storage directory");
                      //       return;
                      //     }

                      //     final fileName =
                      //         "report_${DateTime.now().millisecondsSinceEpoch}.pdf";
                      //     final savePath = "${dir.path}/$fileName";

                      //     try {
                      //       await Dio().download(fullUrl, savePath);
                      //       SnackbarUtil.info(
                      //           // message: "Report downloaded to ${dir.path}"
                      //           message: "Report has been downloaded");
                      //     } catch (e) {
                      //       SnackbarUtil.error(message: "Download failed");
                      //     }
                      //   },
                      //   child: const Text("Download Report"),
                      // )

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: COLOR_PRIMARY,
                          minimumSize: const Size.fromHeight(45),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                        onPressed: () async {
                          final relativeUrl =
                              'storage/app/public/reports/workplace_records_1752163008.pdf';
                          final baseUrl =
                              'https://server.testlinkwebsitespace.com/virtual-pi-backend/';
                          final fullUrl = Uri.parse(baseUrl)
                              .resolve(relativeUrl)
                              .toString();

                          Directory? dir;

                          try {
                            if (Platform.isAndroid) {
                              dir = (await getExternalStorageDirectories(
                                      type: StorageDirectory.downloads))
                                  ?.first;
                            } else if (Platform.isIOS) {
                              dir = await getApplicationDocumentsDirectory();
                            } else {
                              dir = await getApplicationDocumentsDirectory();
                            }
                          } catch (e) {
                            SnackbarUtil.error(
                                message: "Cannot access storage directory");
                            return;
                          }

                          if (dir == null) {
                            SnackbarUtil.error(
                                message: "Cannot access storage directory");
                            return;
                          }

                          final fileName =
                              "report_${DateTime.now().millisecondsSinceEpoch}.pdf";
                          final savePath = "${dir.path}/$fileName";

                          try {
                            // Show loader
                            Get.dialog(
                              const Center(
                                  child: CircularProgressIndicator(
                                color: DARK_BG_COLOR,
                              )),
                              barrierDismissible: false,
                            );

                            await Dio().download(fullUrl, savePath);

                            // Hide loader
                            if (Get.isDialogOpen ?? false) Get.back();

                            SnackbarUtil.info(
                                // message: "Report downloaded to ${dir.path}");
                                message: "Report has been downloaded");
                          } catch (e) {
                            if (Get.isDialogOpen ?? false) Get.back();
                            SnackbarUtil.error(message: "Download failed");
                          }
                        },
                        child: const Text("Download Report"),
                      )
                    ],
                  ),
                );
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int unreadCount = allNotifications.where((n) => n.readAt == null).length;

    return BodyWithHeader(
      isBackVisible: false,
      isMenuVisible: true,
      title: 'Recent',
      subtitle: 'Notifications',
      istitle: true,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                _buildTabButton('All', 0, unreadCount),
                const SizedBox(width: 20),
                _buildTabButton('Unread', 1, unreadCount),
                const SizedBox(width: 20),
                _buildTabButton('Archive', 2, unreadCount),
              ],
            ),
          ),
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index, int unreadCount) {
    final isSelected = selectedTabIndex == index;
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() => selectedTabIndex = index);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? COLOR_PRIMARY : Colors.grey[300],
            foregroundColor: isSelected ? Colors.white : Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(label),
        ),
        // if (index == 0 && unreadCount > 0)
        //   Positioned(
        //     top: 6,
        //     right: 6,
        //     child: Container(
        //       width: 20,
        //       height: 20,
        //       decoration: const BoxDecoration(
        //           color: Colors.green, shape: BoxShape.circle),
        //       child: Center(
        //         child: Text(unreadCount.toString(),
        //             style: const TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 12,
        //                 fontWeight: FontWeight.bold)),
        //       ),
        //     ),
        //   ),
        if (index == 0)
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.green, // always green
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  unreadCount.toString(), // always show number (0 if none)
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

        //   if (unreadCount > 0)
        // Positioned(
        //   top: 6,
        //   right: 6,
        //   child: Container(
        //     width: 20,
        //     height: 20,
        //     decoration: const BoxDecoration(
        //         color: Colors.green, shape: BoxShape.circle),
        //     child: Center(
        //       child: Text(
        //         unreadCount.toString(),
        //         style: const TextStyle(
        //           color: Colors.white,
        //           fontSize: 12,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildTabContent() {
    List<NotificationItem> displayList;

    if (selectedTabIndex == 0) {
      displayList = allNotifications;
    } else if (selectedTabIndex == 1) {
      displayList = allNotifications.where((n) => !n.isRead).toList();
    } else {
      displayList = archivedNotifications;
    }

    if (displayList.isEmpty) {
      final emptyMessage = selectedTabIndex == 0
          ? "No notifications found"
          : selectedTabIndex == 1
              ? "No unread notifications"
              : "No archived notifications";
      return Center(
          child: Text(emptyMessage,
              style: const TextStyle(fontSize: 16, color: Colors.grey)));
    }

    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        final notification = displayList[index];
        final originalIndex =
            allNotifications.indexWhere((n) => n.id == notification.id);

        return Slidable(
          key: ValueKey(notification.id),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  if (!archivedNotifications.contains(notification)) {
                    setState(() => archivedNotifications.add(notification));
                  }
                  if (originalIndex != -1) {
                    setState(() => allNotifications[originalIndex] =
                            allNotifications[originalIndex].copyWith(
                          readAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        ));
                  }
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: 'Archive',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  setState(() {
                    if (selectedTabIndex != 2)
                      allNotifications.remove(notification);
                    archivedNotifications.remove(notification);
                  });
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: _NotificationCard(
            notification: notification,
            onTap: () => toggleReadStatus(originalIndex),
            onViewReport: () =>
                _showReportDialog(notification.data.orderId.toString()),
          ),
        );
      },
    );
  }
}

class NotificationData {
  final String title;
  final String body;
  final int orderId;

  NotificationData(
      {required this.title, required this.body, required this.orderId});

  NotificationData copyWith({String? title, String? body, int? orderId}) {
    return NotificationData(
      title: title ?? this.title,
      body: body ?? this.body,
      orderId: orderId ?? this.orderId,
    );
  }

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      orderId: json['order_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'body': body, 'order_id': orderId};
}

class NotificationItem {
  final String id;
  final String type;
  final NotificationData data;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationItem({
    required this.id,
    required this.type,
    required this.data,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isRead => readAt != null;

  NotificationItem copyWith(
      {String? id,
      String? type,
      NotificationData? data,
      DateTime? readAt,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return NotificationItem(
      id: id ?? this.id,
      type: type ?? this.type,
      data: data ?? this.data,
      readAt: readAt ?? this.readAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;
  final VoidCallback onViewReport;

  const _NotificationCard(
      {Key? key,
      required this.notification,
      required this.onTap,
      required this.onViewReport})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          color: !notification.isRead ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.circular(3),
          border:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: COLOR_PRIMARY,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Image.asset("assets/images/mail.png"),
                ),
                if (!notification.isRead)
                  const Positioned(
                    top: 0,
                    left: 0,
                    child:
                        CircleAvatar(radius: 5, backgroundColor: Colors.green),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.data.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black87)),
                  const SizedBox(height: 2),
                  Text(notification.data.body,
                      style:
                          const TextStyle(color: COLOR_PRIMARY, fontSize: 13)),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  _formatTimeAgo(notification.createdAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                if (notification.isRead)
                  TextButton(
                    onPressed: onViewReport,
                    child: const Text(
                      "View Report",
                      style: TextStyle(color: COLOR_PRIMARY),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return "${diff.inDays}d ago";
    if (diff.inHours > 0) return "${diff.inHours}h ago";
    if (diff.inMinutes > 0) return "${diff.inMinutes}m ago";
    return "Just now";
  }
}
