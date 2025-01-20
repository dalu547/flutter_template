import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:template/app/utils/app_logger.dart';
import 'package:template/core/network/network_config.dart';

class DioClient {
  DioClient();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      NetworkConfig.CONTENT_TYPE: NetworkConfig.APPLICATION_JSON,
      NetworkConfig.ACCEPT: NetworkConfig.APPLICATION_JSON
    };

    dio.options = BaseOptions(
        baseUrl: NetworkConfig.baseUrl,
        connectTimeout: NetworkConfig.connectTimeout,
        receiveTimeout: NetworkConfig.receiveTimeout,
        headers: headers);

    if (kReleaseMode) {
      AppLogger.info("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }

    return dio;
  }
}
