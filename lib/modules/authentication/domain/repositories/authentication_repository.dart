import 'package:dartz/dartz.dart';
import 'package:template/core/network/failure.dart';
import 'package:template/modules/authentication/data/models/login_request.dart';
import 'package:template/modules/authentication/data/models/register_request.dart';
import 'package:template/modules/authentication/domain/entities/forgot_password_entity.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';
import 'package:template/modules/authentication/domain/entities/register_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginEntity>> login(LoginRequest loginRequest);
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword(String email);
  Future<Either<Failure, RegisterEntity>> register(
      RegisterRequest registerRequest);
}
