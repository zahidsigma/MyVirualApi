// import 'package:dartz/dartz.dart';
// import 'package:virualapi/models/login.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import '../core/error/failure.dart';
// import '../datasource/auth_datasource.dart';

// class AuthRepository {
//   AuthRepository({required AuthDataSource authDataSource})
//       : _authDataSource = authDataSource;

//   final AuthDataSource _authDataSource;

//   Future<Either<Failure, Map<String, dynamic>>> createUser({
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       var res = await _authDataSource.createUser(
//         data: data,
//       );
//       return Right(res);
//     } catch (e) {
//       return Left(Error(errorMessage: e.toString()));
//     }
//   }

//   Future<Either<Failure, Login>> login({
//     required String username,
//     required String password,
//   }) async {
//     try {
//       var res =
//           await _authDataSource.login(username: username, password: password);

//       ///Store user model
//       AppPreferences.setLoginData(res);

//       return Right(res);
//     } catch (e) {
//       return Left(Error(errorMessage: e.toString()));
//     }
//   }

//   Future<Either<Failure, Login>> verifyOTP({
//     required String otp,
//   }) async {
//     try {
//       var res = await _authDataSource.verifyOTP(
//         otp: otp,
//       );

//       ///Store user model
//       AppPreferences.setLoginData(res);
//       return Right(res);
//     } catch (e) {
//       return Left(Error(errorMessage: e.toString()));
//     }
//   }

//   Future<Either<Failure, Login>> verifyResetOTP({
//     required String otp,
//   }) async {
//     try {
//       var res = await _authDataSource.verifyResetOTP(
//         otp: otp,
//       );

//       ///Store user model
//       AppPreferences.setLoginData(res);
//       return Right(res);
//     } catch (e) {
//       return Left(Error(errorMessage: e.toString()));
//     }
//   }

//   Future<Either<Failure, Map<String, dynamic>>> forgotPassword({
//     required String username,
//   }) async {
//     try {
//       var res = await _authDataSource.forgotPassword(
//         username: username,
//       );
//       return Right(res);
//     } catch (e) {
//       return Left(Error(errorMessage: e.toString()));
//     }
//   }

//   Future<Either<Failure, Map<String, dynamic>>> resetPassword({
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       var res = await _authDataSource.resetPassword(
//         data: data,
//       );
//       return Right(res);
//     } catch (e) {
//       return Left(Error(errorMessage: e.toString()));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/services/app_preferences.dart';
import '../core/error/failure.dart';
import '../datasource/auth_datasource.dart';

class AuthRepository {
  AuthRepository({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  final AuthDataSource _authDataSource;

  /// Helper function for handling requests with try-catch
  Future<Either<Failure, T>> _handleRequest<T>(
      Future<T> Function() request) async {
    try {
      final result = await request();
      return Right(result);
    } catch (e) {
      return Left(Error(errorMessage: e.toString()));
    }
  }

  /// Create a new user
  // Future<Either<Failure, Map<String, dynamic>>> createUser({
  //   required Map<String, dynamic> data,
  // }) async {
  //   return _handleRequest(() async {
  //     return await _authDataSource.createUser(data: data);
  //   });
  // }

  String _extractErrorMessage(dynamic message) {
    if (message is String) return message;
    if (message is Map<String, dynamic>) {
      return message.entries
          .map((entry) => '${entry.key}: ${(entry.value as List).join(', ')}')
          .join('\n');
    }
    return 'An unknown error occurred.';
  }

  // Future<Either<Failure, Map<String, dynamic>>> createUser({
  //   required Map<String, dynamic> data,
  // }) async {
  //   return _handleRequest(() async {
  //     final response = await _authDataSource.createUser(data: data);

  //     if (response['success'] == false) {
  //       final errorMessage = _extractErrorMessage(response['message']);
  //       print(errorMessage);
  //       throw Error(errorMessage: errorMessage);
  //     }

  //     return response; // ✅ Return full response, not just data
  //   });
  // }

  Future<Either<Failure, Map<String, dynamic>>> createUser({
    required Map<String, dynamic> data,
  }) async {
    return _handleRequest(() async {
      final response = await _authDataSource.createUser(data: data);

      if (response['success'] == false) {
        final errorMessage = _extractErrorMessage(response['message']);
        print(errorMessage);
        throw Error(errorMessage: errorMessage);
      }

      return response; // Return full response when success
    });
  }

  /// Login user and store login data
  // Future<Either<Failure, Login>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   return _handleRequest(() async {
  //     var res = await _authDataSource.login(email: email, password: password);
  //     // Store user model in preferences after successful login
  //     AppPreferences.setLoginData(res);
  //     return res;
  //   });
  // }

  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
    String? deviceToken, // add optional fcmToken parameter
  }) async {
    return _handleRequest(() async {
      // Pass the fcmToken to your data source login method
      var res = await _authDataSource.login(
        email: email,
        password: password,
        deviceToken: deviceToken,
      );
      // Store user model in preferences after successful login
      await AppPreferences.setLoginData(res);
      return res;
    });
  }

  /// Verify OTP during login and store user data
  // Future<Either<Failure, Login>> verifyOTP(
  //     {required String otp, required String email}) async {
  //   return _handleRequest(() async {
  //     var res = await _authDataSource.verifyOTP(otp: otp, email: email);
  //     // Store user model after successful OTP verification
  //     AppPreferences.setLoginData(res);
  //     return res;
  //   });
  // }

  Future<Either<Failure, bool>> verifyOTP({
    required String otp,
    required String email,
  }) async {
    return _handleRequest(() async {
      final result = await _authDataSource.verifyOTP(otp: otp, email: email);
      return result;
    });
  }

  // Verify OTP during reset and store user data
  Future<Either<Failure, Login>> verifyResetOTP({
    required String otp,
  }) async {
    return _handleRequest(() async {
      var res = await _authDataSource.verifyResetOTP(otp: otp);
      // Store user model after successful reset OTP verification
      // AppPreferences.setLoginData(res);
      return res;
    });
  }

  /// Forgot password: request a reset
  Future<Either<Failure, Map<String, dynamic>>> forgotPassword({
    required String email,
  }) async {
    return _handleRequest(() async {
      return await _authDataSource.forgotPassword(email: email);
    });
  }

  /// Reset the password after verification
  Future<Either<Failure, Map<String, dynamic>>> resetPassword({
    required Map<String, dynamic> data,
  }) async {
    return _handleRequest(() async {
      return await _authDataSource.resetPassword(data: data);
    });
  }

  // /// Additional helper method to check if user is already logged in
  // Future<bool> isLoggedIn() async {
  //   // Here we are checking the login state by trying to get stored login data
  //   return await AppPreferences.getLoginData() != null;
  // }

  /// Logout user by clearing stored login data
  Future<void> logout() async {
    await AppPreferences
        .clearUserData(); // Clears login, user, and FCM token data
  }
}
