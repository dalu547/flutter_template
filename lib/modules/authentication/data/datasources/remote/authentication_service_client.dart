import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:template/core/network/network_config.dart';
import 'package:template/core/network/parse_error_logger.dart';
import 'package:template/modules/authentication/data/models/forgot_password_response.dart';
import 'package:template/modules/authentication/data/models/login_response.dart';
import 'package:template/modules/authentication/data/models/register_response.dart';

part 'authentication_service_client.g.dart';

@RestApi(baseUrl: NetworkConfig.baseUrl)
abstract class AuthenticationServiceClient {
  factory AuthenticationServiceClient(Dio dio, {String baseUrl}) =
      _AuthenticationServiceClient;

  @POST("/login")
  Future<LoginResponse> login(
      @Field("username") String email, @Field("password") String password);

  @POST("/customers/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

  @POST("/customers/register")
  Future<RegisterResponse> register(
    @Field("country_mobile_code") String countryMobileCode,
    @Field("user_name") String userName,
    @Field("email") String email,
    @Field("password") String password,
    @Field("mobile_number") String mobilNumber,
    @Field("profile_picture") String profilePicture,
  );
}
