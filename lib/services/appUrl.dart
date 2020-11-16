class AppUrl {
  static const String liveBaseUrl = '';
  static const String localBaseUri = 'http://192.168.43.50:9090';
  static const String localBaseUrl = '$localBaseUri/api/v1';

  static const String baseUrl = localBaseUrl;
  static const String login = baseUrl + '/auth/login';
  static const String register = baseUrl + '/auth/signup';
  static const String verify = baseUrl + '/auth/verify';
}
