// secure_storage.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  // Write tokens
  static Future<void> setAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  static Future<void> setRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // Read tokens
  static Future<String?> get accessToken async =>
      await _storage.read(key: _accessTokenKey);

  static Future<String?> get refreshToken async =>
      await _storage.read(key: _refreshTokenKey);

  // Delete tokens
  static Future<void> deleteAll() async => await _storage.deleteAll();

  // Check if logged in
  static Future<bool> get hasToken async => (await accessToken) != null;
}