import 'package:flutter/material.dart';
import 'package:tests4app/screens/analytics_screen.dart';
import 'package:tests4app/screens/branch_screen.dart';
import 'package:tests4app/screens/setting_screen.dart';
import '../widgets/navigation_drawer.dart';
// import '../widgets/navigation_bar.dart';


class AmenitiesScreen extends StatefulWidget {
  @override
  _AmenitiesScreenState createState() => _AmenitiesScreenState();
}

class _AmenitiesScreenState extends State<AmenitiesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
          'Tiện nghi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
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
      ),
      drawer: AppNavigationDrawer(),
      // bottomNavigationBar: NavigationBarApp(),
      body: TabBarView(
        controller: _tabController,
        children: [

        ],
      ),
    );
  }
}
