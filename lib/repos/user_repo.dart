import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:virualapi/datasource/user_datasource.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import '../core/error/failure.dart';
import '../models/user.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class UserRepository {
  UserRepository({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;
  final UserDataSource _userDataSource;

  Future<Either<Failure, User>> fetchUser() async {
    try {
      // Get the token
      String? token = AppPreferences.getAuthToken();

      print('Fetched token: $token'); // Debugging

      // if (token == null) {
      //   return Left(Error(errorMessage: 'Authentication token is missing.'));
      // }

      var res = await _userDataSource.fetchUserDetail();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> logout({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _userDataSource.logout();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> updateUser({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _userDataSource.updateUser(data);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> updateUserExt({
    required Map<String, dynamic> data,
  }) async {
    try {
      var res = await _userDataSource.updateUserExt(data);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, void>> uploadImage({
    required File file,
    required String fileType,
  }) async {
    try {
      var res = await _userDataSource.uploadImage(file, fileType);
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> fetchUserExt() async {
    try {
      var res = await _userDataSource.fetchUserExtras();
      return Right(res);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  Future<void> registerDeviceFCM(
      {required String deviceType, required String token}) async {
    try {
      return await _userDataSource.registerFCM(
          deviceType: deviceType, token: token);
    } catch (e) {
      SnackbarUtil.error(message: e.toString());
    }
  }
}
