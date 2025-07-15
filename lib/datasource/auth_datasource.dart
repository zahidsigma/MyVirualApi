import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:virualapi/models/login.dart';
import '../constants/enums.dart';
import '../services/app_preferences.dart';
import '../utils/api_url_utils.dart';
import '../core/error/failure.dart';

abstract class AuthDataSource {
  Future<Map<String, dynamic>> createUser({required Map<String, dynamic> data});
  Future<Login> login({required String email, required String password});
  // Future<Login> verifyOTP({required String otp, required String email});
  Future<bool> verifyOTP({required String otp, required String email});

  Future<Map<String, dynamic>> forgotPassword({required String email});
  Future<Login> verifyResetOTP({required String otp});
  Future<Map<String, dynamic>> resetPassword(
      {required Map<String, dynamic> data});
}

class AuthDataSourceImpl extends AuthDataSource {
  final Dio dio = Dio();

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
    required String email,
    required String password,
  }) async {
    try {
      var res = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.login),
        data: {"email": email, "password": password},
      );

      // If the response is a String (maybe an error message)
      if (res.data is String) {
        print("Received String: ${res.data}");
        // Handle the string case or return a custom error message
        throw Error(errorMessage: res.data);
      }

      // If the response is a Map<String, dynamic>, proceed with parsing
      if (res.data is Map<String, dynamic>) {
        return Login.fromJson(res.data);
      } else {
        throw Error(errorMessage: 'Unexpected response format');
      }
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  // Future<Login> verifyOTP({required String otp}) async {
  //   try {
  //     var res = await dio.put(
  //       "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.verifyOtp)}/$otp",
  //     );
  //     return Login.fromJson(res.data as Map<String, dynamic>);
  //   } catch (e) {
  //     throw Error.getError(e);
  //   }
  // }

  // Future<Login> verifyOTP({required String email, required String otp}) async {
  //   try {
  //     var res = await dio.put(
  //       ApiUrlUtils.getApiUrl(UrlEndPointEnum.verifyOtp),
  //       data: {
  //         'email': email,
  //         'otp': otp,
  //       },
  //     );

  //     return Login.fromJson(res.data as Map<String, dynamic>);
  //   } catch (e) {
  //     throw Error.getError(e);
  //   }
  // }
// Make sure this is imported

  @override
  Future<bool> verifyOTP({
    required String otp,
    required String email,
  }) async {
    try {
      // Make the PUT request to verify OTP
      final res = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.verifyOtp),
        data: {
          "otp": otp,
          "email": email,
        },
      );

      // Check HTTP status code first
      if (res.statusCode != 200) {
        throw Exception('Request failed with status: ${res.statusCode}');
      }

      dynamic responseBody = res.data;
      print('OTP Verification Response: $responseBody'); // Debug logging

      // If the response is a string (JSON string), decode it
      if (responseBody is String) {
        try {
          responseBody = jsonDecode(responseBody);
        } catch (e) {
          throw Exception('Failed to parse JSON response: $e');
        }
      }

      // Ensure the responseBody is a Map<String, dynamic>
      if (responseBody is! Map<String, dynamic>) {
        throw Exception(
            'Unexpected response format: ${responseBody.runtimeType}');
      }

      // Check if the 'status' field is true
      if (responseBody['status'] == true) {
        return true; // OTP verified successfully
      } else {
        final msg = responseBody['message'] ?? 'OTP verification failed';
        throw Exception(msg);
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      // Handle other exceptions
      throw Error.getError(e);
    }
  }

  @override
  // Future<Map<String, dynamic>> forgotPassword(
  //     {required String username}) async {
  //   try {
  //     var res = await dio.post(
  //       ApiUrlUtils.getApiUrl(UrlEndPointEnum.forgotPassword),
  //       data: {"username": username, "deviceId": AppPreferences.getFCMToken()},
  //     );
  //     return res.data as Map<String, dynamic>;
  //   } catch (e) {
  //     throw Error.getError(e);
  //   }
  // }

  Future<Map<String, dynamic>> forgotPassword({required String email}) async {
    try {
      final res = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.forgotPassword),
        data: {
          "email": email,
          // "deviceId": await AppPreferences.getFCMToken(), // Uncomment if needed
        },
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      final responseData = res.data as Map<String, dynamic>;

      if (responseData['status'] == true) {
        return responseData;
      } else {
        throw Exception(responseData['message'] ?? 'Forgot password failed');
      }
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
      var res = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.resetPassword),
        data: data,
      );
      return res.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
