import 'package:dartz/dartz.dart';
import 'package:template/core/network/response_error.dart';
import 'package:template/modules/authentication/data/models/login_request.dart';
import 'package:template/modules/authentication/data/models/register_request.dart';
import 'package:template/modules/authentication/domain/entities/forgot_password_entity.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';
import 'package:template/modules/authentication/domain/entities/register_entity.dart';

abstract class AuthenticationRepository {
  //Remote connections.
  Future<Either<ResponseError, LoginEntity>> login(LoginRequest loginRequest);
  Future<Either<ResponseError, ForgotPasswordEntity>> forgotPassword(
      String email);
  Future<Either<ResponseError, RegisterEntity>> register(
      RegisterRequest registerRequest);

  //Local connections
  Future<void> inserUserDetailsToDB(LoginEntity user);
  Future<LoginEntity> getUserDetailsFromDB();
}
