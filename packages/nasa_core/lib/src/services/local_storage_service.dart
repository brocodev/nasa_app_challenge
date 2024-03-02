import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum LocalKeys { uuid, qrCode }

/// Service that saves the values required in the app in memory
class LocalStorageService {
  const LocalStorageService();

  FlutterSecureStorage get _secureStorage => const FlutterSecureStorage();

  /// Delete all values saved in storage
  Future<void> clearStorage() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e, s) {
      log('Error on delete storage', error: e, stackTrace: s);
      rethrow;
    }
  }

  /// Save the value assigned through the parameter
  Future<void> saveValue(LocalKeys key, String value) async {
    try {
      await _secureStorage.write(key: key.name, value: value);
    } catch (e, s) {
      log('Error on save value $key', error: e, stackTrace: s);
      rethrow;
    }
  }

  /// Returns the value as long as it is stored in the cache
  Future<String?> getValue(LocalKeys key) async {
    try {
      return _secureStorage.read(key: key.name);
    } catch (e, s) {
      log('Error on get $key', error: e, stackTrace: s);
      return null;
    }
  }
}
