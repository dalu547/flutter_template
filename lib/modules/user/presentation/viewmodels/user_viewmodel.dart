import 'package:flutter/material.dart';
import 'package:template/modules/user/domain/entities/user_entity.dart';
import 'package:template/modules/user/domain/usecases/get_user_usecase.dart';

class UserViewModel extends ChangeNotifier {
  final GetUserUseCase getUserUseCase;

  UserViewModel(this.getUserUseCase);

  UserEntity? user;
  bool isLoading = false;

  Future<void> fetchUser(int id) async {
    isLoading = true;
    notifyListeners();

    user = await getUserUseCase.execute(id);

    isLoading = false;
    notifyListeners();
  }
}
