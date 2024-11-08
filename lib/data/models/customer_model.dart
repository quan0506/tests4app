class Customer {
  final int? id;
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  // final String? createdAt;

  Customer({
    required this.id,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    // required this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      // createdAt: json['createdAt'],
    );
  }

  get name => null;

  Map<String, dynamic> toJson() {
    return {
      if (id != null && id! > 0) 'id': id,
      'fullName': fullName.trim(),
      'email': email.trim(),
      'address': address.trim(),
      'phoneNumber': phoneNumber.trim(),
      // if (createdAt != null) 'createdAt': createdAt,
    };
  }


}

