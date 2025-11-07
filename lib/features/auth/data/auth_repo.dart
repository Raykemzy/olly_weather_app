import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:olly_weather_app/core/errors/app_error.dart';
import 'package:olly_weather_app/core/utils/typedefs.dart';

class AuthRepo {
  // Simulate a database of users mapped to their hashed passwords
  final Map<String, String> _users = {
    'user@email.com': _hashPassword('password123'),
  };

  Future<BaseResponse<bool>> signup(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final hashedPassword = _hashPassword(password);
      if (_users.containsKey(email)) {
        return (success: false, message: 'Email already exists', data: false);
      }
      _users[email] = hashedPassword;
      return (success: true, message: 'Signup successful', data: true);
    } catch (e) {
      return AppError.handleError<bool>(false);
    }
  }

  static String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Future<BaseResponse<bool>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final hashedPassword = _hashPassword(password);
      final storedHashedPassword = _users[email];
      final isAuthenticated = storedHashedPassword == hashedPassword;
      if (!isAuthenticated) {
        return (
          success: false,
          message: 'Invalid email or password',
          data: false,
        );
      }
      return (
        success: isAuthenticated,
        message: 'Login successful',
        data: true,
      );
    } catch (e) {
      return AppError.handleError<bool>(false);
    }
  }
}
