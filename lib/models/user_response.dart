import 'user.dart';

class UserResponse {
  final bool? status;
  final User? data;
  final String? message;

  UserResponse({this.status, this.data, this.message});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final userData = json['data'];
    return UserResponse(
      status: json['status'],
      data: userData is Map<String, dynamic> ? User.fromJson(userData) : null,
      message: json['message'],
    );
  }
}
