import 'package:dio/dio.dart';
import 'package:virualapi/models/doctor.dart';
import 'package:virualapi/models/specialties.dart';

import '../constants/enums.dart';
import '../models/doctor_specialty.dart';
import '../models/specialties_doctors.dart';
import '../services/api_service.dart';
import '../utils/api_url_utils.dart';
import '../core/error/failure.dart';

abstract class DoctorDataSource {
  Future<List<SpecialtiesDoctors>> getAllDoctors();
  Future<List<Specialties>> getSpecialties();
  Future<List<DoctorSpecialty>> getDoctorsBySpecialty(
      {required String specialty, required int pageSize, required int pageNo});
  Future<Doctor> getDoctorDetails(String email);
  Future<List<Doctors>> searchDoctor(String keywords, String gender);
  Future<Map<String, dynamic>> getAvailableSlots(String username, String date);
}

class DoctorDataSourceImpl extends DoctorDataSource {
  final Dio dio = getDio();

  @override
  Future<List<SpecialtiesDoctors>> getAllDoctors() async {
    try {
      var res = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.allDoctors),
      );
      return res.data
          .map((item) =>
              SpecialtiesDoctors.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Doctor> getDoctorDetails(String email) async {
    try {
      var res = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.doctorDetails)}/$email",
      );
      return Doctor.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<DoctorSpecialty>> getDoctorsBySpecialty(
      {required String specialty, int pageSize = 20, int pageNo = 1}) async {
    try {
      var res = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.doctorBySpecialty)}?specialty=$specialty",
      );
      return (res.data as List<dynamic>)
          .map((item) => DoctorSpecialty.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Specialties>> getSpecialties() async {
    try {
      var res = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.specialties),
      );
      List<Specialties> specialties = (res.data as List<dynamic>)
          .map((item) => Specialties.fromJson(item as Map<String, dynamic>))
          .toList();
      return specialties;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Doctors>> searchDoctor(String keywords, String gender) async {
    try {
      var res = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.searchDoctors)}?keywords=${keywords}&gender=${gender}",
      );
      print(res.data);
      return (res.data as List<dynamic>)
          .map((item) => Doctors.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getAvailableSlots(
      String username, String date) async {
    try {
      var res = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.availableSlots)}/$username/slots?date=$date",
      );
      return (res.data as Map).containsKey("available_slots")
          ? {
              ...res.data["available_slots"],
              "doctor_timezone": res.data['doctor_timezone']
            }
          : {};
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
