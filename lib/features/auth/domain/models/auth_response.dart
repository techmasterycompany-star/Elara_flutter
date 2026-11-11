import 'customer.dart';

class AuthResponse {
  final String token;
  final Customer customer;

  AuthResponse({
    required this.token,
    required this.customer,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : json;
    final customerJson = (data['customer'] ?? data['user'] ?? data)
        as Map<String, dynamic>;
    return AuthResponse(
      token: (data['token'] ?? json['token'] ?? '').toString(),
      customer: Customer.fromJson(customerJson),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'customer': customer.toJson(),
      };
}

