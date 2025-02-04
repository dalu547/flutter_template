// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDetailsDao? _userDetailsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tblUserDetails` (`id` INTEGER NOT NULL, `username` TEXT NOT NULL, `email` TEXT NOT NULL, `firstName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `gender` TEXT NOT NULL, `image` TEXT NOT NULL, `accessToken` TEXT NOT NULL, `refreshToken` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDetailsDao get userDetailsDao {
    return _userDetailsDaoInstance ??=
        _$UserDetailsDao(database, changeListener);
  }
}

class _$UserDetailsDao extends UserDetailsDao {
  _$UserDetailsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _loginEntityInsertionAdapter = InsertionAdapter(
            database,
            'tblUserDetails',
            (LoginEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'email': item.email,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'gender': item.gender,
                  'image': item.image,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken
                }),
        _loginEntityUpdateAdapter = UpdateAdapter(
            database,
            'tblUserDetails',
            ['id'],
            (LoginEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'email': item.email,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'gender': item.gender,
                  'image': item.image,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken
                }),
        _loginEntityDeletionAdapter = DeletionAdapter(
            database,
            'tblUserDetails',
            ['id'],
            (LoginEntity item) => <String, Object?>{
                  'id': item.id,
                  'username': item.username,
                  'email': item.email,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'gender': item.gender,
                  'image': item.image,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LoginEntity> _loginEntityInsertionAdapter;

  final UpdateAdapter<LoginEntity> _loginEntityUpdateAdapter;

  final DeletionAdapter<LoginEntity> _loginEntityDeletionAdapter;

  @override
  Future<List<LoginEntity>> getAllUsersDetails() async {
    return _queryAdapter.queryList('SELECT * FROM tblUserDetails',
        mapper: (Map<String, Object?> row) => LoginEntity(
            id: row['id'] as int,
            username: row['username'] as String,
            email: row['email'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            gender: row['gender'] as String,
            image: row['image'] as String,
            accessToken: row['accessToken'] as String,
            refreshToken: row['refreshToken'] as String));
  }

  @override
  Future<LoginEntity?> getUserDetails() async {
    return _queryAdapter.query('SELECT * FROM tblUserDetails LIMIT 1',
        mapper: (Map<String, Object?> row) => LoginEntity(
            id: row['id'] as int,
            username: row['username'] as String,
            email: row['email'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            gender: row['gender'] as String,
            image: row['image'] as String,
            accessToken: row['accessToken'] as String,
            refreshToken: row['refreshToken'] as String));
  }

  @override
  Future<LoginEntity?> getUserDetailsById(int id) async {
    return _queryAdapter.query('SELECT * FROM tblUserDetails WHERE id = ?1',
        mapper: (Map<String, Object?> row) => LoginEntity(
            id: row['id'] as int,
            username: row['username'] as String,
            email: row['email'] as String,
            firstName: row['firstName'] as String,
            lastName: row['lastName'] as String,
            gender: row['gender'] as String,
            image: row['image'] as String,
            accessToken: row['accessToken'] as String,
            refreshToken: row['refreshToken'] as String),
        arguments: [id]);
  }

  @override
  Future<int> insertUser(LoginEntity userDetails) {
    return _loginEntityInsertionAdapter.insertAndReturnId(
        userDetails, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateUser(LoginEntity userDetails) {
    return _loginEntityUpdateAdapter.updateAndReturnChangedRows(
        userDetails, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(LoginEntity userDetails) {
    return _loginEntityDeletionAdapter.deleteAndReturnChangedRows(userDetails);
  }
}
