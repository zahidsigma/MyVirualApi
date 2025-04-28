import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:virualapi/models/login.dart';

import '../constants/enums.dart';
import '../services/api_service.dart';
import '../services/app_preferences.dart';
import '../utils/api_url_utils.dart';
import '../core/error/failure.dart';

abstract class AuthDataSource {
  Future<Map<String, dynamic>> createUser({required Map<String, dynamic> data});

  Future<Login> login({
    required String username,
    required String password,
  });

  Future<Login> verifyOTP({
    required String otp,
  });

  Future<Map<String, dynamic>> forgotPassword({
    required String username,
  });
  Future<Login> verifyResetOTP({
    required String otp,
  });

  Future<Map<String, dynamic>> resetPassword({
    required Map<String, dynamic> data,
  });
}

class AuthDataSourceImpl extends AuthDataSource {
  final Dio dio = getDio();

  @override
  Future<Map<String, dynamic>> createUser(
      {required Map<String, dynamic> data}) async {
    try {
      var res = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.createUser),
        data: data,
      );
      return res.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Login> login({
    required String username,
    required String password,
  }) async {
    try {
      var res = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.login),
        data: {
          "username": username,
          "password": password,
        },
      );
      return Login.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Login> verifyOTP({required String otp}) async {
    try {
      var res = await dio.put(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.verifyOtp)}/$otp",
      );
      return Login.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(
      {required String username}) async {
    try {
      var res = await dio.post(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.forgotPassword)}",
        data: {"username": username, "deviceId": AppPreferences.getFCMToken()},
      );
      return res.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Login> verifyResetOTP({required String otp}) async {
    try {
      var res = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.verifyResetOtp, id: otp),
      );
      return Login.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword(
      {required Map<String, dynamic> data}) async {
    try {
      var res = await dio.put(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.resetPassword),
        data: data,
      );
      return res.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
