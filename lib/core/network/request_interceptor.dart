import 'dart:io';

import 'package:dio/dio.dart';
import 'package:template/app/utils/app_logger.dart';
import 'package:template/core/storage/preference_keys.dart';
import 'package:template/core/storage/secure_storage.dart';

class RequestInterceptor extends Interceptor {
  RequestInterceptor();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['API-REQUEST-FROM'] = Platform.isIOS ? "IOS" : "Android";
    options.headers['Content-Type'] = 'application/json';

    AppLogger.info('onRequest - RequestInterceptor called');
    AppLogger.info('onRequest - $options.');

    try {
      // String accessToken = AppStorage().getAccessToken();
      String? accessToken =
          await SecureStorage().getValue(PreferencesKeys.accessToken);
      String? refreshToken =
          await SecureStorage().getValue(PreferencesKeys.refreshToken);

      AppLogger.info("accessToken Token - RequestInterceptor: $accessToken");
      AppLogger.info("authToken Token - RequestInterceptor: $refreshToken");

      // print("Fetched Access Token: $accessToken");

      if (accessToken!.isNotEmpty) {
        String token = 'Bearer $accessToken';
        options.headers['Authorization'] = token;
      }
    } catch (e) {
      AppLogger.error("Error fetching access token: $e");
    }

    super.onRequest(options, handler);
  }
}
