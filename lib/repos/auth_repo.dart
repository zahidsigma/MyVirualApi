import 'package:dartz/dartz.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/services/app_preferences.dart';
import '../core/error/failure.dart';
import '../datasource/auth_datasource.dart';

class AuthRepository {
  AuthRepository({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  final AuthDataSource _authDataSource;

  Future<Either<Failure, Map<String, dynamic>>> createUser({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _authDataSource.createUser(
        data: data,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Login>> login({
    required String username,
    required String password,
  }) async {
    try {
      var res =
          await _authDataSource.login(username: username, password: password);

      ///Store user model
      AppPreferences.setLoginData(res);

      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Login>> verifyOTP({
    required String otp,
  }) async {
    try {
      var res = await _authDataSource.verifyOTP(
        otp: otp,
      );

      ///Store user model
      AppPreferences.setLoginData(res);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Login>> verifyResetOTP({
    required String otp,
  }) async {
    try {
      var res = await _authDataSource.verifyResetOTP(
        otp: otp,
      );

      ///Store user model
      AppPreferences.setLoginData(res);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> forgotPassword({
    required String username,
  }) async {
    try {
      var res = await _authDataSource.forgotPassword(
        username: username,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> resetPassword({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _authDataSource.resetPassword(
        data: data,
      );
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }
}
