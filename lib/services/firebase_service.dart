// import 'dart:convert';
// import 'dart:io';
// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/user_repo.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import 'package:virualapi/services/singleton.dart';
// // import 'package:virualapi/ui/appointment/appointment_controller.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// // import 'package:virualapi/ui/video_calling/video_calling.dart';
// import 'package:virualapi/utils/snackbar_util.dart';

// Future<void> _firebaseMessagingdHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }

// class FirebaseService {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   _getChannel() => AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         description:
//             'This channel is used for important notifications.', // description
//         importance: Importance.max,
//       );

//   init() async {
//     // Get Notification permission on startup
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     if (Platform.isAndroid) {
//       // Android related permission
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.createNotificationChannel(_getChannel());
//       flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.requestNotificationsPermission();
//     }

//     if (settings.authorizationStatus == AuthorizationStatus.authorized ||
//         settings.authorizationStatus == AuthorizationStatus.provisional) {
//       await messaging.setForegroundNotificationPresentationOptions(
//         alert: true, // Required to display a heads up notification
//         badge: true,
//         sound: true,
//       );
//       _initializeLocalNotification();
//       _getToken();
//       _startListeningMessages();
//       setupInteractedMessage();
//     }
//   }

//   _initializeLocalNotification() {
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }

//   _getToken() {
//     messaging.getToken().then((token) {
//       var repo = Get.find<UserRepository>();
//       if (token != null &&
//           AppPreferences.getUserData() != null &&
//           AppPreferences.getLoginData() != null) {
//         repo.registerDeviceFCM(
//             deviceType: Platform.isAndroid ? 'android' : 'iOS', token: token);
//         AppPreferences.setFCMToken(token);
//         print("_getToken $token");
//       }
//     });
//   }

//   _startListeningMessages() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _showNofication(message);
//     });

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingdHandler);
//   }

//   _showNofication(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     print("_showNofication ${message.data} ${message.notification}");
//     _handleMessage(message.data, notification: message.notification);

//     // If `onMessage` is triggered with a notification, construct our own
//     // local notification to show to users using the created channel.
//     if (notification != null && android != null) {
//       var channel = _getChannel();
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description ?? "",

//               icon: '@mipmap/ic_launcher',
//               // other properties...
//             ),
//           ),
//           payload: message.data.isNotEmpty
//               ? jsonEncode(message.data)
//               : jsonEncode(
//                   {"title": notification.title, "body": notification.body}));
//     }
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title!),
//         content: Text(body!),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               // await Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => SecondScreen(payload),
//               //   ),
//               // );
//             },
//           )
//         ],
//       ),
//     );
//   }

