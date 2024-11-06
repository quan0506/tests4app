import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
// import '../widgets/navigation_bar.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // State variables
  String dropdownValue = 'Option 1';
  bool checkboxValue = false;
  String radioValue = 'Option 1';
  double sliderValue = 0.5;
  double progressValue = 0.3;
  bool switchValue = false;
  TextEditingController textController = TextEditingController();

  // Dummy function for file upload button
  void _uploadFile() {
    // Logic for file upload would go here
    print('File uploaded');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cài đặt',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown
            Text(
              'Danh sách chọn:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Textbox
            Text(
              'Ô nhập liệu:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập nội dung...',
              ),
            ),
            SizedBox(height: 16),

            // Checkbox
            Text(
              'Hộp chọn:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text("Chọn tôi"),
              value: checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue = value!;
                });
              },
            ),
            SizedBox(height: 16),

            // Radio Button
            Text(
              'Nút chọn duy nhất:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Option 1'),
              leading: Radio<String>(
                value: 'Option 1',
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(() {
                    radioValue = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Option 2'),
              leading: Radio<String>(
                value: 'Option 2',
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(() {
                    radioValue = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16),

            // Slider
            Text(
              'Thanh trượt:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: sliderValue,
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
              min: 0,
              max: 1,
              divisions: 10,
              label: sliderValue.toString(),
            ),
            SizedBox(height: 16),

            // Progress Bar
            Text(
              'Thanh tiến trình:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),

            // File Upload Button
            Text(
              'Tải lên tệp:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Chọn tệp để tải lên'),
            ),
            SizedBox(height: 16),

            // Button
            Text(
              'Nút bấm:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                print("Button clicked!");
              },
              child: Text('Click Me'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
              ),
            ),
            SizedBox(height: 16),

            // Toggle Switch
            Text(
              'Nút bật tắt:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Bật / Tắt'),
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
