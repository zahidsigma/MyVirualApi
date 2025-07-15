import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import '../../../widgets/button.dart';
import '../../../widgets/text_field.dart';

class ForgotScreen extends GetView<ForgotPassController> {
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
                key: controller.formKey4,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenHeight(context) * 0.1,
                      ),
                      Text("Forgot Password",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("Enter your email"),
                      SizedBox(
                        height: 80,
                      ),
                      AppTextField(
                        title: "",
                        placeholder: "Enter Email",
                        name: "email",
                        rectangleborder: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Button(
                        height: 55,
                        isLoading: controller.isBusy.value,
                        width: getScreenWidth(context) / 1.1,
                        title: "SUBMIT",
                        onPressed: () {
                          if (controller.formKey4.currentState!
                              .saveAndValidate()) {
                            var email = controller
                                .formKey4.currentState!.value["email"];
                            if (Util.isEmailValid(email)) {
                              controller.forgotPassword(email);
                            } else {
                              SnackbarUtil.info(
                                  message: "Invalid Email/Phone number");
                            }
                          }
                        },
                        backgroundColor: DARK_BG_COLOR,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: Get.back,
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black38),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
