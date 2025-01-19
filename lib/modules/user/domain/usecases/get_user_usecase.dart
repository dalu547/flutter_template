import 'package:template/modules/user/domain/entities/user_entity.dart';
import 'package:template/modules/user/data/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<UserEntity> execute(int id) {
    return repository.getUser(id);
  }
}
