// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/services/navigator_service.dart';
// import 'package:virualapi/ui/auth/login/login_page.dart';
// import 'package:virualapi/ui/auth/signup/signup_controller.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/widgets/body_with_header.dart';
// import 'package:virualapi/widgets/date_picker.dart';
// import 'package:virualapi/widgets/misc_widget.dart';
// import 'package:virualapi/widgets/radio_group.dart';
// import 'package:virualapi/widgets/resusable_widget.dart';
// import '../../../widgets/button.dart';
// import '../../../widgets/text_field.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// class SignupScreen extends GetView<SignupController> {
//   @override
//   Widget build(BuildContext context) {
//     return BodyWithHeader(
//         isBackVisible: false,
//         islogovisible: true,
//         body: SafeArea(
//           child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: getScreenWidth(context) * 0.1, vertical: 10),
//               child: Obx(
//                 () => FormBuilder(
//                   key: controller.signupFormKey,
//                   initialValue: {
//                     'phone': '',
//                   },
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 height: getScreenHeight(context) * 0.03,
//                               ),
//                               Text("Create Your Account",
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontFamily: 'Poppinsb',
//                                       color: DARK_BG_COLOR,
//                                       fontWeight: FontWeight.bold)),
//                               Text(
//                                 "Start investigating in just a few clicks. Your data stays secure with us..",
//                                 textAlign: TextAlign.center,
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               AppTextField(
//                                 name: "name",
//                                 rectangleborder: true,
//                                 showTitle: false,
//                                 title: "Full Name",
//                                 placeholder: "Full Name",
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.required(),
//                                   ],
//                                 ),
//                               ),

//                               AppSpacerH(
//                                 10,
//                               ),
//                               AppTextField(
//                                 name: "email",
//                                 rectangleborder: true,
//                                 showTitle: false,
//                                 title: "Full Name",
//                                 placeholder: "Enter Email",
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.email(),
//                                   ],
//                                 ),
//                               ),
//                               AppSpacerH(
//                                 10,
//                               ),
//                               AppTextField(
//                                 name: "password",
//                                 title: "Password",
//                                 rectangleborder: true,
//                                 showTitle: false,
//                                 obsecureText:
//                                     controller.isConfirmPasswordObscure.isTrue,
//                                 icon: IconButton(
//                                   icon: Icon(Icons.remove_red_eye),
//                                   onPressed: () {
//                                     controller.isConfirmPasswordObscure.value =
//                                         !controller
//                                             .isConfirmPasswordObscure.value;
//                                   },
//                                 ),
//                                 placeholder: "Enter Password",
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.required(),
//                                     FormBuilderValidators.min(6)
//                                   ],
//                                 ),
//                               ),
//                               AppSpacerH(10),
//                               AppTextField(
//                                 name: "password_confirmation",
//                                 title: "Confirm password",
//                                 rectangleborder: true,
//                                 showTitle: false,
//                                 obsecureText:
//                                     controller.isConfirmPasswordObscure.value,
//                                 icon: IconButton(
//                                   icon: Icon(Icons.remove_red_eye),
//                                   onPressed: () {
//                                     controller.isConfirmPasswordObscure.value =
//                                         !controller
//                                             .isConfirmPasswordObscure.value;
//                                   },
//                                 ),
//                                 placeholder: "Enter Confirm Password",
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.required(),
//                                     FormBuilderValidators.min(6)
//                                   ],
//                                 ),
//                               ),

//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .start, // Align children properly

//                                 children: [
//                                   Flexible(
//                                       child: FormBuilderCheckbox(
//                                     activeColor: Colors.black,
//                                     initialValue: true,
//                                     name: "rememberMe",
//                                     title: RichText(
//                                       textAlign: TextAlign
//                                           .start, // Aligns text to the start
//                                       text: TextSpan(
//                                         style: TextStyle(
//                                           fontSize: 13, // Consistent font size
//                                           color: Colors.black,
//                                           height:
//                                               1.2, // Adjust line height to reduce spacing
//                                         ),
//                                         children: [
//                                           TextSpan(
//                                             text:
//                                                 'I agree to the Terms & ', // Added space explicitly
//                                             style: TextStyle(
//                                               color: GREY_TEXT_COLOR,
//                                               fontSize:
//                                                   13, // Ensure consistent font size
//                                             ),
//                                           ),
//                                           TextSpan(
//                                             text: 'Privacy Policy',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: COLOR_PRIMARY,
//                                               decoration:
//                                                   TextDecoration.underline,
//                                               decorationColor: COLOR_PRIMARY,
//                                               fontSize:
//                                                   13, // Ensure consistent font size
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )),
//                                 ],
//                               ),

