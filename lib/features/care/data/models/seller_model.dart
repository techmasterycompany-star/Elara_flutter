class SellerModel {
  final String id;
  final String name;
  final String email;

  const SellerModel({
    required this.id,
    required this.name,
    required this.email,
  });
  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
