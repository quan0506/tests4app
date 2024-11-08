import 'package:flutter/material.dart';
import '../data/models/customer_model.dart';
import '../data/repositories/customer_repository.dart';

class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final CustomerRepository customerRepository = CustomerRepository();
  List<Customer> customers = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCustomers();
  }

  void _fetchCustomers() async {
    try {
      final List<Customer> fetchedCustomers = await customerRepository.fetchCustomers();
      setState(() {
        customers = fetchedCustomers;
      });
    } catch (error) {
      print('Error fetching customers: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi tải danh sách khách hàng')),
      );
    }
  }

  void _deleteCustomer(int id) async {
    try {
      await customerRepository.deleteCustomer(id);
      _fetchCustomers(); // Refresh list
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Khách hàng đã được xoá')),
      );
    } catch (error) {
      print('Error deleting customer: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi xoá khách hàng')),
      );
    }
  }

  void _addCustomer() {
    _showCustomerDialog();
  }

  void _editCustomer(Customer customer) {
    _showCustomerDialog(customer: customer);
  }

  void _showCustomerDialog({Customer? customer}) {
    final _fullNameController = TextEditingController(text: customer?.fullName ?? '');
    final _emailController = TextEditingController(text: customer?.email ?? '');
    final _addressController = TextEditingController(text: customer?.address ?? '');
    final _phoneController = TextEditingController(text: customer?.phoneNumber ?? '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(customer == null ? 'Thêm Khách Hàng' : 'Sửa Khách Hàng'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(labelText: 'Họ và Tên'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Địa chỉ'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Số điện thoại'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Huỷ'),
            ),
            TextButton(
              onPressed: () async {
                // Validate dữ liệu
                if (_fullNameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _addressController.text.isEmpty ||
                    _phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Vui lòng điền đầy đủ thông tin.')),
                  );
                  return;
                }

                final newCustomer = Customer(
                  id: customer?.id ?? 0,
                  fullName: _fullNameController.text.trim(),
                  email: _emailController.text.trim(),
                  address: _addressController.text.trim(),
                  phoneNumber: _phoneController.text.trim(),
                  // createdAt: customer?.createdAt ?? DateTime.now().toString(),
                );


                try {
                  if (customer == null) {
                    final addedCustomer = await customerRepository.addCustomer(newCustomer);
                    setState(() {
                      customers.add(addedCustomer);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Khách hàng đã được thêm thành công!')),
                    );
                  } else {
                    if (customer.id != null) {
                      final updatedCustomer = await customerRepository.updateCustomer(customer.id!, newCustomer);
                      setState(() {
                        final index = customers.indexWhere((c) => c.id == customer.id);
                        if (index != -1) {
                          customers[index] = updatedCustomer;
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Khách hàng đã được cập nhật thành công!')),
                      );
                    } else {
                      print('Cannot update customer: ID is null');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Không thể cập nhật khách hàng: ID không hợp lệ')),
                      );
                    }
                  }
                  Navigator.of(context).pop();
                  _fetchCustomers();
                } catch (error) {
                  print('Error saving customer: $error');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lỗi khi lưu khách hàng: $error')),
                  );
                }
              },
              child: Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  void _searchCustomers(String name) async {
    try {
      final List<Customer> searchResults = await customerRepository.searchCustomersByName(name);
      setState(() {
        customers = searchResults;
      });
    } catch (error) {
      print('Error searching customers: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi tìm kiếm khách hàng')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Khách hàng'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Tìm kiếm theo tên',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                _searchCustomers(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(customer.fullName, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${customer.email}'),
                        Text('Địa chỉ: ${customer.address}'),
                        Text('Số điện thoại: ${customer.phoneNumber}'),
                        // Text('Ngày tạo: ${customer.createdAt}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editCustomer(customer),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteCustomer(customer.id!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCustomer,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Thêm khách hàng mới',
      ),
    );
  }
}
