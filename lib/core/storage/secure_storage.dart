import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  FlutterSecureStorage? _secureStorage;

  SecureStorage._private();

  static final _instance = SecureStorage._private();

  factory SecureStorage() {
    return _instance;
  }

  /// Initialize SecureStorage (MUST be awaited before use)
  Future<void> init() async {
    _secureStorage = const FlutterSecureStorage();
  }

  /// Store a value securely
  Future<void> setValue(String key, String value) async {
    await _secureStorage?.write(key: key, value: value);
  }

  /// Retrieve a securely stored value
  Future<String?> getValue(String key) async {
    return await _secureStorage?.read(key: key);
  }

  /// Check if a key exists
  Future<bool> containsKey(String key) async {
    return await _secureStorage?.containsKey(key: key) ?? false;
  }

  /// Remove a securely stored entry
  Future<void> removeEntry(String key) async {
    await _secureStorage?.delete(key: key);
  }

  /// Clear all secure storage data
  Future<void> clearAll() async {
    await _secureStorage?.deleteAll();
  }
}
