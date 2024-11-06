import 'package:flutter/material.dart';
import 'package:tests4app/screens/amenities_screen.dart';
import 'package:tests4app/screens/analytics_screen.dart';
import 'package:tests4app/screens/branch_screen.dart';
import 'package:tests4app/screens/comment_screen.dart';
import 'package:tests4app/screens/customer_screen.dart';
import 'package:tests4app/screens/login_screen.dart';
import 'package:tests4app/screens/room_screen.dart';
import 'package:tests4app/screens/service_screen.dart';
import 'package:tests4app/screens/setting_screen.dart';
import 'package:tests4app/screens/staff_screen.dart';
import 'package:tests4app/screens/voucher_screen.dart';
import '../widgets/navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  final List<IconData> icons = [
    Icons.loyalty,
    Icons.meeting_room,
    Icons.person,
    Icons.room_service,
    Icons.paid,
    Icons.branding_watermark,
    Icons.signal_cellular_alt,
    Icons.groups,
    Icons.question_answer,
    Icons.settings
  ];

  final List<String> texts = [
    'Chi Nhánh',
    'Đặt - Trả Phòng',
    'Khách hàng',
    'Tiện nghi',
    'Dịch vụ',
    'Khuyến Mãi - Giảm Giá',
    'Thống kê',
    'Nhân viên',
    'Bình Luận & Đánh giá',
    'Cài đặt'
  ];

  final List<Widget> screens = [
    BranchScreen(),
    RoomScreen(),
    CustomerScreen(),
    AmenitiesScreen(),
    ServiceScreen(),
    VoucherScreen(),
    AnalyticsScreen(),
    StaffScreen(),
    CommentScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quản lý',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_month),
            color: Colors.white,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      drawer: AppNavigationDrawer(),
      // bottomNavigationBar: ,
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(0.0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: List.generate(icons.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screens[index]),
              );
            },
            child: Container(
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    size: 40,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 4),
                  Text(
                    texts[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
