// class Login {
//   String? token;
//   String? email;
//   String? message;

//   Login({
//     this.token,
//     this.email,
//     this.message,
//   });

//   factory Login.fromJson(Map<String, dynamic> json) {
//     final data = json['data'] ?? {};
//     return Login(
//       token: data['token'],
//       email: data['email'],
//       message: json['message'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': {
//         'token': token,
//         'email': email,
//       },
//       'message': message,
//     };
//   }

//   @override
//   String toString() {
//     return 'Login(token: $token, email: $email, message: $message)';
//   }
// }

// class Login {
//   String? token;
//   String? email;
//   String? message;

//   Login({
//     this.token,
//     this.email,
//     this.message,
//   });

//   factory Login.fromJson(Map<String, dynamic> json) {
//     final data = json['data'];

//     return Login(
//       token: data != null ? data['token'] : json['token'],
//       email: data != null ? data['email'] : json['email'],
//       message: json['message'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final hasData = token != null || email != null;

//     return {
//       if (hasData)
//         'data': {
//           'token': token,
//           'email': email,
//         }
//       else ...{
//         'token': token,
//         'email': email,
//       },
//       'message': message,
//     };
//   }

//   @override
//   String toString() {
//     return 'Login(token: $token, email: $email, message: $message)';
//   }
// }

class Login {
  String? token;
  String? email;
  String? message;
  String? deviceToken; // Optional device token

  Login({
    this.token,
    this.email,
    this.message,
    this.deviceToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return Login(
      token: data != null ? data['token'] : json['token'],
      email: data != null ? data['email'] : json['email'],
      deviceToken: data != null
          ? data['device_token']
          : json['device_token'], // parse optional
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final hasData = token != null || email != null || deviceToken != null;

    return {
      if (hasData)
        'data': {
          'token': token,
          'email': email,
          if (deviceToken != null)
            'device_token': deviceToken, // only add if not null
        }
      else ...{
        'token': token,
        'email': email,
        if (deviceToken != null) 'device_token': deviceToken,
      },
      'message': message,
    };
  }

  @override
  String toString() {
    return 'Login(token: $token, email: $email, deviceToken: $deviceToken, message: $message)';
  }
}
