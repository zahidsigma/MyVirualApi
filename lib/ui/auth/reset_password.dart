// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/auth_repo.dart';
// import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/utils/snackbar_util.dart';

// import '../../services/app_preferences.dart';
// import '../../widgets/button.dart';
// import '../../widgets/text_field.dart';
// import '../../../core/error/failure.dart';

// class ResetPassword extends StatefulWidget {
//   const ResetPassword({super.key});

//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }

// class _ResetPasswordState extends State<ResetPassword> {
//   final _formKey = GlobalKey<FormBuilderState>();
//   bool isBusy = false;
//   bool hidePassword = true;
//   bool hideConfirmPassword = true;

//   _onSave() {
//     if (_formKey.currentState != null &&
//         _formKey.currentState!.saveAndValidate()) {
//       final formData = {
//         ..._formKey.currentState!.value,
//       };
//       var forgotPasswordCtrl = Get.find<ForgotPassController>();
//       formData["username"] =
//           forgotPasswordCtrl.formKey.currentState!.value["username"];
//       resetPassword(formData);
//     }
//   }

//   resetPassword(formData) async {
//     setState(() {
//       isBusy = true;
//     });
//     var auhRepo = Get.find<AuthRepository>();
//     var result = await auhRepo.resetPassword(data: formData);
//     setState(() {
//       isBusy = false;
//     });

