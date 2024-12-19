// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';
// import 'package:virualapi/constants/constant.dart';
// // import 'package:virualapi/ui/appointment/appointment_controller.dart';

// class AppWebview extends StatefulWidget {
//   final String uri;
//   final String title;
//   const AppWebview({super.key, required this.uri, required this.title});
//   @override
//   State<AppWebview> createState() => _AppWebviewState();
// }

// class _AppWebviewState extends State<AppWebview> {
//   InAppWebViewController? _webViewController;
//   bool isLoading = true;

//   void checkUrl(Uri uri) {
//     // Check for specific parameters and values
//     String? doctorId = uri.queryParameters['doctor_id'];
//     String? amount = uri.queryParameters['amount'];
//     String? userId = uri.queryParameters['user_id'];
//     String? userName = uri.queryParameters['user_name'];
//     String? processorId = uri.queryParameters['processor_id'];
//     String? doctorName = uri.queryParameters['doctor_name'];
//     String? orderId = uri.queryParameters['order_id'];
//     String? status = uri.queryParameters['status'];

//     if (doctorId != null &&
//         amount != null &&
//         userId != null &&
//         userName != null &&
//         processorId != null &&
//         doctorName != null &&
//         orderId != null &&
//         status != null &&
//         status.toLowerCase() == 'approve') {
//       var appttCtrl = Get.find<AppointmentController>();
//       Get.snackbar("Payment Received",
//           "Your Payment ${appttCtrl.totalAmount.value} has been received");
//       Get.back();

//       appttCtrl.createAppt();
//       print('All parameters are present, and status is "approve".');
//       // You can perform additional actions here if needed.
//     } else {
//       print('Some parameters are missing or status is not "approve".');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) {
//       AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black38,
//         appBar: AppBar(
//             backgroundColor: COLOR_PRIMARY,
//             title: Text(
//               widget.title,
//               style: TextStyle(fontSize: 15),
//             )),
//         body: SafeArea(
//           child: Stack(
//             children: [
//               InAppWebView(
//                 // initialUrlRequest: URLRequest(url: Uri.parse(widget.uri)),
//                 onUpdateVisitedHistory: (controller, url, androidIsReload) {
//                   print("onUpdateVisitedHistory $url");
//                   if (url != null) {
//                     checkUrl(url);
//                   }
//                   // https://portal.digilifeinc.com/payment-verify.html?doctor_id=sabikajaffer6@gmail.com&amount=5&user_id=tpli_user1@mailinator.com&user_name=TPLI%20test%20user1&processor_id=abhipay&doctor_name=DR%20SABIKA%20JAFFER&order_id=AB001140&status=approve
//                 },
//                 initialOptions: InAppWebViewGroupOptions(
//                   crossPlatform: InAppWebViewOptions(
//                       mediaPlaybackRequiresUserGesture: false,
//                       javaScriptEnabled: true
//                       // debuggingEnabled: true,
//                       ),
//                 ),
//                 onLoadStart: (controller, url) {
//                   setState(() {
//                     isLoading = true;
//                   });
//                 },
//                 onLoadStop: (controller, url) {
//                   setState(() {
//                     isLoading = false;
//                   });
//                 },
//                 onLoadError: (controller, url, code, message) {
//                   print("WebView error: $message");
//                 },
//                 onConsoleMessage: (controller, consoleMessage) {
//                   print("Console message: ${consoleMessage.message}");
//                 },
//                 onWebViewCreated: (InAppWebViewController controller) {
//                   _webViewController = controller;
//                 },
//               ),
//               if (isLoading)
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//             ],
//           ),
//         ));
//   }
// }
