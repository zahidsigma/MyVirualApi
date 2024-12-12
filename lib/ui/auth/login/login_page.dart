import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/auth/signup/signup.dart';
import 'package:virualapi/utils/metrics.dart';
import '../../../services/navigator_service.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.1, vertical: 10),
      child: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenHeight(context) * 0.1,
                      ),
                      Text("Login",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("Please Sign in to continue."),
                      SizedBox(
                        height: 80,
                      ),
                      AppTextField(
                        name: 'username',
                        title: "Username",
                        placeholder: "Phone Number/Email",
                        validator: FormBuilderValidators.compose(([
                          FormBuilderValidators.required(),
                        ])),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                        name: 'password',
                        title: "Password",
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
                      FormBuilderCheckbox(
                          activeColor: COLOR_ACCENT,
                          initialValue: true,
                          name: "rememberMe",
                          title: Text(
                            "Remember Me",
                            style: TextStyle(fontSize: 14),
                          )),
                      Button(
                        isLoading: controller.isBusy.value,
                        height: 55,
                        title: "LOGIN",
                        onPressed: controller.onLogin,
                        backgroundColor: Color(0xFFEB8F07),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: controller.forgotPassword,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.black38),
                              )))
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
                  },
                  child: Text(
                    "Signup",
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
    )));
  }
}
