// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/auth_repo.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/widgets/body_with_header.dart';
// import 'package:virualapi/widgets/button.dart';
// import 'package:virualapi/widgets/text_field.dart';
// import '../../../core/error/failure.dart';
// import '../../../utils/snackbar_util.dart';

// class OtpScreen extends StatefulWidget {
//   OtpScreen({Key? key}) : super(key: key);

//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   OtpFieldController otpController = OtpFieldController();
//   final AuthRepository authRepo = Get.find();
//   final textEditingController = TextEditingController();

//   late final String email;
//   late final bool isForgotPassword;

//   @override
//   void initState() {
//     super.initState();
//     final args = Get.arguments;
//     email = args['email'];
//     isForgotPassword = args['isForgotPassword'] ?? false;
//   }

//   _verifyOTP(String pin) async {
//     var params = Get.parameters;
//     bool isForgotPassword =
//         params.isNotEmpty && params.containsKey("isForgotPassword");
//     var result = await (isForgotPassword
//         ? authRepo.verifyResetOTP(otp: pin)
//         : authRepo.verifyOTP(otp: pin, email: email));

//     result.fold(
//       (failure) {
//         SnackbarUtil.error(
//           logMessage: (failure as Error).errorMessage.toString(),
//           logScreenName: Routers.otp,
//           logMethodName: 'verifyOTP',
//           message: (failure).errorMessage.toString(),
//         );
//       },
//       (r) {
//         SnackbarUtil.info(message: "Verified Successfully!", isInfo: false);
//         if (isForgotPassword) {
//           Get.toNamed(Routers.resetPassword);
//         } else {
//           Get.offNamed(Routers.profile);
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//       isBackVisible: false,
//       islogovisible: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 50, bottom: 30),
//                 child: Text(
//                   "Verification",
//                   style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: DARK_BG_COLOR),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                 child: Text(
//                   "Please enter the 4 digit code that send to your\nemail address",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 15, color: COLOR_GRAY),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: PinCodeTextField(

//                   appContext: context,
//                   length: 5,
//                   onChanged: (value) {
//                     print("Changed: $value");
//                   },
//                   onCompleted: (pin) {
//                     print("Completed: $pin");
//                     _verifyOTP(pin);
//                   },
//                   cursorColor: Colors.black, // 👈 Change cursor color here
//                   keyboardType: TextInputType.number,
//                   textStyle: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     borderRadius: BorderRadius.circular(20),
//                     fieldWidth: 50,
//                     borderWidth: 0, // Remove border line
//                     activeColor: Colors.black,
//                     selectedColor: Colors.black,
//                     inactiveFillColor: COLOR_PRIMARY, // Light gray fill
//                     activeFillColor: Colors.black,
//                     selectedFillColor: Colors.black,
//                     fieldHeight: 60,
//                   ),
//                 ),
//               ),

//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   style: TextStyle(fontSize: 15, color: COLOR_GRAY),
//                   children: [
//                     TextSpan(text: "If you didn't receive the code? "),
//                     WidgetSpan(
//                       alignment: PlaceholderAlignment.middle,
//                       child: GestureDetector(
//                           onTap: () {
//                             // Your resend logic
//                           },
//                           child: Text(
//                             "Resend",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.w700,
//                               fontStyle: FontStyle.italic,
//                               decoration: TextDecoration.underline,
//                               fontSize: 15,
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),

//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 10),
//               //   child: TextField(
//               //     controller: textEditingController,
//               //     maxLength: 6,
//               //     keyboardType: TextInputType.number,
//               //     onChanged: (value) {
//               //       if (value.length == 6) {
//               //         _verifyOTP(value);
//               //       }
//               //     },
//               //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               //     decoration: InputDecoration(counterText: ""),
//               //     style: TextStyle(
//               //         letterSpacing: getScreenWidth(context) * 0.13,
//               //         fontSize: 22),
//               //     onSubmitted: (val) => _verifyOTP(textEditingController.text),
//               //   ),
//               // ),
//               // OTPTextField(
//               //     controller: otpController,
//               //     length: 4,
//               //     width: MediaQuery.of(context).size.width,
//               //     textFieldAlignment: MainAxisAlignment.spaceAround,
//               //     fieldWidth: 50.w,
//               //     fieldStyle: FieldStyle.underline,

//               //     outlineBorderRadius: 15,
//               //     style: TextStyle(
//               //         fontSize: 25,
//               //         fontWeight: FontWeight.bold,
//               //         color: Colors.black),
//               //     onChanged: (pin) {
//               //       print("Changed: " + pin);
//               //     },
//               //     onCompleted: (pin) async {
//               //       print("Completed: " + pin);
//               //       _verifyOTP(pin);
//               //       // FirebaseAuth auth = FirebaseAuth.instance;
//               //       // Create a PhoneAuthCredential with the code
//               //       // PhoneAuthCredential credential = PhoneAuthProvider.credential(
//               //       //     verificationId: params["verificationId"], smsCode: pin);

//               //       // Sign the user in (or link) with the credential
//               //       // await auth.signInWithCredential(credential).then((value) {
//               //       //   auth.signOut();
//               //       //   SnackbarUtil.info(
//               //       //       message: "Phone number verified successfully");
//               //       //   Future.delayed(Duration(milliseconds: 1500)).then((_) {
//               //       //     Get.toNamed(Routers.signUp1);
//               //       //   });
//               //       // }).catchError((e) {
//               //       //   SnackbarUtil.error(message: e.toString());
//               //       // });
//               //     }),
//               // Padding(
//               //   padding: const EdgeInsets.only(top: 30),
//               //   child: Text("Enter Verification Code",
//               //       style: Theme.of(context).textTheme.titleLarge),
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 20),
//               //   child: Text(
//               //     "Please enter the 4 digit code that send to your email address",
//               //     textAlign: TextAlign.center,
//               //   ),
//               // ),
//               SizedBox(
//                 height: 30,
//               ),
//               // Expanded(child: Container()),
//               Button(
//                   height: 55,
//                   width: getScreenWidth(context) / 1.1,
//                   title: "VERIFY",
//                   onPressed: () => _verifyOTP(),
//                   backgroundColor: DARK_BG_COLOR),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/auth_repo.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/widgets/body_with_header.dart';
// import 'package:virualapi/widgets/button.dart';
// import 'package:virualapi/widgets/text_field.dart';
// import '../../../core/error/failure.dart';
// import '../../../utils/snackbar_util.dart';

