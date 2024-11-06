import 'package:flutter/material.dart';
import 'package:tests4app/screens/amenities_screen.dart';
import 'package:tests4app/screens/analytics_screen.dart';
import 'package:tests4app/screens/branch_screen.dart';
import 'package:tests4app/screens/comment_screen.dart';
import 'package:tests4app/screens/customer_screen.dart';
import 'package:tests4app/screens/home_screen.dart';
import 'package:tests4app/screens/room_screen.dart';
import 'package:tests4app/screens/service_screen.dart';
import 'package:tests4app/screens/setting_screen.dart';
import 'package:tests4app/screens/staff_screen.dart';
import 'package:tests4app/screens/voucher_screen.dart';

class AppNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Navigation Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Trang Chủ'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.loyalty),
            title: Text('Chi nhánh'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BranchScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.meeting_room),
            title: Text('Đặt - Trả Phòng'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RoomScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Khách hàng'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CustomerScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Text('Tiện nghi'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AmenitiesScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.paid),
            title: Text('Dịch vụ'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ServiceScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.paid),
            title: Text('Khuyến mãi - Giảm giá'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => VoucherScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.signal_cellular_alt),
            title: Text('Thống kê'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AnalyticsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.groups),
            title: Text('Nhân viên'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => StaffScreen()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Bình luận & Đánh giá'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CommentScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

