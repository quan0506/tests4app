import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/customer_model.dart';

class CustomerRepository {
  final String baseUrl = 'http://10.0.2.2:1234/api/customers';

  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  // Future<Customer> addCustomer(Customer customer) async {
  //   final response = await http.post(
  //     Uri.parse(baseUrl),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(customer.toJson()),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     return Customer.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to add customer');
  //   }
  // }

  Future<void> addCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse('$baseUrl/customers'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': customer.name,
        'email': customer.email,
        'address': customer.address,
        'phoneNumber': customer.phoneNumber,
        'createdAt': customer.createdAt,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add customer');
    }
  }


  Future<Customer> updateCustomer(int id, Customer customer) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(customer.toJson()),
    );

    if (response.statusCode == 200) {
      return Customer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update customer');
    }
  }

  Future<void> deleteCustomer(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete customer');
    }
  }

  Future<List<Customer>> searchCustomersByName(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/search?fullName=$name'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search customers');
    }
  }
}
