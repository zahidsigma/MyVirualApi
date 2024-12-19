import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/user_repo.dart';
// import 'package:virualapi/ui/appointment/appointment_controller.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../../../core/error/failure.dart';

class ChildrenController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final _userRepo = Get.find<UserRepository>();

  RxBool isBusy = false.obs;

  handleSubmit() {
    bool isValid = formKey.currentState!.saveAndValidate();
    if (isValid) {
      var values = formKey.currentState!.value;
      var payload = {
        "familyMembers": {
          values["name"].replaceAll(' ', '').toLowerCase(): {
            "name": values['name'],
            "status": "",
            "gender": values['gender'],
            "relation": values['gender'] == 'Male' ? "Son" : 'Daughter',
            "dob": values['dob'].millisecondsSinceEpoch
          }
        },
      };
      _addChild(payload);
    }
  }

  _addChild(data) async {
    isBusy.value = true;

    var result = await _userRepo.updateUserExt(data: data);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.addChild,
        logMethodName: 'fetchSlots',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      // var apptCtrl = Get.find<AppointmentController>();
      // apptCtrl.fetchUserExt();
      Get.back();
    });
  }
}
