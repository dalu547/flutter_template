import 'package:template/core/network/error_handler.dart';
import 'package:template/modules/authentication/data/datasources/local/user_details_dao.dart';
import 'package:template/modules/authentication/data/models/login_response.dart';
import 'package:template/modules/authentication/domain/entities/login_entity.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s in millis

abstract class AuthenticationLocalDatasource {
  //Dealing with app memory.
  Future<void> saveUserDetailsToCache(LoginEntity userDetails);
  Future<LoginResponse> getUsereDetailsFromCache();
  void clearCache();
  void removeFromCache(String key);

  //Dealing with Database.
  Future<void> insertUserDetailsToDB(LoginEntity userDetails);
  Future<LoginEntity> getUsereDetailsFromDB();
}

class LocalDataSourceImpl implements AuthenticationLocalDatasource {
  final UserDetailsDao _userDetailsDao;

  LocalDataSourceImpl(this._userDetailsDao);

  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  Future<LoginResponse> getUsereDetailsFromCache() async {
    CachedItem? cachedItem = cacheMap[CACHE_STORE_DETAILS_KEY];

    if (cachedItem != null &&
        cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(ErrorType.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveUserDetailsToCache(LoginEntity userDetails) async {
    cacheMap[CACHE_STORE_DETAILS_KEY] = CachedItem(userDetails);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<LoginEntity> getUsereDetailsFromDB() async {
    final user = await _userDetailsDao.getUserDetails();
    if (user != null) {
      return user;
    } else {
      throw ErrorHandler.handle(ErrorType.CACHE_ERROR);
    }
  }

  @override
  Future<void> insertUserDetailsToDB(LoginEntity userDetails) async {
    await _userDetailsDao.insertUser(userDetails);
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    // expirationTime is 60 secs
    int currentTimeInMillis =
        DateTime.now().millisecondsSinceEpoch; // time now is 1:00:00 pm

    bool isCacheValid = currentTimeInMillis - expirationTime <
        cacheTime; // cache time was in 12:59:30
    // false if current time > 1:00:30
    // true if current time <1:00:30
    return isCacheValid;
  }
}
