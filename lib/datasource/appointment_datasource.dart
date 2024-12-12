import 'package:dio/dio.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/models/telemed_session.dart';
import 'package:virualapi/services/api_service.dart';
import 'package:virualapi/utils/api_url_utils.dart';
import 'package:virualapi/core/error/failure.dart';

abstract class AppointmentDataSource {
  Future<void> createInstantVisit({required Map<String, dynamic> data});
  Future<List<TelemedSession>> getTelemedSessions(String username,
      {String? from});
  Future<void> createAppointment({required Map<String, dynamic> data});
  Future<Map<String, dynamic>> saveSessionFeedback(
      {required Map<String, dynamic> data});
  Future<Map<String, dynamic>> updateSession(
      {required String sessionId, required Map<String, dynamic> data});
  Future<Map<String, dynamic>> validateCoupon({required String coupon});
  Future<List<Map<String, dynamic>>> getRecentConsultations();
  Future<List<Map<String, dynamic>>> getSessionNotes(String sessionId);
  Future<List<Map<String, dynamic>>> getAppointments(
      String userId, String from);
  Future<void> cancelAppt(String id);
}

class AppointmentDataSourceImpl extends AppointmentDataSource {
  final Dio dio = getDio();
  @override
  Future<void> createInstantVisit({required Map<String, dynamic> data}) async {
    try {
      await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.createInstantVisit),
        data: data,
      );
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<TelemedSession>> getTelemedSessions(String username,
      {String? from}) async {
    try {
      var url =
          "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.getTelemedSessions)}/$username";
      if (from != null) url += "/?fromDate=$from";
      var res = await dio.get(
        url,
      );
      return (res.data as List).map((e) => TelemedSession.fromJson(e)).toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<void> createAppointment({required Map<String, dynamic> data}) async {
    try {
      await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.createAppointment),
        data: data,
      );
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> saveSessionFeedback(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.saveSession),
        data: data,
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> updateSession(
      {required String sessionId, required Map<String, dynamic> data}) async {
    try {
      var response = await dio.put(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.updateSession, id: sessionId)}",
        data: data,
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> validateCoupon({required String coupon}) async {
    try {
      var response = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.validateCoupon, id: coupon)}",
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getRecentConsultations() async {
    try {
      var res = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.recentConsultations)}",
      );
      print(res.data);
      return (res.data as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getSessionNotes(String sessionId) async {
    try {
      var res = await dio.get(
          ApiUrlUtils.getApiUrl(UrlEndPointEnum.getSessionNote, id: sessionId));
      return (res.data as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAppointments(
      String userId, String from) async {
    try {
      var res = await dio.get(
          "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.getAppointments, id: userId)}?fromDate=$from");
      return (res.data as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<void> cancelAppt(String id) async {
    try {
      await dio.put(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.cancelAppointment, id: id),
        data: {"status": 'CANCELLED'},
      );
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
