import 'package:dartz/dartz.dart';
import 'package:template/app/models/device_info.dart';
import 'package:template/app/utils/device_info_utils.dart';
import 'package:template/core/base/base_usecase.dart';
import 'package:template/core/network/response_error.dart';
import 'package:template/modules/authentication/data/models/login_request.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';
import 'package:template/modules/authentication/domain/repositories/authentication_repository.dart';

import '../../../../app/utils/app_logger.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, LoginEntity> {
  final AuthenticationRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<ResponseError, LoginEntity>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    AppLogger.trace('3. login usecase');
    return await _repository.login(LoginRequest(
        input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
