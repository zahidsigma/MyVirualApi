import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:virualapi/services/interceptor.dart';

import '../constants/config.dart';

Dio getDio() {
  final Dio dio = Dio();

  //Basic Configuration
  dio.options.baseUrl = AppConfig.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  // _dio.options.headers = {'Content-Type': 'application/json'};
  dio.options.headers = {'Accept': 'application/json'};
  dio.options.headers = {'accept': 'application/json'};
  dio.options.headers = {
    'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305'
  };
  dio.options.headers = {
    'Galaxy-Search-Type': 'Person',
  };
  dio.options.headers = {'Content-Type': 'application/json'};
  dio.options.followRedirects = false;

  //for Logging the Request And response
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
  );

  //Intercepts all requests and adds the token to the header and Allows Global Logout
  dio.interceptors.add(ElTanvirInterceptors());

  return dio;
}
