import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/snackbar_util.dart';

import '../../services/app_preferences.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../../../core/error/failure.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isBusy = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  _onSave() {
    if (_formKey.currentState != null &&
        _formKey.currentState!.saveAndValidate()) {
      final formData = {
        ..._formKey.currentState!.value,
      };
      var forgotPasswordCtrl = Get.find<ForgotPassController>();
      formData["username"] =
          forgotPasswordCtrl.formKey.currentState!.value["username"];
      resetPassword(formData);
    }
  }

  resetPassword(formData) async {
    setState(() {
      isBusy = true;
    });
    var auhRepo = Get.find<AuthRepository>();
    var result = await auhRepo.resetPassword(data: formData);
    setState(() {
      isBusy = false;
    });

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.resetPassword,
        logMethodName: 'resetPassword',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      SnackbarUtil.info(message: "Your password has been reset", isInfo: false);
      Get.offNamedUntil(Routers.login, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.1, vertical: 10),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getScreenHeight(context) * 0.1,
                ),
                Text("Reset Password",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("Create a new password"),
                SizedBox(
                  height: 80,
                ),
                AppTextField(
                  title: "New Password",
                  placeholder: "New Password",
                  name: "password",
                  obsecureText: hidePassword,
                  icon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                      ;
                    },
                  ),
                  validator: FormBuilderValidators.compose(([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ])),
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  title: "Confirm Password",
                  placeholder: "ConfirmPassword",
                  name: "verifyPassword",
                  onCompleted: _onSave,
                  obsecureText: hideConfirmPassword,
                  icon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                      ;
                    },
                  ),
                  validator: FormBuilderValidators.compose(([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ])),
                ),
                SizedBox(
                  height: 40,
                ),
                Button(
                  height: 55,
                  isLoading: isBusy,
                  title: "UPDATE PASSWORD",
                  onPressed: _onSave,
                  backgroundColor: Color(0xFFEB8F07),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