//   // It is assumed that all messages contain a data field with the key 'type'
//   Future<void> setupInteractedMessage() async {
//     // Get any messages which caused the application to open from
//     // a terminated state.
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     if (initialMessage != null) {
//       _handleMessage(initialMessage.data);
//     }

//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp
//         .listen((message) => _handleMessage(message.data));
//   }

//   void _clearNotification(int id) {
//     Future.delayed(Duration(seconds: 1))
//         .then((_) => flutterLocalNotificationsPlugin.cancel(0));
//   }

//   void _handleMessage(Map<String, dynamic> data,
//       {RemoteNotification? notification, bool? isResponse}) {
//     var user = AppPreferences.getUserData();
//     if (user == null) return;
//     Get.log("_handleMessage ${jsonEncode(data)}");
//     log("_handleMessage ${jsonEncode(data)}");
//     // var appttCtrl = Get.find<AppointmentController>();
//     var homeCtrl = Get.find<HomeController>();
//     var singleton = Singleton.instance;
//     switch (data["type"]) {
//       case "sessionStarted":
//         // if (appttCtrl.isWaitingForDoctor.value) {
//         //   appttCtrl.isWaitingForDoctor.value = false;
//         // }
//         singleton.session = data;
//         AppPreferences.setData(AppPreferences.session, {
//           ...data,
//           'sessionStartedAt': DateTime.now().millisecondsSinceEpoch
//         });

//         Get.offNamedUntil(Routers.homeScreen, (route) => false);
//         // Get.to(VideoCallingScreen());
//         homeCtrl.ongoingSession.value = data;
//         if (notification != null) _clearNotification(notification.hashCode);
//         break;
//       case "sessionFinished":
//         AppPreferences.removeData(AppPreferences.session);
//         if (isResponse == true) {
//           BottomNavigationBar navigationBar =
//               homeCtrl.bottomWidgetKey.currentWidget as BottomNavigationBar;
//           navigationBar.onTap!(1);
//         } else {
//           SnackbarUtil.info(message: "Your session has been ended");
//           Get.offNamedUntil(Routers.homeScreen, (route) => false);
//           singleton.session = data;
//           homeCtrl.ongoingSession.value.clear();
//           Future.delayed(Duration(seconds: 1)).then((value) {
//             Get.toNamed(Routers.reviewScreen);
//             homeCtrl.ongoingSession.value.clear();
//           });
//         }

//         break;
//     }
//     var body = notification?.body ?? data["body"];
//     if (body != null) {
//       if (body.toString().toLowerCase().contains("status changed")) {
//         homeCtrl.getUpcomingAppts();
//         return;
//       }
//       RegExp regex = RegExp(r'sessionId=([^&$]+)');
//       RegExp drRegex = RegExp(r'doctorName=([^&$]+)');
//       var input = body;
//       var match = regex.firstMatch(input.toString());
//       var drMatch = drRegex.firstMatch(input.toString());

//       if (match != null) {
//         String? sessionId = match.group(1);
//         var cachedSession = AppPreferences.getData(AppPreferences.session);
//         if (notification != null) _clearNotification(notification.hashCode);
//         if (cachedSession.isNotEmpty &&
//             cachedSession['sessionId'] == sessionId) {
//           Singleton.instance.session = cachedSession;
//           homeCtrl.ongoingSession.value = cachedSession;
//         } else {
//           var session = {
//             "requestedBy": AppPreferences.getUserData()!.name,
//             "sessionId": sessionId,
//             "doctorName": drMatch != null ? drMatch.group(1) : "Dr.",
//             "patientName": AppPreferences.getUserData()!.name,
//             'sessionStartedAt': DateTime.now().millisecondsSinceEpoch
//           };
//           AppPreferences.setData(AppPreferences.session, session);
//           Singleton.instance.session = session;
//           homeCtrl.ongoingSession.value = session;
//         }

//         Get.to(() => VideoCallingScreen());
//         print('Session ID: $sessionId');
//       } else {
//         print('Session ID not found');
//       }
//     }
//   }

//   onDidReceiveNotificationResponse(NotificationResponse details) {
//     if (details.payload != null) {
//       _handleMessage(jsonDecode(details.payload!), isResponse: true);
//     }
//   }
// }

// corrected

// import 'dart:convert';
// import 'dart:math';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class FirebaseAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Google Sign-In
//   Future<UserCredential?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) return null;

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       return await _auth.signInWithCredential(credential);
//     } catch (e) {
//       print('Google sign-in error: $e');
//       return null;
//     }
//   }

//   // Apple Sign-In
//   String _generateNonce([int length = 32]) {
//     const charset =
//         '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = Random.secure();
//     return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//         .join();
//   }

//   String _sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }

//   Future<UserCredential?> signInWithApple() async {
//     try {
//       final rawNonce = _generateNonce();
//       final nonce = _sha256ofString(rawNonce);

//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName
//         ],
//         nonce: nonce,
//       );

//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         rawNonce: rawNonce,
//       );

//       return await _auth.signInWithCredential(oauthCredential);
//     } catch (e) {
//       print('Apple sign-in error: $e');
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//     await GoogleSignIn().signOut();
//   }

//   User? get currentUser => _auth.currentUser;
// }

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("🔕 Background Message: ${message.messageId}");
}

class FirebaseService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'Used for important notifications',
    importance: Importance.max,
  );

  /// 🔰 Initialize Firebase Messaging and Notification
  Future<void> init() async {
    await _requestNotificationPermission();
    await _initLocalNotification();
    _listenToForegroundMessages();
    _handleBackgroundMessages();
    await _getFCMToken();
  }

  /// 🔐 Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  /// 🍏 Sign in with Apple (only works on iOS)
  Future<UserCredential?> signInWithApple() async {
    try {
      if (!Platform.isIOS) return null;

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      return await _auth.signInWithCredential(oauthCredential);
    } catch (e) {
      print("Apple Sign-In Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  /// 🛑 Request Notification Permissions
  Future<void> _requestNotificationPermission() async {
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (Platform.isAndroid) {
      await localNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }

  /// 🚀 Initialize Local Notification Plugin
  Future<void> _initLocalNotification() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();

    final settings = InitializationSettings(android: androidInit, iOS: iosInit);

    await localNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        if (payload != null) {
          final data = jsonDecode(payload);
          print("🧭 Notification Tapped: $data");
          // TODO: Navigate to screen or handle tap
        }
      },
    );
  }

  /// 🔔 Foreground Push Handling
  void _listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null && Platform.isAndroid) {
        localNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });
  }

  /// 📲 Background/Terminated Notification Handling
  void _handleBackgroundMessages() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("📬 Opened from notification: ${message.data}");
      // TODO: Handle navigation or logic
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// 🔑 Get FCM Token
  Future<void> _getFCMToken() async {
    final token = await messaging.getToken();
    print("📲 FCM Token: $token");
    // TODO: Save to backend or preferences
  }
}
