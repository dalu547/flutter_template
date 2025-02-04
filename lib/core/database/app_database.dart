import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../modules/authentication/data/datasources/local/user_details_dao.dart';
import '../../modules/authentication/domain/entities/login_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [LoginEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDetailsDao get userDetailsDao;
}
