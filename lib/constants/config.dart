import 'enums.dart';

class AppConfig {
  AppConfig._();
  //Base Url For APP
  static EnvironmentEnum env = EnvironmentEnum.prod;

  static setEnv(EnvironmentEnum environment) {
    env = environment;
  }

  static String get baseUrl {
    switch (env) {
      case EnvironmentEnum.dev:
        {
          return 'https://api-dev.digilifeinc.com/care/v2/';
        }
      default:
        return 'https://api.prodoc.live/care/v2/';
    }
  }

  static const String applicationId = 'Prodoc';
  static const String authTokenType = 'Bearer';
  static const companyCode = "prodoc_pk";
}
