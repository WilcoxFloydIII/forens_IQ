import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Create a singleton instance for global access
  static final SecureStorageService _instance = SecureStorageService._internal();
  factory SecureStorageService() => _instance;
  SecureStorageService._internal();

  final _storage = const FlutterSecureStorage();

  // Keys
  static const _keyIsSignedIn = 'is_signed_in';

  /// Save user sign-in state
  Future<void> saveSignInState(bool isSignedIn) async {
    await _storage.write(key: _keyIsSignedIn, value: isSignedIn.toString());
  }

  /// Retrieve sign-in state
  Future<bool> getSignInState() async {
    final value = await _storage.read(key: _keyIsSignedIn);
    return value == 'true';
  }

  /// Clear sign-in data (e.g. on logout)
  Future<void> clearSignInState() async {
    await _storage.delete(key: _keyIsSignedIn);
  }
}
