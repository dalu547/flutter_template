// ProfileCubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/user/presentation/viewmodels/profile_state.dart';

import '../../../../core/network/error_handler.dart';
import '../../../authentication/domain/repositories/authentication_repository.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  final AuthenticationRepository _authRepository;

  ProfileViewModel(this._authRepository) : super(ProfileInitial());

  // Fetch user details
  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());

    try {
      final user = await _authRepository.getUserDetailsFromDB();
      emit(ProfileLoaded(user));
    } catch (e) {
      final errorHandler = ErrorHandler.handle(e);
      emit(ProfileError(errorHandler.responseError));
    }
  }
}
