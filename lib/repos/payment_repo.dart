import 'package:dartz/dartz.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/datasource/payment_datasource.dart';

class PaymentRepository {
  PaymentRepository({required PaymentDataSource paymentDataSource})
      : _paymentDataSource = paymentDataSource;
  final PaymentDataSource _paymentDataSource;

  Future<Either<Failure, String>> makeAbhipayPayment(
      Map<String, dynamic> data) async {
    try {
      var res = await _paymentDataSource.makeAbhipayPayment(data);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
