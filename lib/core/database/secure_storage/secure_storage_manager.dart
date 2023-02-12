import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
FlutterSecureStorage secureStorage = Get.find<FlutterSecureStorage>();

class SecureStorageManager {
  static SecureStorageManager get find => Get.find<SecureStorageManager>();

  final String _tokenKey = 'token';
  final String _refreshTokenKey = 'refresh_token';

  Future<bool> isLoggedIn() async {
    return (await getToken() != '');
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }

  Future setToken({required String? value}) async {
    return await secureStorage.write(key: _tokenKey, value: value);
  }

  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: _refreshTokenKey);
  }

  Future setRefreshToken({required String? value}) async {
    return await secureStorage.write(key: _refreshTokenKey, value: value);
  }

  Future logout() async {
    await setToken(value: '');
    await setRefreshToken(value: '');
  }
}
