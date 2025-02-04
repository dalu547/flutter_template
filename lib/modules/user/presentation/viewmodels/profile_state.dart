import 'package:equatable/equatable.dart';
import 'package:template/core/network/response_error.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  // Success State
  final LoginEntity user;
  ProfileLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class ProfileError extends ProfileState {
  // Error State
  final ResponseError error;
  ProfileError(this.error);

  @override
  List<Object?> get props => [error];
}
