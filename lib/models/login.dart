// class Login {
//   String? token; // Change the name from authToken to token
//   String? email;

//   Login({
//     this.token,
//     this.email,
//   });

//   // Update the fromJson method to correctly parse the response
//   Login.fromJson(Map<String, dynamic> json) {
//     token = json['data'] != null ? json['data']['token'] : null;
//     email = json['data'] != null ? json['data']['email'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'token': token,
//       'email': email,
//     };
//   }
// }

class Login {
  String? token;
  String? email;
  String? message;

  Login({
    this.token,
    this.email,
    this.message,
  });

  // From JSON with 'data' wrapper
  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['data'] != null ? json['data']['token'] : null,
      email: json['data'] != null ? json['data']['email'] : null,
      message: json['message'],
    );
  }

  // To JSON with 'data' wrapper
  Map<String, dynamic> toJson() {
    return {
      'data': {
        'token': token,
        'email': email,
      },
      'message': message,
    };
  }

  @override
  String toString() {
    return 'Login(token: $token, email: $email, message: $message)';
  }
}

// import 'package:virualapi/models/user.dart';

// class Login {
//   String? token;
//   String? email;
//   String? message;
//   User? user; // Add the User object here

//   Login({
//     this.token,
//     this.email,
//     this.message,
//     this.user, // Add user in the constructor
//   });

//   // From JSON with 'data' wrapper
//   factory Login.fromJson(Map<String, dynamic> json) {
//     return Login(
//       token: json['data'] != null ? json['data']['token'] : null,
//       email: json['data'] != null ? json['data']['email'] : null,
//       message: json['message'],
//       user: json['data'] != null
//           ? User.fromJson(json['data']['user'])
//           : null, // Parse the user data
//     );
//   }

//   // To JSON with 'data' wrapper
//   Map<String, dynamic> toJson() {
//     return {
//       'data': {
//         'token': token,
//         'email': email,
//         'user': user?.toJson(), // Include user data in the JSON
//       },
//       'message': message,
//     };
//   }

//   @override
//   String toString() {
//     return 'Login(token: $token, email: $email, message: $message, user: $user)';
//   }
// }
