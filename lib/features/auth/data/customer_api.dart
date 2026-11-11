import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/models/auth_response.dart';
import '../domain/models/customer.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  @override
  String toString() => 'AuthException: $message';
}

class CustomerApi {
  // Replace https://api.yourdomain.com (or https://elara-node.vercel.app/api) with your real host
  static const String _baseUrl = 'https://elara-node.vercel.app/api';

  final http.Client _client;
  CustomerApi({http.Client? client}) : _client = client ?? http.Client();

  /// POST /auth/login
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('$_baseUrl/auth/login');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return _processResponse(response);
  }

  /// POST /auth/register (or /auth/signup)
  Future<AuthResponse> signup({
    required Customer customer,
    required String password,
  }) async {
    final uri = Uri.parse('$_baseUrl/auth/register');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': customer.name,
        'email': customer.email,
        'password': password,
        'phone': customer.phone,
        'address': (customer.address ?? Address()).toJson(),
      }),
    );
    return _processResponse(response);
  }

  /// POST /auth/register-seller
  Future<AuthResponse> registerSeller({
    required Customer customer,
    required String password,
  }) async {
    final uri = Uri.parse('$_baseUrl/auth/register-seller');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': customer.name,
        'email': customer.email,
        'password': password,
        'phone': customer.phone,
        'address': (customer.address ?? Address()).toJson(),
      }),
    );
    return _processResponse(response);
  }

  /// POST /auth/send-otp
  Future<void> sendOtp({required String email}) async {
    final uri = Uri.parse('$_baseUrl/auth/send-otp');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AuthException('Failed to send OTP: ${response.body}');
    }
  }

  /// POST /auth/confirm-email (or /auth/verify-otp)
  Future<AuthResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    final uri = Uri.parse('$_baseUrl/auth/confirm-email');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'token': otp, 'otp': otp}),
    );
    return _processResponse(response);
  }

  /// POST /auth/reset-password
  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    final uri = Uri.parse('$_baseUrl/auth/reset-password');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'otp': otp,
        'newPassword': newPassword,
      }),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AuthException('Password reset failed: ${response.body}');
    }
  }

  /// GET /auth/me
  Future<Customer> getMe({required String token}) async {
    final uri = Uri.parse('$_baseUrl/auth/me');
    final response = await _client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] is Map<String, dynamic>
          ? json['data'] as Map<String, dynamic>
          : json;
      return Customer.fromJson(data);
    } else {
      throw AuthException(
        'Server error (${response.statusCode}): ${response.body}',
      );
    }
  }

  /// POST /auth/logout
  Future<void> logout({required String token}) async {
    final uri = Uri.parse('$_baseUrl/auth/logout');
    final response = await _client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AuthException('Logout failed: ${response.body}');
    }
  }

  AuthResponse _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return AuthResponse.fromJson(json);
    } else {
      throw AuthException(
        'Server error (${response.statusCode}): ${response.body}',
      );
    }
  }

  void dispose() => _client.close();
}

