import 'package:dio/dio.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/models/contact_us.dart';
import 'package:virualapi/models/search_history.dart';
import 'package:virualapi/services/api_service.dart';
import 'package:virualapi/utils/api_url_utils.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/utils/util.dart';

abstract class MiscDataSource {
  Future<List<Map<String, dynamic>>> getMedications();
  Future<List<Map<String, dynamic>>> getLabReports();
  Future<List<Map<String, dynamic>>> getPayments();
  Future<SearchHistoryModel> getSearchHistory();
  Future<ContactMessage> contactUs({
    required String name,
    required String email,
    required String phone,
    required String message,
  });

  Future<List<Map<String, dynamic>>> getPersonSearch({
    required int page,
    required int size,
  });
}

class MiscDataSourceImpl extends MiscDataSource {
  final Dio dio = getDio();
  @override
  Future<List<Map<String, dynamic>>> getMedications() async {
    try {
      var response = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.medications),
      );
      return (response.data as List)
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getLabReports() async {
    try {
      var response = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.labReports)}?fromDate=${Util.getPastDate()}",
      );
      return (response.data as List)
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getPayments() async {
    try {
      var response = await dio.get(
        "${ApiUrlUtils.getApiUrl(UrlEndPointEnum.payments)}?fromDate=${Util.getPastDate(years: 3)}",
      );
      return (response.data as List)
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<SearchHistoryModel> getSearchHistory() async {
    try {
      final response = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.searchHistory),
      );

      // If response.data is a JSON object with keys: status, message, and data
      return SearchHistoryModel.fromJson(response.data);
    } catch (e) {
      throw Error.getError(e);
    }
  }

  @override
  Future<ContactMessage> contactUs({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    try {
      final response = await dio.post(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.contactUs),
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "message": message,
        },
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        if (data['status'] == true) {
          return ContactMessage(
            message: data['message'] ?? 'Submitted successfully',
          );
        } else {
          throw Error(errorMessage: data['message'] ?? 'Failed to send');
        }
      } else {
        throw Error(errorMessage: 'Unexpected response format');
      }
    } catch (e) {
      throw Error.getError(e);
    }
  }

//   Future<List<Map<String, dynamic>>> getPersonSearch() async {
//     try {
//       var response = await dio.get(
//         ApiUrlUtils.getApiUrl(UrlEndPointEnum.personSearch),
//       );
//       return (response.data as List)
//           .map((dynamic item) => item as Map<String, dynamic>)
//           .toList();
//     } catch (e) {
//       throw Error.getError(e);
//     }
//   }
// }
  @override
  Future<List<Map<String, dynamic>>> getPersonSearch({
    required int page,
    required int size,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'size': size,
      };

      final response = await dio.get(
        ApiUrlUtils.getApiUrl(UrlEndPointEnum.personSearch),
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((dynamic item) => item as Map<String, dynamic>)
            .toList();
      } else {
        throw Error.getError('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
