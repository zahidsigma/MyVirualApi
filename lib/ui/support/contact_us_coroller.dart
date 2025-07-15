// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/misc_repo.dart';
// import 'package:virualapi/utils/snackbar_util.dart';

// class ContactUsController extends GetxController {
//   final MiscRepository _miscRepository;

//   ContactUsController({required MiscRepository miscRepository})
//       : _miscRepository = miscRepository;
//   final formKey = GlobalKey<FormBuilderState>();

//   RxBool isBusy = false.obs;
//   final RxString successMessage = ''.obs;
//   final RxString errorMessage = ''.obs;
//   RxBool formSubmittedSuccessfully = false.obs;

//   /// Called when user taps the "Send Message" button
//   // Future<void> contact() async {
//   //   if (formKey.currentState != null &&
//   //       formKey.currentState!.saveAndValidate()) {
//   //     final formData = formKey.currentState!.value;

//   //     await sendContactMessage(
//   //       name: formData["name"],
//   //       email: formData["email"],
//   //       phone: formData["phone"],
//   //       message: formData["message"],
//   //     );
//   //   } else {
//   //     errorMessage.value = 'Please fill all required fields';
//   //   }
//   // }

//   @override
//   void onInit() {
//     super.onInit();
//     formSubmittedSuccessfully.value = false; // Reset on controller init
//   }

//   void contacUS() {
//     if (formKey.currentState != null &&
//         formKey.currentState!.saveAndValidate()) {
//       final formData = formKey.currentState!.value;
//       print('Send Message pressed');
//       sendContactMessage(
//         name: formData["name"],
//         email: formData["email"],
//         phone: formData["phone"],
//         message: formData["message"],
//       );
//     }
//   }

//   /// Makes the API call to send the contact message
//   Future<void> sendContactMessage({
//     required String name,
//     required String email,
//     required String phone,
//     required String message,
//   }) async {
//     isBusy.value = true;
//     errorMessage.value = '';
//     successMessage.value = '';

//     print('Sending contact message...'); // <-- Add this
//     print(
//         'Name: $name, Email: $email, Phone: $phone, Message: $message'); // Debug log

//     try {
//       final result = await _miscRepository.contact(
//         name: name,
//         email: email,
//         phone: phone,
//         message: message,
//       );

//       result.fold(
//         (failure) {
//           print('API failed: ${failure.errorMessage}');
//           errorMessage.value = failure.errorMessage ?? 'Something went wrong.';
//           successMessage.value = '';
//         },
//         (contactMessage) {
//           print('Message sent successfully!');
//           SnackbarUtil.info(message: contactMessage.message);
//           formSubmittedSuccessfully.value =
//               true; // successMessage.value = 'Your message has been sent!';
//           errorMessage.value = '';
//           successMessage.value = '';
//           formKey.currentState?.reset();
//         },
//       );
//     } catch (error) {
//       print('Caught error: $error');
//       errorMessage.value = error.toString();
//       successMessage.value = '';
//     } finally {
//       isBusy.value = false;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/utils/snackbar_util.dart';

class ContactUsController extends GetxController {
  final MiscRepository _miscRepository;

  ContactUsController({required MiscRepository miscRepository})
      : _miscRepository = miscRepository;

  final formKey = GlobalKey<FormBuilderState>();

  RxBool isBusy = false.obs;
  RxBool showForm = true.obs;

  final RxString successMessage = ''.obs;
  final RxString errorMessage = ''.obs;

  void contacUS() {
    if (formKey.currentState != null &&
        formKey.currentState!.saveAndValidate()) {
      final formData = formKey.currentState!.value;
      sendContactMessage(
        name: formData["name"],
        email: formData["email"],
        phone: formData["phone"],
        message: formData["message"],
      );
    }
  }

  Future<void> sendContactMessage({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    isBusy.value = true;
    errorMessage.value = '';
    successMessage.value = '';

    try {
      final result = await _miscRepository.contact(
        name: name,
        email: email,
        phone: phone,
        message: message,
      );

      result.fold(
        (failure) {
          errorMessage.value = failure.errorMessage ?? 'Something went wrong.';
        },
        (contactMessage) {
          successMessage.value = contactMessage.message;
          showForm.value = false;
          formKey.currentState?.reset();
          SnackbarUtil.info(message: contactMessage.message);
        },
      );
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isBusy.value = false;
    }
  }

  void resetForm() {
    showForm.value = true;
    successMessage.value = '';
    errorMessage.value = '';
  }
}
