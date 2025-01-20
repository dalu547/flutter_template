import 'package:template/modules/authentication/data/datasource/remote/authentication_apis.dart';
import 'package:template/modules/authentication/data/models/authentication_response.dart';
import 'package:template/modules/authentication/data/models/login_request.dart';
import 'package:template/modules/authentication/data/models/register_request.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  Future<AuthenticationResponse> forgotPassword(String email);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AuthenticationServiceClient _serviceClient;

  RemoteDataSourceImplementer(this._serviceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _serviceClient.login(
        loginRequest.email, loginRequest.password, "", "");
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _serviceClient.register(
        registerRequest.countryMobileCode,
        registerRequest.userName,
        registerRequest.email,
        registerRequest.password,
        registerRequest.mobileNumber,
        "");
  }

  @override
  Future<AuthenticationResponse> forgotPassword(String email) async {
    return await _serviceClient.forgotPassword(email);
  }
}
