import 'package:equatable/equatable.dart';
import 'package:template/core/network/failure.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final ResponseError error;

  LoginFailure(this.error);
}
