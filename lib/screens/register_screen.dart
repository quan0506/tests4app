import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
// import '../widgets/navigation_bar.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đăng kí',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: AppNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Đăng kí đi cmmm !!!',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),

            TextField(
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(),
                ),
                prefixIcon: Icon(Icons.person),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),

            TextField(
              decoration: InputDecoration(
                labelText:'Địa Chỉ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(),
                ),
                prefixIcon: Icon(Icons.person_pin_circle),
              ),
            ),
            SizedBox(height: 16.0),

            TextField(
              decoration: InputDecoration(
                labelText:'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(),
                ),
                prefixIcon: Icon(Icons.phone_iphone),
              ),
            ),
            SizedBox(height: 16.0),

            // Text(
            //   'quên mật khẩu à ??',
            //   style: TextStyle(fontSize: 18),
            // ),
            ElevatedButton(
              onPressed: () {
                // logic login
              },
              child: Text("Đăng Ký",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('Nếu chưa có tài khoản? '),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => RegisterScreen()),
            //         );
            //       },
            //       child: Text(
            //         'Đăng ký',
            //         style: TextStyle(
            //           color: Colors.blue,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 24.0),
            // Divider(),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // logic login google
              },
              icon: Icon(Icons.login, color: Colors.black),
              label: Text('Đăng nhập bằng Google'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     // logic login facabook
            //   },
            //   icon: Icon(Icons.login, color: Colors.black),
            //   label: Text('Đăng nhập bằng Facebook'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.white,
            //     minimumSize: Size(double.infinity, 50),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
