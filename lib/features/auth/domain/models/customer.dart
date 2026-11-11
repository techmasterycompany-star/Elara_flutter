class Address {
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  Address({
    this.street = '123 Main St',
    this.city = 'Metropolis',
    this.state = 'Ottawa',
    this.country = 'Canada',
    this.postalCode = '1024',
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String? ?? '',
        city: json['city'] as String? ?? '',
        state: json['state'] as String? ?? '',
        country: json['country'] as String? ?? '',
        postalCode: json['postalCode'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
        'country': country,
        'postalCode': postalCode,
      };
}

class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final Address? address;

  Customer({
    this.id = '',
    required this.name,
    required this.email,
    required this.phone,
    this.address,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: (json['id'] ?? json['_id'] ?? '').toString(),
        name: (json['name'] ?? '').toString(),
        email: (json['email'] ?? '').toString(),
        phone: (json['phone'] ?? '').toString(),
        address: json['address'] is Map<String, dynamic>
            ? Address.fromJson(json['address'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        if (id.isNotEmpty) 'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        if (address != null) 'address': address!.toJson(),
      };
}

