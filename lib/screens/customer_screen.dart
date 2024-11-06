import 'package:flutter/material.dart';

class Customer {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String createdAt;

  Customer({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.createdAt,
  });
}

class CustomerScreen extends StatelessWidget {
  final List<Customer> customers = [
    Customer(
      name: "Nguyễn Văn A",
      email: "a@gmail.com",
      address: "123 cầu giấy hà nội",
      phoneNumber: "0123456789",
      createdAt: "2024-01-01",
    ),
    Customer(
      name: "Trần Thị B",
      email: "b@edu.com",
      address: "456 mỹ đình đông lào",
      phoneNumber: "0987654321",
      createdAt: "2024-02-02",
    ),
  ];

  void _deleteCustomer(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Xác nhận'),
        content: Text('Bạn có chắc chắn muốn xoá khách hàng này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close dialog
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              customers.removeAt(index);
              Navigator.of(context).pop(); // Close dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Khách hàng đã được xoá')),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _addCustomer(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Khách hàng',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${customer.email}'),
                  Text('Địa chỉ: ${customer.address}'),
                  Text('Số điện thoại: ${customer.phoneNumber}'),
                  Text('Ngày tạo: ${customer.createdAt}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteCustomer(context, index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addCustomer(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Thêm khách hàng mới',
      ),
    );
  }
}
