import 'package:dartz/dartz.dart';
import 'package:template/core/base/base_usecase.dart';
import 'package:template/core/network/failure.dart';
import 'package:template/modules/authentication/data/models/register_request.dart';
import 'package:template/modules/authentication/domain/entities/register_entity.dart';
import 'package:template/modules/authentication/domain/repositories/authentication_repository.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, RegisterEntity> {
  final AuthenticationRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, RegisterEntity>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
        input.countryMobileCode,
        input.userName,
        input.email,
        input.password,
        input.profilePicture,
        input.mobileNumber));
  }
}

class RegisterUseCaseInput {
  String mobileNumber;
  String countryMobileCode;
  String userName;
  String email;
  String password;
  String profilePicture;

  RegisterUseCaseInput(this.mobileNumber, this.countryMobileCode, this.userName,
      this.email, this.password, this.profilePicture);
}