// class OtpScreen extends StatefulWidget {
//   OtpScreen({Key? key}) : super(key: key);

//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   final AuthRepository authRepo = Get.find();
//   String enteredOtp = '';

//   late final String email;
//   // late final bool isForgotPassword;

//   @override
//   void initState() {
//     super.initState();
//     final args = Get.arguments;
//     email = args['email'];
//     // isForgotPassword = args['isForgotPassword'] ?? false;
//   }

//   Future<void> _verifyOTP() async {
//     if (enteredOtp.length < 5) {
//       SnackbarUtil.error(message: "Please enter a valid OTP");
//       return;
//     }

//     final result = await authRepo.verifyOTP(otp: enteredOtp, email: email);
//     result.fold(
//       (failure) {
//         // Handle failure
//         SnackbarUtil.error(
//           logMessage: failure.errorMessage.toString(),
//           message: failure.errorMessage.toString(),
//         );
//       },
//       (isSuccess) {
//         // OTP verified successfully
//         if (isSuccess) {
//           SnackbarUtil.info(message: "OTP Verified!");
//           // Proceed with further actions
//         } else {
//           SnackbarUtil.error(message: "OTP verification failed");
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//       isBackVisible: false,
//       islogovisible: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               SizedBox(height: 50),
//               Text(
//                 "Verification",
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: DARK_BG_COLOR),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Please enter the 4 digit code that was sent to your\nemail address",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 15, color: COLOR_GRAY),
//               ),
//               SizedBox(height: 30),

//               /// OTP Input Field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: PinCodeTextField(
//                   appContext: context,
//                   length: 5,
//                   onChanged: (value) {
//                     setState(() {
//                       enteredOtp = value;
//                     });
//                   },
//                   onCompleted: (pin) {
//                     setState(() {
//                       enteredOtp = pin;
//                     });
//                     _verifyOTP();
//                   },
//                   keyboardType: TextInputType.number,
//                   textStyle: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   pinTheme: PinTheme(
//                     shape: PinCodeFieldShape.box,
//                     borderRadius: BorderRadius.circular(20),
//                     fieldWidth: 50,
//                     fieldHeight: 60,
//                     borderWidth: 0,
//                     inactiveFillColor: COLOR_PRIMARY,
//                     activeFillColor: Colors.black,
//                     selectedFillColor: Colors.black,
//                     activeColor: Colors.black,
//                     selectedColor: Colors.black,
//                   ),
//                 ),
//               ),

//               /// Resend
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   style: TextStyle(fontSize: 15, color: COLOR_GRAY),
//                   children: [
//                     TextSpan(text: "If you didn't receive the code? "),
//                     WidgetSpan(
//                       alignment: PlaceholderAlignment.middle,
//                       child: GestureDetector(
//                         onTap: () {
//                           // TODO: Add resend logic
//                         },
//                         child: Text(
//                           "Resend",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.italic,
//                             decoration: TextDecoration.underline,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               SizedBox(height: 40),

//               /// Verify Button
//               Button(
//                 // isLoading: true ?? false,
//                 height: 55,
//                 width: getScreenWidth(context) / 1.1,
//                 title: "VERIFY",
//                 onPressed: _verifyOTP,
//                 backgroundColor: DARK_BG_COLOR,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/text_field.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'otp_controller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);

  final OtpController otpController =
      Get.put(OtpController()); // Use GetX controller

  @override
  Widget build(BuildContext context) {
    // Get the arguments (email) passed from the previous screen
    final args = Get.arguments;
    final String email = args['email'];

    return BodyWithHeader(
      isBackVisible: false,
      islogovisible: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "Verification",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                "Please enter the 5 digit code that was sent to your\nemail address",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              SizedBox(height: 30),

              /// OTP Input Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PinCodeTextField(
                  appContext: context,
                  length: 5,
                  onChanged: (value) {
                    otpController.enteredOtp.value =
                        value; // Update the OTP value
                  },
                  onCompleted: (pin) {
                    otpController.enteredOtp.value =
                        pin; // Update the OTP value
                    otpController.verifyOTP(email); // Call the verification
                  },
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(20),
                    fieldWidth: 50,
                    fieldHeight: 60,
                    borderWidth: 0,
                    inactiveFillColor: Colors.grey[200]!,
                    activeFillColor: Colors.black,
                    selectedFillColor: Colors.black,
                    activeColor: Colors.black,
                    selectedColor: Colors.black,
                  ),
                ),
              ),

              /// Resend OTP Logic
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  children: [
                    TextSpan(text: "If you didn't receive the code? "),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: () {
                          // TODO: Add resend logic
                        },
                        child: Text(
                          "Resend",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              /// Verify Button
              Obx(() {
                return Button(
                  isLoading: otpController.isLoading.value,
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.1,
                  title:
                      otpController.isLoading.value ? "VERifying..." : "VERIFY",
                  onPressed: () {
                    otpController
                        .verifyOTP(email); // Verify OTP when button is pressed
                  },
                  backgroundColor: DARK_BG_COLOR,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
