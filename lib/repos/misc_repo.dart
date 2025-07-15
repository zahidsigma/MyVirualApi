import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:virualapi/core/error/failure.dart';
import 'package:virualapi/datasource/misc_datasource.dart';
import 'package:virualapi/models/contact_us.dart';
import 'package:virualapi/models/search_history.dart';

class MiscRepository {
  // Declare the final field with its explicit type
  final MiscDataSource miscDataSource;

  // Correct constructor syntax to initialize the final field
  // The 'this.' syntax directly assigns the parameter to the field
  MiscRepository({required this.miscDataSource});

  // Your methods remain the same, correctly using this.miscDataSource
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

  Future<Either<Failure, SearchHistoryModel>> getSearchHistory() async {
    try {
      final res = await miscDataSource
          .getSearchHistory(); // This calls your actual data source
      return Right(res); // Success: returns SearchHistoryModel
    } catch (e) {
      return Left(Error(
          errorMessage: e.toString())); // Failure: returns your Failure class
    }
  }

  Future<Either<Failure, ContactMessage>> contact({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    try {
      final res = await miscDataSource.contactUs(
        name: name,
        email: email,
        phone: phone,
        message: message,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getPersonSearch({
    int page = 1,
    int size = 30,
    required String searchTerm,
  }) async {
    try {
      // Fetch paginated data from the data source
      final res = await miscDataSource.getPersonSearch(page: page, size: size);

      // Validate the response
      if (res == null || res.isEmpty) {
        return Right({"page": page, "data": []});
      }

      return Right({
        "page": page,
        "data": res,
      });
    } on Exception catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
