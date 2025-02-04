import 'package:floor/floor.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';

@dao
abstract class UserDetailsDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertUser(LoginEntity userDetails);

  @update
  Future<int> updateUser(LoginEntity userDetails);

  @delete
  Future<int> deleteUser(LoginEntity userDetails);

  @Query('SELECT * FROM tblUserDetails')
  Future<List<LoginEntity>> getAllUsersDetails();

  @Query('SELECT * FROM tblUserDetails LIMIT 1')
  Future<LoginEntity?> getUserDetails();

  @Query('SELECT * FROM tblUserDetails WHERE id = :id')
  Future<LoginEntity?> getUserDetailsById(int id);
}
