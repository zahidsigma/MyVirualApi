import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/auth_repo.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/button.dart';
import '../../../core/error/failure.dart';
import '../../../utils/snackbar_util.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  final AuthRepository authRepo = Get.find();
  final textEditingController = TextEditingController();

  _verifyOTP(String pin) async {
    var params = Get.parameters;
    bool isForgotPassword =
        params.isNotEmpty && params.containsKey("isForgotPassword");
    var result = await (isForgotPassword
        ? authRepo.verifyResetOTP(otp: pin)
        : authRepo.verifyOTP(otp: pin));

    result.fold(
      (failure) {
        SnackbarUtil.error(
          logMessage: (failure as Error).errorMessage.toString(),
          logScreenName: Routers.otp,
          logMethodName: 'verifyOTP',
          message: (failure).errorMessage.toString(),
        );
      },
      (r) {
        SnackbarUtil.info(message: "Verified Successfully!", isInfo: false);
        if (isForgotPassword) {
          Get.toNamed(Routers.resetPassword);
        } else {
          Get.offNamed(Routers.profile);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 100),
              child: Image.asset("assets/images/email.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: textEditingController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    _verifyOTP(value);
                  }
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(counterText: ""),
                style: TextStyle(
                    letterSpacing: getScreenWidth(context) * 0.13,
                    fontSize: 22),
                onSubmitted: (val) => _verifyOTP(textEditingController.text),
              ),
            ),
            // OTPTextField(
            //     controller: otpController,
            //     length: 6,
            //     width: MediaQuery.of(context).size.width,
            //     textFieldAlignment: MainAxisAlignment.spaceAround,
            //     fieldWidth: 30.w,
            //     fieldStyle: FieldStyle.underline,
            //     outlineBorderRadius: 15,
            //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            //     onChanged: (pin) {
            //       print("Changed: " + pin);
            //     },
            //     onCompleted: (pin) async {
            //       print("Completed: " + pin);
            //       _verifyOTP(pin);
            //       // FirebaseAuth auth = FirebaseAuth.instance;
            //       // Create a PhoneAuthCredential with the code
            //       // PhoneAuthCredential credential = PhoneAuthProvider.credential(
            //       //     verificationId: params["verificationId"], smsCode: pin);

            //       // Sign the user in (or link) with the credential
            //       // await auth.signInWithCredential(credential).then((value) {
            //       //   auth.signOut();
            //       //   SnackbarUtil.info(
            //       //       message: "Phone number verified successfully");
            //       //   Future.delayed(Duration(milliseconds: 1500)).then((_) {
            //       //     Get.toNamed(Routers.signUp1);
            //       //   });
            //       // }).catchError((e) {
            //       //   SnackbarUtil.error(message: e.toString());
            //       // });
            //     }),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Enter Verification Code",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "You should get the OTP via WhatsApp.\nIt may take 1 to 2 minutes",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Button(
              height: 45,
              title: "VERIFY",
              onPressed: () => _verifyOTP(textEditingController.text),
              backgroundColor: Color(0xFFEB8F07),
            ),
          ],
        ),
      ),
    );
  }
}