//                               Button(
//                                 isLoading: controller.isBusy.value,
//                                 height: 55,
//                                 title: "SIGN UP",
//                                 // onPressed: () {},
//                                 onPressed: controller.handleSignupData,
//                                 backgroundColor: DARK_BG_COLOR,
//                               ),
//                               // Align(
//                               //     alignment: Alignment.center,
//                               //     child: TextButton(
//                               //         onPressed: () {
//                               //           push(context, ForgotScreen());
//                               //         },
//                               //         child: Text(
//                               //           "Forgot Password?",
//                               //           style: TextStyle(color: Colors.black38),
//                               //         )))
//                               AppSpacerH(20),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     height: 1,
//                                     width: getScreenWidth(context) * 0.27,
//                                     color: Colors.black38,
//                                   ),
//                                   Text("Sign in With"),
//                                   Container(
//                                     height: 1,
//                                     width: getScreenWidth(context) * 0.27,
//                                     color: Colors.black38,
//                                   ),
//                                 ],
//                               ),
//                               AppSpacerH(20),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   GestureDetector(
//                                       onTap: () {},
//                                       child: ReusableWidget.loadSvg(
//                                           "assets/images/facebok.svg")),
//                                   GestureDetector(
//                                       onTap: () {},
//                                       child: ReusableWidget.loadSvg(
//                                           "assets/images/tw.svg")),
//                                   GestureDetector(
//                                       onTap: () {},
//                                       child: ReusableWidget.loadSvg(
//                                           "assets/images/go.svg")),
//                                 ],
//                               ),
//                               AppSpacerH(20),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Already have an account? ",
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       Get.back();
//                                       // pushAndRemoveUntil(
//                                       //     context, LoginScreen());
//                                       // Get.toNamed(Routers.login);
//                                     },
//                                     child: Text(
//                                       "Sign in",
//                                       style: TextStyle(
//                                           color: COLOR_PRIMARY,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/navigator_service.dart';
import 'package:virualapi/ui/auth/signup/signup_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/resusable_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart';

class SignupScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: false,
      islogovisible: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.1,
            vertical: 10,
          ),
          child: Obx(
            () => FormBuilder(
              key: controller.formKey,
              initialValue: {
                'name': '',
                'email': '',
                'password': '',
                'password_confirmation': '',
                'rememberMe': true,
              },
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: getScreenHeight(context) * 0.03),
                          Text(
                            "Create Your Account",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Poppinsb',
                              color: DARK_BG_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Start investigating in just a few clicks. Your data stays secure with us.",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),

                          // Full Name
                          AppTextField(
                            name: "name",
                            rectangleborder: true,
                            showTitle: false,
                            placeholder: "Full Name",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          AppSpacerH(10),

                          // Email
                          AppTextField(
                            name: "email",
                            rectangleborder: true,
                            showTitle: false,
                            placeholder: "Enter Email",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                          AppSpacerH(10),

                          // Password
                          AppTextField(
                            name: "password",
                            rectangleborder: true,
                            showTitle: false,
                            obsecureText: controller.isPasswordObscure.value,
                            icon: IconButton(
                              icon: Icon(
                                controller.isPasswordObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.isPasswordObscure.toggle();
                              },
                            ),
                            placeholder: "Enter Password",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          AppSpacerH(10),

                          // Confirm Password
                          AppTextField(
                            name: "password_confirmation",
                            rectangleborder: true,
                            showTitle: false,
                            obsecureText:
                                controller.isConfirmPasswordObscure.value,
                            icon: IconButton(
                              icon: Icon(
                                controller.isConfirmPasswordObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.isConfirmPasswordObscure.toggle();
                              },
                            ),
                            placeholder: "Enter Confirm Password",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          AppSpacerH(10),

                          //Remember me
                          FormBuilderCheckbox(
                            activeColor: Colors.black,
                            name: "rememberMe",
                            initialValue: true,
                            title: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 13,
                                  color: GREY_TEXT_COLOR,
                                ),
                                children: [
                                  TextSpan(text: "I agree to the "),
                                  TextSpan(
                                    text: "Terms & Privacy Policy",
                                    style: TextStyle(
                                      color: COLOR_PRIMARY,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppSpacerH(20),

                          // Sign Up Button
                          Button(
                            title: "SIGN UP",
                            height: 55,
                            backgroundColor: DARK_BG_COLOR,
                            isLoading: controller.isBusy.value,
                            onPressed: controller.handleSignupData,
                          ),
                          AppSpacerH(20),

                          // Divider
                          Row(
                            children: [
                              Expanded(
                                child: Divider(color: Colors.black38),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Sign in With"),
                              ),
                              Expanded(
                                child: Divider(color: Colors.black38),
                              ),
                            ],
                          ),
                          AppSpacerH(20),

                          // Social login
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: ReusableWidget.loadSvg(
                          //           "assets/images/facebok.svg"),
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: ReusableWidget.loadSvg(
                          //           "assets/images/tw.svg"),
                          //     ),
                          //     GestureDetector(
                          //       onTap: () {},
                          //       child: ReusableWidget.loadSvg(
                          //           "assets/images/go.svg"),
                          //     ),
                          //   ],
                          // ),
                          // AppSpacerH(20),

                          // Already have an account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: COLOR_PRIMARY,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
