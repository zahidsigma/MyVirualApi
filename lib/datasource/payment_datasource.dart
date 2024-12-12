import 'package:dio/dio.dart';
import 'package:virualapi/constants/enums.dart';
import 'package:virualapi/services/api_service.dart';
import 'package:virualapi/utils/api_url_utils.dart';
import '../core/error/failure.dart';

abstract class PaymentDataSource {
  Future<String> makeAbhipayPayment(Map<String, dynamic> data);
}

class PaymentDataSourceImpl extends PaymentDataSource {
  final Dio dio = getDio();
  @override
  Future<String> makeAbhipayPayment(Map<String, dynamic> data) async {
    try {
      var res = await dio.post(
          ApiUrlUtils.getApiUrl(UrlEndPointEnum.abhipayPayment),
          data: data);
      return (res.data as Map<String, dynamic>)['payment_url'];
    } catch (e) {
      throw Error.getError(e);
    }
  }
}
