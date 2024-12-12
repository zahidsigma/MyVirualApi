import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/datasource/appointment_datasource.dart';
import 'package:virualapi/models/doctor.dart';
import 'package:virualapi/models/doctor_specialty.dart';
import 'package:virualapi/models/telemed_session.dart';

class AppointmentRepository {
  final _appointmentDataSource = Get.find<AppointmentDataSource>();

  Future<Either<Failure, void>> createInstantVisit({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _appointmentDataSource.createInstantVisit(
        data: data,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<TelemedSession>>> getTelemedSession(
      String username,
      {String? from}) async {
    try {
      var res =
          await _appointmentDataSource.getTelemedSessions(username, from: from);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> createAppointment({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _appointmentDataSource.createAppointment(
        data: data,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> saveSession({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _appointmentDataSource.saveSessionFeedback(
        data: data,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> updateSession({
    required String sessionId,
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _appointmentDataSource.updateSession(
        sessionId: sessionId,
        data: data,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> validateCoupon({
    required String coupon,
  }) async {
    try {
      var res = await _appointmentDataSource.validateCoupon(
        coupon: coupon,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>>
      getRecentConsultations() async {
    try {
      var res = await _appointmentDataSource.getRecentConsultations();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getSessionNote(
      {required String sessionId}) async {
    try {
      var res = await _appointmentDataSource.getSessionNotes(
        sessionId,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getAppointments(
      String userId, String from) async {
    try {
      var res = await _appointmentDataSource.getAppointments(userId, from);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> cancelAppt(String id) async {
    try {
      var res = await _appointmentDataSource.cancelAppt(id);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
