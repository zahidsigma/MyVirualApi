import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/datasource/misc_datasource.dart';

class MiscRepository {
  MiscRepository({required miscDataSource});
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

  // Future<Either<Failure, List<Map<String, dynamic>>>> getPersonSearch() async {
  //   try {
  //     var res = await miscDataSource.getPersonSearch();
  //     return Right(res);
  //   } catch (e) {
  //     return Left(Error(errorMessage: e.toString()));
  //   }
  // }

  Future<Either<Failure, List<Map<String, dynamic>>>> getPersonSearch({
    int page = 1,
    int size = 10,
    required String searchTerm,
  }) async {
    try {
      // Fetch paginated data from the data source
      final res = await miscDataSource.getPersonSearch(page: page, size: size);

      // Validate the response
      if (res == null || res.isEmpty) {
        return const Right([]);
      }

      return Right(res);
    } on Exception catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
