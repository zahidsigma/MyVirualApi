import 'dart:io';
import 'package:dio/dio.dart';
import '../constants/enums.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../utils/api_url_utils.dart';
import '../core/error/failure.dart';

abstract class UserDataSource {
  Future<User> fetchUserDetail();
  Future<void> logout();
  Future<void> updateUser(Map<String, dynamic> data);
  Future<void> updateUserExt(Map<String, dynamic> data);
  Future<void> uploadImage(File file, String fileType);
  Future<Map<String, dynamic>> fetchUserExtras();
  Future<void> registerFCM({required String deviceType, required String token});
}

class UserDataSourceImpl extends UserDataSource {
  final Dio dio = getDio();

  @override
  Future<void> logout() async {
    try {
      await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.logout),
      );

      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<User> fetchUserDetail() async {
    try {
      var res = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.fetchUserProfile),
      );
      return User.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<void> updateUser(Map<String, dynamic> data) async {
    try {
      await dio.put(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.updateUser),
        data: data,
      );
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<void> updateUserExt(Map<String, dynamic> data) async {
    try {
      await dio.put(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.updateUserExt),
        data: data,
      );
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<void> uploadImage(File file, String fileType) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "fileRef": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      await dio.post(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.uploadImage)}?fileType=${fileType}",
        data: formData,
      );
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> fetchUserExtras() async {
    try {
      var res = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.userExtras),
      );
      return res.data as Map<String, dynamic>;
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<void> registerFCM(
      {required String deviceType, required String token}) async {
    try {
      await dio.post(ApiUrlUtils.getApiUrl(UrlEndPointEnum.registerDeviceFCM),
          queryParameters: {"deviceType": deviceType, "regid": token});
      return Future.value();
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
