import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../../../core/error/failure.dart';

class MedicationController extends GetxController {
  MedicationController();
  RxBool isBusy = false.obs;
  final _miscRepo = Get.find<MiscRepository>();
  RxList<Map<String, dynamic>> dataList = RxList();

  @override
  void onInit() {
    super.onInit();
    getMedications();
  }

  getMedications() async {
    isBusy.value = true;

    var result = await _miscRepo.getMedications();
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.MedicationScreen,
        logMethodName: 'getMedications',
        message: (failure).errorMessage.toString(),
      );
    }, (r) {
      dataList.value = r;
    });
  }
}
