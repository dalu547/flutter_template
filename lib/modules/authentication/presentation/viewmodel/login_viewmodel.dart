import 'package:bloc/bloc.dart';
import 'package:template/modules/authentication/domain/usecases/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase) : super(LoginInitial()) {
    //LoginSubmitted event.
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      // Create LoginUseCaseInput from event data
      final input = LoginUseCaseInput(event.email, event.password);

      // Execute the use case
      final result = await loginUseCase.execute(input);

      // Handle the result
      result.fold(
        (error) => emit(LoginFailure(error)),
        (user) => emit(LoginSuccess(user)),
      );
    });
  }
}
