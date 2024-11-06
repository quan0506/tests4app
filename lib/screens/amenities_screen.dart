import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/navigation_bar.dart';

class AmenitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tiện nghi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppNavigationDrawer(),
      bottomNavigationBar: NavigationBarApp(),
      // bottomNavigationBar: NavigationBarApp(),
      body: Center(
        child: Text(
          'Quan ly tiện nghi',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
