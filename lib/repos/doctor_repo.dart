import 'package:dartz/dartz.dart';
import 'package:virualapi/datasource/doctor_data_source.dart';
import '../core/error/failure.dart';
import '../models/doctor.dart';
import '../models/doctor_specialty.dart';
import '../models/specialties.dart';
import '../models/specialties_doctors.dart';

class DoctorRepository {
  DoctorRepository({required DoctorDataSource drDataSource})
      : _drDataSource = drDataSource;

  final DoctorDataSource _drDataSource;

  Future<Either<Failure, List<SpecialtiesDoctors>>> getAllDoctors() async {
    try {
      var res = await _drDataSource.getAllDoctors();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<DoctorSpecialty>>> getDoctorsBySpecialty(
      {required String specialty, int pageSize = 20, int pageNo = 1}) async {
    try {
      var res = await _drDataSource.getDoctorsBySpecialty(
          specialty: specialty, pageNo: pageNo, pageSize: pageSize);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Specialties>>> getSpecialties() async {
    try {
      var res = await _drDataSource.getSpecialties();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Doctor>> getDoctorDetails(
      {required String email}) async {
    try {
      var res = await _drDataSource.getDoctorDetails(email);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Doctors>>> searchDoctor(
      {required String keywords, required String gender}) async {
    try {
      var res = await _drDataSource.searchDoctor(keywords, gender);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getAvailableSlots(
      {required String username, required String date}) async {
    try {
      var res = await _drDataSource.getAvailableSlots(username, date);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
