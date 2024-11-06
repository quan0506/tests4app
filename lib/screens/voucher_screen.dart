// voucher_screen.dart
import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/bottom_navbar.dart';

class VoucherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Voucher khuyến mãi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppNavigationDrawer(),
      body: Center(
        child: Text(
          'Quản lý voucher',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
