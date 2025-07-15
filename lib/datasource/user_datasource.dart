import 'dart:io';
import 'package:dio/dio.dart';
import 'package:virualapi/services/app_preferences.dart';
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
  Future<void> updateUserwithProfile(Map<String, dynamic> data,
      {File? imageFile});
  Future<void> registerFCM({required String deviceType, required String token});
}

class UserDataSourceImpl extends UserDataSource {
  final Dio dio = getDio();
  String? _getAuthToken() {
    // Get token from shared preferences or wherever it's stored
    return AppPreferences.getAuthToken();
  }

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
    String? token = _getAuthToken();

    // Debug the token retrieval
    print('Fetched token: $token');

    if (token == null) {
      throw Exception('Authentication token is missing');
    }

    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      var response = await dio
          .get(ApiUrlUtils.getApiUrl(UrlEndPointEnum.fetchUserProfile));
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch user details: $e');
    }
  }

  // Similarly, add the token to the headers for other methods
  // Future<void> updateUser(Map<String, dynamic> data) async {
  //   String? token = _getAuthToken();
  //   if (token == null) {
  //     throw Exception('Authentication token is missing');
  //   }

  //   dio.options.headers['Authorization'] = 'Bearer $token';

  //   try {
  //     var response = await dio.post('https://example.com/api/update', data: data);
  //     return response.data;
  //   } catch (e) {
  //     throw Exception('Failed to update user: $e');
  //   }
  // }

  // Future<void> fetchData() async {
  //   try {
  //     // Dynamically set the token for this specific request

  //     var response = await dio.get('https://your-api-url.com/fetchData');
  //     print(response.data);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

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
  // Future<void> updateUserwithProfile(Map<String, dynamic> data,
  //     {File? imageFile}) async {
  //   try {
  //     // Retrieve token if required
  //     String? token = _getAuthToken();
  //     final formData = FormData.fromMap({
  //       ...data,
  //       if (imageFile != null)
  //         'image': await MultipartFile.fromFile(
  //           imageFile.path,
  //           filename: 'profile.jpg',
  //         ),
  //     });

  //     final response = await dio.post(
  //       ApiUrlUtils.getApiUrl(UrlEndPointEnum.updateUserWithProfile),
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //           'Content-Type': 'multipart/form-data',
  //         },
  //       ),
  //     );

  //     if (response.statusCode != 200) {
  //       throw Exception(
  //           'Failed to update user. Status code: ${response.statusCode}');
  //     }

  //     print("User updated successfully.");
  //   } catch (e) {
  //     print("Error updating user: $e");
  //     throw Exception("User update failed: $e");
  //   }
  // }
  @override
  Future<void> updateUserwithProfile(Map<String, dynamic> data,
      {File? imageFile}) async {
    try {
      // Retrieve token if required
      String? token = _getAuthToken();

      // If no token, handle the case, e.g., show an error or ask user to log in
      if (token == null) {
        throw Exception('Authorization token is missing. Please log in again.');
      }

      // Prepare the form data
      final formData = FormData.fromMap({
        ...data,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(
            imageFile.path,
            filename: 'profile.jpg',
          ),
      });

      // Perform the network request
      final response = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.updateUserWithProfile),
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        print("User updated successfully.");
      } else {
        throw Exception(
            'Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle and log error
      print("Error updating user: $e");
      throw Exception("User update failed: $e");
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

  // @override
  // Future<void> uploadImage(File file, String fileType) async {
  //   try {
  //     String fileName = file.path.split('/').last;
  //     FormData formData = FormData.fromMap({
  //       "fileRef": await MultipartFile.fromFile(file.path, filename: fileName),
  //     });
  //     await dio.post(
  //       "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.uploadImage)}?fileType=${fileType}",
  //       data: formData,
  //     );
  //     return Future.value();
  //   } catch (e) {
  //     throw Error.getError(e);
  //   }
  // }
  @override
  Future<void> uploadImage(File file, String fileType) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "fileRef": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      final res = await dio.post(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.updateprofilepic)}?fileType=$fileType",
        data: formData,
      );

      // Check if the response is a Map or a String
      if (res.data is Map<String, dynamic>) {
        print("Upload succeeded: ${res.data}");
        // Here you can extract the URL or other data from the response
        String imageUrl =
            res.data['imageUrl']; // Assuming 'imageUrl' is returned
        // Store or update the image URL as needed
      } else if (res.data is String) {
        print("Upload response (string): ${res.data}");
        // Handle the string response (possibly an error message)
      }

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
