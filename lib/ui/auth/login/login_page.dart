import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/auth/signup/signup.dart';
import 'package:virualapi/ui/home/home_screeen.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/resusable_widget.dart';
import '../../../services/navigator_service.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        isBackVisible: false,
        islogovisible: true,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(context) * 0.1, vertical: 5),
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: controller.formKey,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: getScreenHeight(context) * 0.1,
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Welcome Back !",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppinsb',
                                  color: DARK_BG_COLOR,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Log in to your account and continue your investigations.",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black38),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // AppTextField(
                          //   name: 'username',
                          //   showTitle: false,
                          //   title: "Username",
                          //   rectangleborder: true,
                          //   placeholder: "UserName",
                          //   validator: FormBuilderValidators.compose(([
                          //     FormBuilderValidators.required(),
                          //   ])),
                          // ),
                          AppTextField(
                            name: 'username',
                            showTitle: false,
                            maxline: 1,
                            title: "UserName",
                            rectangleborder: true,
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6)
                              ],
                            ),
                            placeholder: "UserName",
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            name: 'password',
                            showTitle: false,
                            maxline: 1,
                            title: "Password",
                            rectangleborder: true,
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6)
                              ],
                            ),
                            obsecureText: controller.isObsecure.isTrue,
                            icon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                controller.isObsecure.value =
                                    !controller.isObsecure.value;
                              },
                            ),
                            placeholder: "Enter Password",
                            onCompleted: controller.onLogin,
                          ),

                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Align children properly
                              children: [
                                Flexible(
                                  child: FormBuilderCheckbox(
                                    activeColor: Colors.black,
                                    initialValue: true,
                                    name: "rememberMe",
                                    title: Text(
                                      "Remember Me",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black45),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: controller.forgotPassword,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: COLOR_PRIMARY),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Button(
                          //   isLoading: controller.isBusy.value,
                          //   height: 55,
                          //   title: "Sign in",
                          //   // onPressed: () {},
                          //   onPressed: controller.onLogin,
                          //   backgroundColor: DARK_BG_COLOR,
                          // ),
                          Button(
                            // isLoading: controller.isBusy.value,
                            height: 55,
                            title: "Sign in",
                            onPressed: () {
                              // if (controller.formKey.currentState
                              //         ?.saveAndValidate() ??
                              //     false) {
                              //   final formValues =
                              //       controller.formKey.currentState!.value;
                              //   final username = formValues['username'];
                              //   final password = formValues['password'];

                              //   // Print username and password to the terminal
                              //   debugPrint("Username: $username");
                              //   debugPrint("Password: $password");

                              //   // Call the login method or perform your logic here
                              //   // controller.onLogin();
                              // } else {
                              //   debugPrint("Form validation failed");
                              // }
                              pushAndRemoveUntil(context, HomeScreen());
                            },
                            backgroundColor: DARK_BG_COLOR,
                          ),

                          SizedBox(
                            height: 50,
                          ),
                          // Align(
                          //     alignment: Alignment.center,
                          //     child: TextButton(
                          //         onPressed: controller.forgotPassword,
                          //         child: Text(
                          //           "Forgot Password?",
                          //           style: TextStyle(color: Colors.black38),
                          //         )))

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                    ),
                    GestureDetector(
                      onTap: () {
                        push(context, SignupScreen());
                        // Get.toNamed(Routers.signUp);
                      },
                      child: Text(
                        "Signup",
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
        )));
  }
}
