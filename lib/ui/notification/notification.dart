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

import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/widgets/body_with_header.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    print('Notification called');
  }

  int selectedTabIndex = 0;

  final List<NotificationItem> allNotifications = List.generate(
    5,
    (index) => NotificationItem(
      title: 'John Doe investigation completed.',
      subtitle: 'Report sent ',
      timeAgo: '2 h ago',
      isRead: index % 2 == 0,
    ),
  );

  final List<NotificationItem> archivedNotifications = List.generate(
    3,
    (index) => NotificationItem(
      title: 'Archived notification #$index.',
      subtitle: 'This is an archived message.',
      timeAgo: '1 day ago',
      isRead: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: false,
      isMenuVisible: true,
      title: 'Recent ',
      subtitle: 'Notifications',
      istitle: true,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton('All', 0),
                SizedBox(
                  width: 20,
                ),
                _buildTabButton('Unread', 1),
                SizedBox(
                  width: 20,
                ),
                _buildTabButton('Archive', 2),
              ],
            ),
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = selectedTabIndex == index;
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTabIndex = index;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.black : Colors.grey[300],
            foregroundColor: isSelected ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(label),
        ),
        if (index == 0)
          Positioned(
            top: 13,
            right: 3,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTabContent() {
    List<NotificationItem> notifications;
    if (selectedTabIndex == 0) {
      notifications = allNotifications;
    } else if (selectedTabIndex == 1) {
      notifications = allNotifications.where((n) => !n.isRead).toList();
    } else {
      notifications = archivedNotifications;
    }

    return _buildNotificationList(notifications);
  }

  Widget _buildNotificationList(List<NotificationItem> notifications) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _NotificationCard(notification: notification);
      },
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String timeAgo;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    this.isRead = false,
  });
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const _NotificationCard({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : Colors.black12,
        borderRadius: BorderRadius.circular(3),
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon container
          Stack(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    // color: notification.isRead ? Colors.black : Colo,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Image.asset("assets/images/mail.png")),
              if (!notification.isRead)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          // Notification details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: notification.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black38),
                      ),
                      const TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: notification.subtitle,
                        style: const TextStyle(
                          color: COLOR_PRIMARY,
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: 'to your emai',
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Time indicator
          Text(
            notification.timeAgo,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
