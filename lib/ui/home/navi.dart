// import 'package:flutter/material.dart';
// import 'package:pro_doc/services/navigator_service.dart';
// import 'package:pro_doc/ui/auth/forgot_password.dart';
// import 'package:pro_doc/ui/auth/login.dart';
// import 'package:pro_doc/ui/auth/otp.dart';
// import 'package:pro_doc/ui/auth/reset_password.dart';
// import 'package:pro_doc/ui/auth/signup.dart';
// import 'package:pro_doc/ui/auth/signup1.dart';
// import 'package:pro_doc/ui/doctor/doctor_details.dart';
// import 'package:pro_doc/ui/home/home_screen.dart';

// class NavigateScreen extends StatefulWidget {
//   const NavigateScreen({super.key});

//   @override
//   State<NavigateScreen> createState() => _NavigateScreenState();
// }

// class _NavigateScreenState extends State<NavigateScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, ResetPassword());
//                 },
//                 child: Text("Reset Screen")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, OtpScreen());
//                 },
//                 child: Text("Otp Screen")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, SignupScreen1());
//                 },
//                 child: Text("Signup Screen")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, SignupScreen());
//                 },
//                 child: Text("Signup Screen")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, ForgotScreen());
//                 },
//                 child: Text("ForgotScreen Screen")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, HomeScreen());
//                 },
//                 child: Text("Home Screen")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, DoctorDetails());
//                 },
//                 child: Text("Doctor Details")),
//             ElevatedButton(
//                 onPressed: () {
//                   push(context, LoginScreen());
//                 },
//                 child: Text("Login Screen"))
//           ],
//         ),
//       ),
//     );
//   }
// }
