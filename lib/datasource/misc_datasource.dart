import 'package:dio/dio.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/services/api_service.dart';
import 'package:virualapi/utils/api_url_utils.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/utils/util.dart';

abstract class MiscDataSource {
  Future<List<Map<String, dynamic>>> getMedications();
  Future<List<Map<String, dynamic>>> getLabReports();
  Future<List<Map<String, dynamic>>> getPayments();
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
}
