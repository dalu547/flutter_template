import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:template/app/utils/app_logger.dart';
import 'package:template/core/storage/preference_keys.dart';
import 'package:template/core/storage/secure_storage.dart';

/// using this key when we don't have direct access with Build context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// This class is used for handling 401
/// other errors handling in Api Result Generic class

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor(this.dio);

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    AppLogger.info("Reached ${err.type} ${err.response?.statusCode}");

    String? accesstoken =
        await SecureStorage().getValue(PreferencesKeys.accessToken);

    //checks the response code.
    if (err.response?.statusCode == 401 && (accesstoken!.isNotEmpty)) {
      AppLogger.info('1. statusCode == 401 && accesstoken.isNotEmpty case');

      if (!err.requestOptions.extra.containsKey('retry')) {
        err.requestOptions.extra['retry'] = true;
        AppLogger.info('2. refresh token calling case');

        //Call Refresh token API for new authtoken.
        //todo : Here just iam getting error response. we have to handle refresh token API response.
        Response? response = err.response;
        if (response != null) {
          // save the token in local storage
          // adding token into your header

          try {
            // retry the queied API call .
            final response = await dio.fetch(err.requestOptions);
            handler.resolve(response);
          } on DioException catch (e) {
            AppLogger.info("api:: called retry exception $e");
            // If an error occurs during the api call , reject the handler and sending to error to API Result generic class
            //errors like any validation issue from API or whatever
            return handler.reject(e);
          }
        } else {
          // If the refresh token is null, reject the handler with an error and navigate to login screen
          handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: "Refresh token is null",
          ));
          AppLogger.info('navigateToLogin 2');

          navigateToLogin();
        }
      } else {
        ///Again token api becomes 401 navigate to login
        if (err.response?.statusCode == 401) {
          AppLogger.info('3. Again token api becomes 401 navigate to login');

          navigateToLogin();
        }
      }
    } else {
      // if the API status code not contains sending to API Result class
      AppLogger.info(
          '4. if the API status code not contains sending to API Result class');
      return handler.next(err);
    }
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    /// Here will add token from the shared preference
    try {
      // String accessToken = AppStorage().getAccessToken();
      String? accessToken =
          await SecureStorage().getValue(PreferencesKeys.accessToken);

      AppLogger.info("Fetched Access Token: $accessToken");

      if (accessToken!.isNotEmpty) {
        String token = 'Bearer $accessToken';
        options.headers['Authorization'] = token;
        AppLogger.info("Authorization: $token");
      }
    } catch (e) {
      AppLogger.error("Error fetching access token: $e");
    }
    return handler.next(options);
  }

  void navigateToLogin() {
    //Clear local storage.
    //Navigate Login
  }
}
