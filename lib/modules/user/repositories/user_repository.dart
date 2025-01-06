import 'package:template/modules/user/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(int id);
}
