abstract class BaseConfig {
  String get apiHost;
  String get relayUrl;
  String get imgBaseUrl;
  String get productListing;
}

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "https://devtest.samil.in/";

  @override
  String get relayUrl => "https://relay.novactech.net/";

  @override
  String get imgBaseUrl =>
      'https://devtest.samil.in/uatq2sadmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "sellerproducts";
}

class UatConfig implements BaseConfig {
  @override
  String get apiHost => "https://uatecomapi.novactech.net/";

  @override
  String get relayUrl => "https://uatrelay.samil.in/";

  @override
  String get imgBaseUrl =>
      'https://uatq2s.shriramvalue.me/UATQ2SAdmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "ecomproducts";
}

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "https://ecomapi.q2s.in/";

  @override
  String get relayUrl => "https://relay.samil.in/";

  @override
  String get imgBaseUrl =>
      'https://beta.q2s.in/q2sAdmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "ecomproducts";
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();
  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String uat = 'UAT';
  static const String prod = 'PROD';

  BaseConfig? config;
  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.uat:
        return UatConfig();
      default:
        return DevConfig();
    }
  }
}
