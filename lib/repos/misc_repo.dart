import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/datasource/misc_datasource.dart';

class MiscRepository {
  MiscRepository();
  var miscDataSource = Get.find<MiscDataSource>();

  Future<Either<Failure, List<Map<String, dynamic>>>> getMedications() async {
    try {
      var res = await miscDataSource.getMedications();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getLabReports() async {
    try {
      var res = await miscDataSource.getLabReports();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, List<Map<String, dynamic>>>> getPayments() async {
    try {
      var res = await miscDataSource.getPayments();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
