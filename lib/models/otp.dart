class OtpVerifyResponse {
  final bool status;
  final String email;
  final String code;

  OtpVerifyResponse({
    required this.status,
    required this.email,
    required this.code,
  });

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return OtpVerifyResponse(
      status: json['status'] ?? false,
      email: data['email'] ?? '',
      code: data['code'] ?? '',
    );
  }
}
