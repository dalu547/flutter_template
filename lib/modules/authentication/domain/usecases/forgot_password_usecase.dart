import 'package:dartz/dartz.dart';
import 'package:template/core/base/base_usecase.dart';
import 'package:template/core/network/response_error.dart';
import 'package:template/modules/authentication/domain/entities/forgot_password_entity.dart';
import 'package:template/modules/authentication/domain/repositories/authentication_repository.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<String, ForgotPasswordEntity> {
  final AuthenticationRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<ResponseError, ForgotPasswordEntity>> execute(
      String input) async {
    return await _repository.forgotPassword(input);
  }
}
