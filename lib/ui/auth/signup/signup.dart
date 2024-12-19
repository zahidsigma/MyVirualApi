import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/navigator_service.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/ui/auth/signup/signup_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/date_picker.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/radio_group.dart';
import 'package:virualapi/widgets/resusable_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        isBackVisible: false,
        islogovisible: true,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.1, vertical: 10),
              child: Obx(
                () => FormBuilder(
                  key: controller.signupFormKey,
                  initialValue: {
                    'phone': '',
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: getScreenHeight(context) * 0.03,
                              ),
                              Text("Create Your Account",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Poppinsb',
                                      color: DARK_BG_COLOR,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Start investigating in just a few clicks. Your data stays secure with us..",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AppTextField(
                                name: "name",
                                rectangleborder: true,
                                showTitle: false,
                                title: "Full Name",
                                placeholder: "Full Name",
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   "Mobile Number",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontFamily: 'Poppinsb'),
                              // ),
                              // InternationalPhoneNumberInput(
                              //   onInputChanged: (PhoneNumber number) {
                              //     var phoneNum = number.phoneNumber
                              //         ?.split(number.dialCode!)[1];
                              //     var finalNum =
                              //         "${number.dialCode?.substring(1)}${phoneNum}";
                              //     controller.phoneNumberVal = finalNum;
                              //     print("patched $finalNum");
                              //   },
                              //   onInputValidated: (bool value) {
                              //     controller.isPhoneNumberValid = value;
                              //     print("onInputValidated $value");
                              //   },
                              //   inputDecoration: InputDecoration(),
                              //   selectorConfig: SelectorConfig(
                              //     selectorType: PhoneInputSelectorType.DIALOG,
                              //   ),
                              //   // validator: (value) {
                              //   //   if (value == null || value.isEmpty) {
                              //   //     return 'Please enter a phone number.';
                              //   //   } else if (!controller.phoneNumberRegExp
                              //   //       .hasMatch(value.substring(1))) {
                              //   //     print("Didn't match :>");
                              //   //     return 'Invalid phone number format.';
                              //   //   }
                              //   //   print("All Ok!");
                              //   //   return null;
                              //   // },
                              //   initialValue: controller.phoneNumber,
                              //   ignoreBlank: false,
                              //   autoValidateMode:
                              //       AutovalidateMode.onUserInteraction,
                              //   selectorTextStyle: TextStyle(color: Colors.black),
                              //   formatInput: true,
                              //   keyboardType: TextInputType.numberWithOptions(
                              //       signed: true, decimal: true),
                              //   inputBorder: OutlineInputBorder(),
                              //   onSaved: (PhoneNumber number) {
                              //     print('On Saved: $number');
                              //   },
                              // ),
                              // AppTextField(
                              //   name: "phone",
                              //   title: "Mobile Number",
                              //   placeholder: "923214561239",
                              //   validator: FormBuilderValidators.compose(
                              //     [
                              //       FormBuilderValidators.required(),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // DateTimePicker(
                              //   name: 'dob',
                              //   placeholder: "Date Of Birth",
                              //   minDate: DateTime(1900, 1, 1),
                              //   maxDate: DateTime.now(),
                              //   validator: FormBuilderValidators.compose(
                              //     [
                              //       FormBuilderValidators.required(),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // RadioGroup(
                              //     name: 'gender',
                              //     placeholder: "Gender",
                              //     showTitle: true,
                              //     title: "Gender",
                              //     initialValue: "Male",
                              //     validator: FormBuilderValidators.compose(
                              //       [
                              //         FormBuilderValidators.required(),
                              //       ],
                              //     ),
                              //     options: [
                              //       FormBuilderFieldOption(value: "Male"),
                              //       FormBuilderFieldOption(value: "Female"),
                              //     ]),
                              AppSpacerH(
                                10,
                              ),
                              AppTextField(
                                name: "email",
                                rectangleborder: true,
                                showTitle: false,
                                title: "Full Name",
                                placeholder: "Enter Email",
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.email(),
                                  ],
                                ),
                              ),
                              AppSpacerH(
                                10,
                              ),
                              AppTextField(
                                name: "password",
                                title: "Password",
                                rectangleborder: true,
                                showTitle: false,
                                obsecureText: controller.isObsecure.isTrue,
                                icon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    controller.isObsecure.value =
                                        !controller.isObsecure.value;
                                  },
                                ),
                                placeholder: "Enter Password",
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.min(6)
                                  ],
                                ),
                              ),
                              AppSpacerH(10),
                              AppTextField(
                                name: "confirmPassword",
                                title: "Confirm password",
                                rectangleborder: true,
                                showTitle: false,
                                obsecureText:
                                    controller.isConfirmObsecure.isTrue,
                                icon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    controller.isConfirmObsecure.value =
                                        !controller.isConfirmObsecure.value;
                                  },
                                ),
                                placeholder: "Enter Confirm Password",
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.min(6)
                                  ],
                                ),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                              //   child: Text.rich(
                              //     TextSpan(
                              //       children: [
                              //         WidgetSpan(
                              //           alignment: PlaceholderAlignment.middle,
                              //           child: Checkbox(
                              //             value: controller.whatsAppInstalled.value,
                              //             visualDensity: VisualDensity(
                              //                 horizontal: -4,
                              //                 vertical:
                              //                     -4), // Adjust visual density
                              //             materialTapTargetSize: MaterialTapTargetSize
                              //                 .shrinkWrap, // Shrink tap target size

                              //             activeColor: COLOR_ACCENT,
                              //             onChanged: (val) {
                              //               controller.whatsAppInstalled.value =
                              //                   !controller.whatsAppInstalled.value;
                              //             },
                              //           ),
                              //         ),
                              //         WidgetSpan(
                              //             alignment: PlaceholderAlignment.middle,
                              //             child: AppSpacerW(5)),
                              //         TextSpan(
                              //             text:
                              //                 "By checking this box you confirm that you have "),
                              //         TextSpan(
                              //             text: "WhatsApp",
                              //             style: TextStyle(
                              //                 color: COLOR_ACCENT,
                              //                 fontWeight: FontWeight.bold)),
                              //         TextSpan(
                              //             text:
                              //                 " installed on your phone. It is used to send OTP and other important information"),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // Wrap(
                              //   children: [
                              //     Checkbox(
                              //       value: true,
                              //       onChanged: (val) {},
                              //     ),
                              //     Flexible(
                              //       child: Text(
                              //         "By checking this box you confirm that you have WhatsApp installed on your phone. It will be used to send OTP and important notifications",
                              //         overflow: TextOverflow.visible,
                              //         softWrap: true,
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              // FormBuilderCheckbox(
                              //     activeColor: COLOR_ACCENT,
                              //     initialValue: true,
                              //     name: "whatsAppInstalled",
                              //     title: Text(
                              //       "By checking this box you confirm that you have WhatsApp installed on your phone. It will be used to send OTP and important notifications",
                              //       style: TextStyle(fontSize: 14),
                              //     )),

                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .start, // Align children properly

                                children: [
                                  Flexible(
                                      child: FormBuilderCheckbox(
                                    activeColor: Colors.black,
                                    initialValue: true,
                                    name: "rememberMe",
                                    title: RichText(
                                      textAlign: TextAlign
                                          .start, // Aligns text to the start
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 13, // Consistent font size
                                          color: Colors.black,
                                          height:
                                              1.2, // Adjust line height to reduce spacing
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'I agree to the Terms & ', // Added space explicitly
                                            style: TextStyle(
                                              color: GREY_TEXT_COLOR,
                                              fontSize:
                                                  13, // Ensure consistent font size
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: COLOR_PRIMARY,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: COLOR_PRIMARY,
                                              fontSize:
                                                  13, // Ensure consistent font size
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ],
                              ),

                              Button(
                                isLoading: controller.isBusy.value,
                                height: 55,
                                title: "SIGN UP",
                                // onPressed: () {},
                                onPressed: controller.handleSignupData,
                                backgroundColor: DARK_BG_COLOR,
                              ),
                              // Align(
                              //     alignment: Alignment.center,
                              //     child: TextButton(
                              //         onPressed: () {
                              //           push(context, ForgotScreen());
                              //         },
                              //         child: Text(
                              //           "Forgot Password?",
                              //           style: TextStyle(color: Colors.black38),
                              //         )))
                              AppSpacerH(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 1,
                                    width: getScreenWidth(context) * 0.27,
                                    color: Colors.black38,
                                  ),
                                  Text("Sign in With"),
                                  Container(
                                    height: 1,
                                    width: getScreenWidth(context) * 0.27,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                              AppSpacerH(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: ReusableWidget.loadSvg(
                                          "assets/images/facebok.svg")),
                                  GestureDetector(
                                      onTap: () {},
                                      child: ReusableWidget.loadSvg(
                                          "assets/images/tw.svg")),
                                  GestureDetector(
                                      onTap: () {},
                                      child: ReusableWidget.loadSvg(
                                          "assets/images/go.svg")),
                                ],
                              ),
                              AppSpacerH(20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? ",
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      // pushAndRemoveUntil(
                                      //     context, LoginScreen());
                                      // Get.toNamed(Routers.login);
                                    },
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                          color: COLOR_PRIMARY,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
