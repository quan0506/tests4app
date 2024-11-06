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
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AnalyticsScreen()),
          );
        } else if (_tabController.index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BranchScreen()),
          );
        } else if (_tabController.index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingScreen()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.signal_cellular_alt, color: Colors.white),
              child: Text('Thống kê', style: TextStyle(color: Colors.white)),
            ),
            Tab(
              icon: Icon(Icons.loyalty, color: Colors.white),
              child: Text('Chi nhánh', style: TextStyle(color: Colors.white)),
            ),
            Tab(
              icon: Icon(Icons.settings, color: Colors.white),
              child: Text('Cài đặt', style: TextStyle(color: Colors.white)),
            ),
          ],
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
      // bottomNavigationBar: BottomNavBar(), // Thêm thanh BottomNavBar
    );
  }
}
