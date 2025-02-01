import 'package:dartz/dartz.dart';
import 'package:template/core/network/error_handler.dart';
import 'package:template/core/network/response_error.dart';
import 'package:template/core/network/network_info.dart';
import 'package:template/modules/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:template/modules/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:template/modules/authentication/data/models/login_request.dart';
import 'package:template/modules/authentication/data/models/register_request.dart';
import 'package:template/modules/authentication/domain/entities/forgot_password_entity.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';
import 'package:template/modules/authentication/domain/entities/register_entity.dart';
import 'package:template/modules/authentication/domain/repositories/authentication_repository.dart';

class RepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDatasource _remoteDataSource;
  final AuthenticationLocalDatasource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<ResponseError, LoginEntity>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) // success
        {
          // return data (success)
          // return right
          return Right(response.toEntity());
        } else {
          // return biz logic error
          // return left
          return Left(ResponseError(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).responseError));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getResponseError());
    }
  }

  @override
  Future<Either<ResponseError, ForgotPasswordEntity>> forgotPassword(
      String email) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await _remoteDataSource.forgotPassword(email);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return right
          return Right(response.toEntity());
        } else {
          // failure
          // return left
          return Left(ResponseError(response.status ?? ResponseCode.DEFAULT,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).responseError);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.NO_INTERNET_CONNECTION.getResponseError());
    }
  }

  @override
  Future<Either<ResponseError, RegisterEntity>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _remoteDataSource.register(registerRequest);

        if (response.status == ApiInternalStatus.SUCCESS) // success
        {
          // return data (success)
          // return right
          return Right(response.toEntity());
        } else {
          // return biz logic error
          // return left
          return Left(ResponseError(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).responseError));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getResponseError());
    }
  }
}