//     result.fold((failure) {
//       SnackbarUtil.error(
//         logMessage: (failure as Error).errorMessage.toString(),
//         logScreenName: Routers.resetPassword,
//         logMethodName: 'resetPassword',
//         message: (failure).errorMessage.toString(),
//       );
//     }, (r) {
//       SnackbarUtil.info(message: "Your password has been reset", isInfo: false);
//       Get.offNamedUntil(Routers.login, (route) => false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: getScreenWidth(context) * 0.1, vertical: 10),
//         child: FormBuilder(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: getScreenHeight(context) * 0.1,
//                 ),
//                 Text("Reset Password",
//                     style: Theme.of(context).textTheme.titleLarge),
//                 Text("Create a new password"),
//                 SizedBox(
//                   height: 80,
//                 ),
//                 AppTextField(
//                   title: "New Password",
//                   placeholder: "New Password",
//                   name: "password",
//                   obsecureText: hidePassword,
//                   icon: IconButton(
//                     icon: Icon(Icons.remove_red_eye),
//                     onPressed: () {
//                       setState(() {
//                         hidePassword = !hidePassword;
//                       });
//                       ;
//                     },
//                   ),
//                   validator: FormBuilderValidators.compose(([
//                     FormBuilderValidators.required(),
//                     FormBuilderValidators.minLength(6),
//                   ])),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 AppTextField(
//                   title: "Confirm Password",
//                   placeholder: "ConfirmPassword",
//                   name: "verifyPassword",
//                   onCompleted: _onSave,
//                   obsecureText: hideConfirmPassword,
//                   icon: IconButton(
//                     icon: Icon(Icons.remove_red_eye),
//                     onPressed: () {
//                       setState(() {
//                         hideConfirmPassword = !hideConfirmPassword;
//                       });
//                       ;
//                     },
//                   ),
//                   validator: FormBuilderValidators.compose(([
//                     FormBuilderValidators.required(),
//                     FormBuilderValidators.minLength(6),
//                   ])),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Button(
//                   height: 55,
//                   isLoading: isBusy,
//                   title: "UPDATE PASSWORD",
//                   onPressed: _onSave,
//                   backgroundColor: Color(0xFFEB8F07),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/ui/auth/forgotPassword/forgot_password_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/widgets/body_with_header.dart';

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
  final _formKey = GlobalKey<FormBuilderState>(debugLabel: "ResetPasswordForm");

  bool isBusy = false;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // Add these to store received arguments
  late String email;
  late String otp;

  @override
  void initState() {
    super.initState();
    // Get arguments when widget initializes
    final args = Get.arguments;
    if (args != null) {
      email = args['email'] ?? '';
      otp = args['otp'] ?? '';
    }
  }

  // _onSave() {
  //   if (_formKey.currentState != null &&
  //       _formKey.currentState!.saveAndValidate()) {
  //     final formData = {
  //       ..._formKey.currentState!.value,
  //       'email': email, // Include the email from arguments
  //       'otp': otp, // Include the OTP from arguments
  //     };

  //     // Remove this if not needed - you're already getting email from arguments
  //     // var forgotPasswordCtrl = Get.find<ForgotPassController>();
  //     // formData["username"] = forgotPasswordCtrl.formKey.currentState!.value["username"];

  //     resetPassword(formData);
  //   }
  // }

  // resetPassword(formData) async {
  //   // First validate that passwords match
  //   if (formData['password'] != formData['verifyPassword']) {
  //     SnackbarUtil.error(message: "Passwords do not match");
  //     return;
  //   }

  //   setState(() => isBusy = true);

  //   try {
  //     var authRepo = Get.find<AuthRepository>();
  //     var result = await authRepo.resetPassword(data: formData);

  //     result.fold((failure) {
  //       SnackbarUtil.error(
  //         logMessage: failure.errorMessage.toString(),
  //         logScreenName: Routers.resetPassword,
  //         logMethodName: 'resetPassword',
  //         message: failure.errorMessage.toString(),
  //       );
  //     }, (r) {
  //       SnackbarUtil.info(
  //           message: "Your password has been reset", isInfo: false);
  //       Get.offNamedUntil(Routers.login, (route) => false);
  //     });
  //   } finally {
  //     setState(() => isBusy = false);
  //   }
  // }

  _onSave() {
    if (_formKey.currentState != null &&
        _formKey.currentState!.saveAndValidate()) {
      final formValues = _formKey.currentState!.value;

      // First validate passwords match
      if (formValues['password'] != formValues['verifyPassword']) {
        SnackbarUtil.error(message: "Passwords do not match");
        return;
      }

      final formData = {
        'email': email, // From Get.arguments
        'otp': otp, // From Get.arguments
        'password': formValues['password'],
        'password_confirmation': formValues['verifyPassword'],
      };

      resetPassword(formData);
    }
  }

  resetPassword(Map<String, dynamic> formData) async {
    setState(() => isBusy = true);

    try {
      final authRepo = Get.find<AuthRepository>();
      final result = await authRepo.resetPassword(data: formData);

      result.fold(
        (failure) {
          SnackbarUtil.error(
            message: failure.errorMessage.toString(),
            logMessage: "Reset password failed: ${failure.errorMessage}",
            logScreenName: Routers.resetPassword,
            logMethodName: 'resetPassword',
          );
        },
        (success) {
          SnackbarUtil.info(message: "Password reset successfully!");
          Get.offAllNamed(Routers.login);
        },
      );
    } finally {
      setState(() => isBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      islogovisible: true,
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
                  SizedBox(height: getScreenHeight(context) * 0.1),
                  Text("Reset Password",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("Create a new password for $email"), // Show the email
                  SizedBox(height: 80),

                  AppTextField(
                    title: "New Password",
                    placeholder: "New Password",
                    name: "password",
                    rectangleborder: true,
                    obsecureText: hidePassword,
                    icon: IconButton(
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () =>
                          setState(() => hidePassword = !hidePassword),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                      // Add more complex password validation if needed
                    ]),
                  ),

                  SizedBox(height: 20),

                  AppTextField(
                    title: "Confirm Password",
                    placeholder: "Confirm Password",
                    rectangleborder: true,
                    name: "verifyPassword",
                    onCompleted: _onSave,
                    obsecureText: hideConfirmPassword,
                    icon: IconButton(
                      icon: Icon(hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () => setState(
                          () => hideConfirmPassword = !hideConfirmPassword),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),

                  SizedBox(height: 40),

                  Button(
                    height: 55,
                    isLoading: isBusy,
                    title: "RESET PASSWORD",
                    onPressed: _onSave,
                    backgroundColor: DARK_BG_COLOR,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Back to log in",
                        style: TextStyle(color: Colors.grey),
                      ),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
