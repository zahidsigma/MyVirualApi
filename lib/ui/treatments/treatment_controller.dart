import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/models/telemed_session.dart';
import 'package:virualapi/repos/appointment_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/utils/util.dart';
import '../../../core/error/failure.dart';

class TreatmentController extends GetxController {
  RxBool isBusy = false.obs;
  final _apptRepo = Get.find<AppointmentRepository>();
  RxList<TelemedSession> dataList = RxList();
  RxList<Map<String, dynamic>> sessionNotes = RxList();

  @override
  void onInit() {
    super.onInit();
    getTreatments();
  }

  getTreatments() async {
    final Login? _user = AppPreferences.getLoginData();
    if (_user == null) return;
    isBusy.value = true;

    var result = await _apptRepo.getTelemedSession(_user.userId!,
        from: Util.getPastDate(years: 1));
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.treatments,
        logMethodName: 'getTreatments',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      dataList.value = r;
    });
  }

  getSessionNotes(String sessionId) async {
    isBusy.value = true;
    var result = await _apptRepo.getSessionNote(sessionId: sessionId);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.treatments,
        logMethodName: 'getTreatments',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      sessionNotes.value = r;
    });
  }
}
