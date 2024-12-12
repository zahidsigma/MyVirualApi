import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/doctor.dart';
import 'package:virualapi/repos/doctor_repo.dart';
import 'package:virualapi/core/error/failure.dart';
import '../../../utils/snackbar_util.dart';

class DoctorDetailsController extends GetxController {
  DoctorDetailsController({required DoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository;
  DoctorRepository _doctorRepository;

  RxBool isBusy = false.obs;
  Rx<Doctor> doctor = Rx(Doctor());

  @override
  void onInit() {
    super.onInit();
    fetchDoctor(Get.parameters["email"]);
  }

  fetchDoctor(email) async {
    isBusy.value = true;
    doctor.value = Doctor();

    var result = await _doctorRepository.getDoctorDetails(email: email);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.doctors,
        logMethodName: 'fetchDoctors',
        message: (failure).errorMessage.toString(),
      );
    }, (r) async {
      doctor.value = r;
    });
  }
}
