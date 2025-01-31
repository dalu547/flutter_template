import 'package:template/modules/authentication/data/datasources/remote/authentication_service_client.dart';
import 'package:template/modules/authentication/data/models/forgot_password_response.dart';
import 'package:template/modules/authentication/data/models/login_response.dart';
import 'package:template/modules/authentication/data/models/login_request.dart';
import 'package:template/modules/authentication/data/models/register_request.dart';
import 'package:template/modules/authentication/data/models/register_response.dart';

import '../../../../../app/utils/app_logger.dart';

abstract class AuthenticationRemoteDatasource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
}

class RemoteDataSourceImpl implements AuthenticationRemoteDatasource {
  final AuthenticationServiceClient _serviceClient;

  RemoteDataSourceImpl(this._serviceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    AppLogger.trace('5. Login from remote data source');

    return await _serviceClient.login(
        loginRequest.email, loginRequest.password, "", "");
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _serviceClient.register(
        registerRequest.countryMobileCode,
        registerRequest.userName,
        registerRequest.email,
        registerRequest.password,
        registerRequest.mobileNumber,
        "");
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _serviceClient.forgotPassword(email);
  }
}
