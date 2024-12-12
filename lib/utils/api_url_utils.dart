import '../constants/enums.dart';

class ApiUrlUtils {
  static EnvironmentEnum env = EnvironmentEnum.dev;

  static setEnv(EnvironmentEnum environment) {
    env = environment;
  }

  static String get baseUrl {
    switch (env) {
      case EnvironmentEnum.dev:
        {
          return 'https://go-girl-api.ventive.app/api/v1/';
        }
      default:
        return 'https://api.thegogirlapp.com/api/v1/';
    }
  }

  static String getApiUrl(UrlEndPointEnum urlEndPoint, {String? id}) {
    switch (urlEndPoint) {
      case UrlEndPointEnum.createUser:
        return '/patient/registration';
      case UrlEndPointEnum.login:
        return '/sign-in';
      case UrlEndPointEnum.getSessionNote:
        return '/telemed/session/$id/notes?from=';
      case UrlEndPointEnum.logout:
        return '/logout';
      case UrlEndPointEnum.forgotPassword:
        return '/user/reset-password';
      case UrlEndPointEnum.resetPassword:
        return '/user/reset';
      case UrlEndPointEnum.fetchUserProfile:
      case UrlEndPointEnum.updateUser:
        return '/patient';
      case UrlEndPointEnum.updateUserExt:
        return '/patient/ext';
      case UrlEndPointEnum.verifyOtp:
        return '/account/verify';
      case UrlEndPointEnum.verifyResetOtp:
        return '/user/reset/$id';
      case UrlEndPointEnum.uploadImage:
        return '/media/upload';
      case UrlEndPointEnum.allDoctors:
        return '/public/doctors';
      case UrlEndPointEnum.searchDoctor:
        return '/doctors/search';
      case UrlEndPointEnum.specialties:
        return '/doctor/specialties';
      case UrlEndPointEnum.doctorBySpecialty:
        return '/doctors'; //doctors?specialty=Family Medicine&pageSize=20&pageNo=0
      case UrlEndPointEnum.doctorDetails:
        return '/doctor'; //doctor/rick.shaw@fabrik.com
      case UrlEndPointEnum.searchDoctors:
        return 'doctors/search'; //doctors/search?keywords=bodyache,stomach ache&online=true&gender=female (Online Optional)
      case UrlEndPointEnum.userExtras:
        return 'patient/ext';
      case UrlEndPointEnum.createInstantVisit:
        return 'telemed/session/instant';
      case UrlEndPointEnum.registerDeviceFCM:
        return 'device/gcm/registry';
      case UrlEndPointEnum.getTelemedSessions:
        return 'telemed/sessions';
      case UrlEndPointEnum.availableSlots:
        return 'telemed/apt';
      case UrlEndPointEnum.createAppointment:
        return 'telemed/apt/create';
      case UrlEndPointEnum.abhipayPayment:
        return 'processors/abhipay/payment/init';
      case UrlEndPointEnum.medications:
        return 'phr/medications';
      case UrlEndPointEnum.saveSession:
        return 'user/feedback';
      case UrlEndPointEnum.updateSession:
        return '/telemed/session/$id';
      case UrlEndPointEnum.recentConsultations:
        return '/telemed/pastdoctors';
      case UrlEndPointEnum.validateCoupon:
        return '/telemed/session/discountcode/$id/verify';
      case UrlEndPointEnum.labReports:
        return '/patientlab/self';
      case UrlEndPointEnum.payments:
        return 'payment/list';
      case UrlEndPointEnum.getAppointments:
        return 'telemed/apt/patient/$id';
      case UrlEndPointEnum.cancelAppointment:
        return 'telemed/apt/$id/?status=CANCELLED';
      default:
        return '';
    }
  }
}
