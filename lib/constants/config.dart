// // import 'enums.dart';

// // class AppConfig {
// //   AppConfig._();
// //   //Base Url For APP
// //   static EnvironmentEnum env = EnvironmentEnum.prod;

// //   static setEnv(EnvironmentEnum environment) {
// //     env = environment;
// //   }

// //   static String get baseUrl {
// //     switch (env) {
// //       case EnvironmentEnum.dev:
// //         {
// //           // return 'https://api-dev.digilifeinc.com/care/v2/';
// //           // return 'https://api.galaxysearchapi.com/';
// //           return 'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api';
// //         }
// //       default:
// //         return '';
// //       // return 'https://api.prodoc.live/care/v2/';
// //     }
// //   }

// //   // static const String applicationId = 'Prodoc';
// //   static const String authTokenType = 'Bearer';
// //   // static const companyCode = "prodoc_pk";
// // }

// import 'enums.dart';

// class AppConfig {
//   AppConfig._();

//   // Default environment (production)
//   static EnvironmentEnum env = EnvironmentEnum.prod;

//   // Set the environment dynamically
//   static setEnv(EnvironmentEnum environment) {
//     env = environment;
//   }

//   // Get the base URL based on the environment
//   static String get baseUrl {
//     switch (env) {
//       case EnvironmentEnum.dev:
//         return 'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api';

//       // case EnvironmentEnum.prod:
//       //   // Add the production URL here
//       //   return 'https://api.prodoc.live/care/v2/';

//       // case EnvironmentEnum.stage:
//       //   // Optionally add a staging URL
//       //   return 'https://api.stage.example.com/';

//       default:
//         throw Exception('Unknown environment: $env');
//     }
//   }

//   // Auth token type for API requests (e.g., "Bearer")
//   static const String authTokenType = 'Bearer';

//   // Optionally, you can add more configuration constants
//   // static const String applicationId = 'Prodoc';
// }

import 'enums.dart';

class AppConfig {
  AppConfig._();

  // Default environment
  static EnvironmentEnum env = EnvironmentEnum.dev;

  // Dynamically set environment
  static setEnv(EnvironmentEnum environment) {
    env = environment;
  }

  // Base API URL
  static String get baseUrl {
    switch (env) {
      case EnvironmentEnum.dev:
        return 'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api';
      case EnvironmentEnum.prod:
        return "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api";
      default:
        throw Exception('Unknown environment: $env');
    }
  }

  // Base image URL for loading profile pictures or other media
  static String get imageBaseUrl {
    switch (env) {
      case EnvironmentEnum.dev:
        return 'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/';
      default:
        throw Exception('Unknown environment: $env');
    }
  }

  static const String authTokenType = 'Bearer';
}
