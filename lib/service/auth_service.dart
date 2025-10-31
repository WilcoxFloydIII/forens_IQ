import 'package:forens_iq/service/secure_storage_service.dart';

class AuthService {
  static final SecureStorageService _storage = SecureStorageService();

  /// Check if the user is signed in securely
  static Future<bool> checkAuthStatus() async {
    return await _storage.getSignInState();
  }

  /// Mark user as signed in
  static Future<void> signIn() async {
    await _storage.saveSignInState(true);
  }

  /// Mark user as signed out
  static Future<void> signOut() async {
    await _storage.saveSignInState(false);
  }
}