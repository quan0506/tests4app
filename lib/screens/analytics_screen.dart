import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/navigation_drawer.dart';
// import '../widgets/navigation_bar.dart';

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String _selectedTimeframe = '1 tháng'; // Khoảng thời gian mặc định

  void _selectTimeframe(String timeframe) {
    setState(() {
      _selectedTimeframe = timeframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thống kê',
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
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Thống kê doanh thu - $_selectedTimeframe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          _buildRevenueChart(),
          Expanded(
            child: _buildStatisticsList(),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingMenu(),
    );
  }

  // Biểu đồ đơn giản
  Widget _buildRevenueChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 200,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 1.5),
                  FlSpot(2, 1.4),
                  FlSpot(3, 3.4),
                  FlSpot(4, 2),
                  FlSpot(5, 2.2),
                  FlSpot(6, 1.8),
                ],
                isCurved: true,
                barWidth: 4,
                color: Colors.blue,
                dotData: FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Danh sách thông kê
  Widget _buildStatisticsList() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        ListTile(
          title: Text('Tổng doanh thu'),
          trailing: Text('100,000,000 VND'),
        ),
        ListTile(
          title: Text('Tổng chi phí'),
          trailing: Text('50,000,000 VND'),
        ),
        ListTile(
          title: Text('Lợi nhuận'),
          trailing: Text('50,000,000 VND'),
        ),
        Divider(),
        ListTile(
          title: Text('Số lượng khách hàng'),
          trailing: Text('200'),
        ),
        ListTile(
          title: Text('Số lượng nhân viên'),
          trailing: Text('15'),
        ),
        // Thêm các mục thống kê khác tại đây
      ],
    );
  }

  // Nút 3-dots ở góc dưới phải để chọn khoảng thời gian
  Widget _buildFloatingMenu() {
    return FloatingActionButton(
      onPressed: () {
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(100, 100, 10, 100),
          items: [
            PopupMenuItem(
              value: '1 tháng',
              child: Text('1 tháng'),
            ),
            PopupMenuItem(
              value: '3 tháng',
              child: Text('3 tháng'),
            ),
            PopupMenuItem(
              value: '6 tháng',
              child: Text('6 tháng'),
            ),
          ],
        ).then((value) {
          if (value != null) {
            _selectTimeframe(value);
          }
        });
      },
      child: Icon(Icons.more_vert),
    );
  }
}
