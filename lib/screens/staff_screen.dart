import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/navigation_bar.dart';

class StaffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nhân viên',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppNavigationDrawer(),
      // bottomNavigationBar: NavigationBarApp(),
      body: Center(
        child: Text(
          'Quan ly nhân viên',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
