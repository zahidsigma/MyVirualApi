//  import 'package:dio/dio.dart';

// // abstract class Failure {
// //   get errorMessage => null;
// // }

// // class Error extends Failure {
// //   final String errorMessage;

// //   Error({required this.errorMessage});

// //   static getError(e) {
// //     var error = (e as DioException);
// //     var response = error.response != null
// //         ? (error.response?.data as Map<String, dynamic>)
// //         : null;
// //     return response != null && response.containsKey('message')
// //         ? response['message']
// //         : error.message;
// //   }
// // }

import 'package:dio/dio.dart';

abstract class Failure {
  String? get errorMessage;
}

class Error extends Failure {
  final String errorMessage;

  Error({required this.errorMessage});

  @override
  String toString() => 'Error: $errorMessage';

  static getError(e) {
    var error = (e as DioException);
    var response = error.response != null
        ? (error.response?.data as Map<String, dynamic>)
        : null;
    return response != null && response.containsKey('message')
        ? response['message']
        : error.message;
  }
}
