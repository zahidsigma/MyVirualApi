import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/navigator_service.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/ui/auth/signup/signup_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/date_picker.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/radio_group.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: getScreenHeight(context) * 0.04,
                          ),
                          Text("Sign up",
                              style: Theme.of(context).textTheme.titleLarge),
                          Text("Register with Prodoc to continue"),
                          SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            name: "name",
                            title: "Full Name",
                            placeholder: "Enter Name",
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Mobile Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppinsb'),
                          ),
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              var phoneNum = number.phoneNumber
                                  ?.split(number.dialCode!)[1];
                              var finalNum =
                                  "${number.dialCode?.substring(1)}${phoneNum}";
                              controller.phoneNumberVal = finalNum;
                              print("patched $finalNum");
                            },
                            onInputValidated: (bool value) {
                              controller.isPhoneNumberValid = value;
                              print("onInputValidated $value");
                            },
                            inputDecoration: InputDecoration(),
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter a phone number.';
                            //   } else if (!controller.phoneNumberRegExp
                            //       .hasMatch(value.substring(1))) {
                            //     print("Didn't match :>");
                            //     return 'Invalid phone number format.';
                            //   }
                            //   print("All Ok!");
                            //   return null;
                            // },
                            initialValue: controller.phoneNumber,
                            ignoreBlank: false,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            formatInput: true,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
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
                          SizedBox(
                            height: 20,
                          ),
                          DateTimePicker(
                            name: 'dob',
                            placeholder: "Date Of Birth",
                            minDate: DateTime(1900, 1, 1),
                            maxDate: DateTime.now(),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RadioGroup(
                              name: 'gender',
                              placeholder: "Gender",
                              showTitle: true,
                              title: "Gender",
                              initialValue: "Male",
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                ],
                              ),
                              options: [
                                FormBuilderFieldOption(value: "Male"),
                                FormBuilderFieldOption(value: "Female"),
                              ]),
                          AppSpacerH(
                            20,
                          ),
                          AppTextField(
                            name: "password",
                            title: "Password",
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
                          AppSpacerH(20),
                          AppTextField(
                            name: "confirmPassword",
                            title: "Confirm password",
                            obsecureText: controller.isConfirmObsecure.isTrue,
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

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Checkbox(
                                      value: controller.whatsAppInstalled.value,
                                      visualDensity: VisualDensity(
                                          horizontal: -4,
                                          vertical:
                                              -4), // Adjust visual density
                                      materialTapTargetSize: MaterialTapTargetSize
                                          .shrinkWrap, // Shrink tap target size

                                      activeColor: COLOR_ACCENT,
                                      onChanged: (val) {
                                        controller.whatsAppInstalled.value =
                                            !controller.whatsAppInstalled.value;
                                      },
                                    ),
                                  ),
                                  WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: AppSpacerW(5)),
                                  TextSpan(
                                      text:
                                          "By checking this box you confirm that you have "),
                                  TextSpan(
                                      text: "WhatsApp",
                                      style: TextStyle(
                                          color: COLOR_ACCENT,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          " installed on your phone. It is used to send OTP and other important information"),
                                ],
                              ),
                            ),
                          ),
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
                          Button(
                            isLoading: controller.isBusy.value,
                            height: 55,
                            title: "SIGN UP",
                            onPressed: controller.handleSignupData,
                            backgroundColor: Color(0xFFEB8F07),
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
                          AppSpacerH(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                              ),
                              GestureDetector(
                                onTap: () {
                                  pushAndRemoveUntil(context, LoginScreen());
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Color(
                                        0xFFEB8F07,
                                      ),
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
