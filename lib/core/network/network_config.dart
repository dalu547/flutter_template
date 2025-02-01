class NetworkConfig {
  static const String baseUrl = "https://test-greenkogroup.sinenow.com:5001";

  static const int timeOut = 5000; // 5 seconds
  static const Duration connectTimeout = Duration(milliseconds: timeOut);
  static const Duration receiveTimeout = Duration(milliseconds: timeOut);

  static const String APPLICATION_JSON = "application/json";
  static const String CONTENT_TYPE = "content-type";
  static const String ACCEPT = "accept";
  static const String AUTHORIZATION = "authorization";
  static const String DEFAULT_LANGUAGE = "language";
}
