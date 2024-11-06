import 'package:flutter/material.dart';
import 'package:tests4app/screens/room_screen.dart';
import '../widgets/navigation_drawer.dart';
// import '../widgets/navigation_bar.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dịch vụ',
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: Icon(Icons.explore, color: Colors.blue),
              title: Text('Đặt xe di chuyển', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.explore, color: Colors.blue),
              title: Text('Đặt bàn nhà hàng',  style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.explore, color: Colors.blue),
              title: Text('Đặt lịch spa',  style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Thêm Dịch Vụ'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Tên Dịch Vụ'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Giá tiền'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Mô Tả'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Hủy'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Lưu'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
