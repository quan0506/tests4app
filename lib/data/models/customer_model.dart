class Customer {
  final int id;
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  final String createdAt;

  Customer({
    required this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      createdAt: json['createdAt'],
    );
  }

  get name => null;

  // Hàm để chuyển từ Customer object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt,
    };
  }
}
