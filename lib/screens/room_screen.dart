import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
// import '../widgets/navigation_bar.dart';

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đặt - Trả Phòng',
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
          'Quan ly phòng',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
