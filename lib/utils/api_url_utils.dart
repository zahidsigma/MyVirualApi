import 'package:virualapi/constants/config.dart';

import '../constants/enums.dart';

class ApiUrlUtils {
  static EnvironmentEnum env = AppConfig.env;

  static setEnv(EnvironmentEnum environment) {
    env = environment;
  }

  // Get the base URL based on the environment (uses AppConfig)
  static String get baseUrl {
    switch (env) {
      case EnvironmentEnum.dev:
        return 'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api'; // Dev URL

      // Optionally add more environments as needed
      // case EnvironmentEnum.prod:
      //   return 'https://api.prodoc.live/care/v2/'; // Prod URL

      default:
        return ''; // Default empty URL, you can handle this gracefully in production
    }
  }

  // Combine baseUrl with endpoint paths and id if needed
  static String getApiUrl(UrlEndPointEnum urlEndPoint, {String? id}) {
    String path;

    switch (urlEndPoint) {
      case UrlEndPointEnum.createUser:
        path = '/user-register';
        break;
      case UrlEndPointEnum.login:
        path = '/user-login';
        break;
      // case UrlEndPointEnum.getSessionNote:
      //   path = '/telemed/session/$id/notes?from=';
      //   break;
      case UrlEndPointEnum.logout:
        path = '/logout';
        break;
      case UrlEndPointEnum.forgotPassword:
        path = '/forgot-password';
        break;
      case UrlEndPointEnum.resetPassword:
        path = '/reset-password';
        break;
      case UrlEndPointEnum.fetchUserProfile:
        path = '/edit-profile';
        break;

      case UrlEndPointEnum.verifyOtp:
        path = '/otp-verification';
        break;

      case UrlEndPointEnum.pricing:
        path = '/pricing';
        break;

      case UrlEndPointEnum.notification:
        path = '/notifications';
        break;

      case UrlEndPointEnum.markasRead:
        path = '/notifications/mark-as-read';
        break;

      case UrlEndPointEnum.orderView:
        path = '/order-history';
        break;

      // case UrlEndPointEnum.updateUserExt:
      //   path = '/patient/ext';
      //   break;
      // case UrlEndPointEnum.verifyOtp:
      //   path = '/account/verify';
      //   break;
      // case UrlEndPointEnum.verifyResetOtp:
      //   path = '/user/reset/$id';
      //   break;
      case UrlEndPointEnum.uploadImage:
        path = '/images/users-profile/';
        break;
      case UrlEndPointEnum.updateUserWithProfile:
        path = '/update-profile';
        break;
      case UrlEndPointEnum.contactUs:
        path = '/submit-query';
        break;

      case UrlEndPointEnum.searchHistory:
        path = '/order-history';
        break;
      // case UrlEndPointEnum.specialties:
      //   path = '/doctor/specialties';
      //   break;
      // case UrlEndPointEnum.doctorBySpecialty:
      //   path = '/doctors'; // Example, adjust as necessary
      //   break;
      // case UrlEndPointEnum.doctorDetails:
      //   path = '/doctor';
      //   break;
      // case UrlEndPointEnum.searchDoctors:
      //   path = 'doctors/search'; // Example, adjust as necessary
      //   break;
      // case UrlEndPointEnum.createInstantVisit:
      //   path = 'telemed/session/instant';
      //   break;
      // case UrlEndPointEnum.registerDeviceFCM:
      //   path = 'device/gcm/registry';
      //   break;
      // case UrlEndPointEnum.getTelemedSessions:
      //   path = 'telemed/sessions';
      //   break;
      // case UrlEndPointEnum.availableSlots:
      //   path = 'telemed/apt';
      //   break;
      // case UrlEndPointEnum.createAppointment:
      //   path = 'telemed/apt/create';
      //   break;
      // case UrlEndPointEnum.abhipayPayment:
      //   path = 'processors/abhipay/payment/init';
      //   break;
      // case UrlEndPointEnum.medications:
      //   path = 'phr/medications';
      //   break;
      // case UrlEndPointEnum.saveSession:
      //   path = 'user/feedback';
      //   break;
      // case UrlEndPointEnum.updateSession:
      //   path = '/telemed/session/$id';
      //   break;
      // case UrlEndPointEnum.recentConsultations:
      //   path = '/telemed/pastdoctors';
      //   break;
      // case UrlEndPointEnum.validateCoupon:
      //   path = '/telemed/session/discountcode/$id/verify';
      //   break;
      // case UrlEndPointEnum.labReports:
      //   path = '/patientlab/self';
      //   break;
      // case UrlEndPointEnum.payments:
      //   path = 'payment/list';
      //   break;
      // case UrlEndPointEnum.getAppointments:
      //   path = 'telemed/apt/patient/$id';
      //   break;
      // case UrlEndPointEnum.personSearch:
      //   path = 'PersonSearch';
      //   break;
      // case UrlEndPointEnum.cancelAppointment:
      //   path = 'telemed/apt/$id/?status=CANCELLED';
      //   break;
      default:
        path = '';
    }

    return baseUrl + path;
  }
}
