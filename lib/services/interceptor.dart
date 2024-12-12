import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:virualapi/constants/config.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:get/get.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/utils/context_less_nav.dart';

class ElTanvirInterceptors extends dio.Interceptor {
  @override
  Future<void> onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) async {
    //IF We are Making Back ground Request then we need This
    // try {
    //   await Hive.initFlutter();
    // } catch (e) {
    //   print(e);
    // }
    // authBox = await Hive.openBox(HiveConstants.authBox);
    // userBox = await Hive.openBox(HiveConstants.userBox);

    //Else this Block Because these box opens when app opens
    var authToken = AppPreferences.getAuthToken();

    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] =
          "${AppConfig.authTokenType} $authToken";
    }
    options.headers['Accept'] = "application/json";
    options.headers['accept'] = "application/json";

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      debugPrint('Got Response');
      // Get.offNamedUntil(Routers().currentRoute, (route) => false)

      // authBox!.clear();

      // ContextLess.nav.pushReplacementNamed(Routes.login);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(dio.DioException err, dio.ErrorInterceptorHandler handler) {
    // if (err.response?.statusCode == 401) {
    //   ContextLess.nav.pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => LoginScreen()), (_) => false);
    // }
    return super.onError(err, handler);
  }
}
