import 'package:get/get.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/models/doctor.dart';
import 'package:virualapi/models/doctor_specialty.dart';
import 'package:virualapi/ui/doctor/doctor_details/doctor_details_controller.dart';
import '../../../core/error/failure.dart';
import '../../repos/doctor_repo.dart';
import '../../utils/snackbar_util.dart';

class DoctorController extends GetxController {
  DoctorController({required DoctorRepository repository})
      : _doctorRepository = repository;
  DoctorRepository _doctorRepository;

  RxList<DoctorSpecialty> dataList =
      RxList<DoctorSpecialty>([new DoctorSpecialty(doctors: [])]);
  RxBool isBusy = false.obs;
  RxString specialty = RxString("");

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters.containsKey("name")) {
      specialty.value = Get.parameters["name"].toString();
      fetchDoctors(specialty.value);
    } else {
      var keywords = Get.parameters["keywords"];
      var gender = Get.parameters["gender"];
      specialty.value = keywords.toString();
      searchDoctors(keywords, gender);
    }
  }

  fetchDoctors(specialty) async {
    isBusy.value = true;
    dataList = RxList<DoctorSpecialty>([new DoctorSpecialty(doctors: [])]);

    var result =
        await _doctorRepository.getDoctorsBySpecialty(specialty: specialty);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.doctors,
        logMethodName: 'fetchDoctors',
        message: (failure).errorMessage.toString(),
      );
    }, (r) async {
      if (r.length > 0) {
        dataList.value = r;
        // for (int i = 0; i < r.length; i++) {
        //   var doctors = r[i].doctors;
        //   if (doctors == null || doctors.isEmpty) {
        //     break;
        //   }
        //   for (int j = 0; j < doctors.length; j++) var dr = doctors[j];
        //   fetchDoctor(dr.username, i, j);
        // }
      }
    });
  }

  searchDoctors(keywords, gender) async {
    isBusy.value = true;
    // dataList = RxList<DoctorSpecialty>([new DoctorSpecialty(doctors: [])]);

    var result = await _doctorRepository.searchDoctor(
        keywords: keywords, gender: gender);
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.doctors,
        logMethodName: 'searchDoctors',
        message: (failure).errorMessage.toString(),
      );
    }, (r) async {
      print("r $r");
      if (r.length > 0) {
        dataList.value = [new DoctorSpecialty(doctors: r)];
      }
    });
  }

  void showDoctorDetails(username) async {
    await Get.toNamed(Routers.doctorDetails, parameters: {"email": username});
    Get.delete<DoctorDetailsController>();
  }
}
