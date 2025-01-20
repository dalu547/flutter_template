import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:template/core/network/network_config.dart';
import 'package:template/core/network/parse_error_logger.dart';
import 'package:template/modules/authentication/data/models/authentication_response.dart';

part 'authentication_apis.g.dart';

@RestApi(baseUrl: NetworkConfig.baseUrl)
abstract class AuthenticationServiceClient {
  factory AuthenticationServiceClient(Dio dio, {String baseUrl}) =
      _AuthenticationServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,
  );

  @POST("/customers/forgotPassword")
  Future<AuthenticationResponse> forgotPassword(@Field("email") String email);

  @POST("/customers/register")
  Future<AuthenticationResponse> register(
    @Field("country_mobile_code") String countryMobileCode,
    @Field("user_name") String userName,
    @Field("email") String email,
    @Field("password") String password,
    @Field("mobile_number") String mobilNumber,
    @Field("profile_picture") String profilePicture,
  );
}
