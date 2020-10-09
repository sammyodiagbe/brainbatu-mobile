class AppUrl {
  static const String liveBaseUrl = '';
  static const String localBaseUrl = 'http://192.168.43.50:9000/api/v1';

  static const String baseUrl = localBaseUrl;
  static const String login = baseUrl + '/auth/login';
  static const String register = baseUrl + '/auth/signup';
  static const String verify = baseUrl + '/auth/verify';
}
