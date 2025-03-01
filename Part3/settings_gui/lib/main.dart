import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row - WiFi & Battery Icons (Simulating System UI)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                     Text(
                        "10:00", // Simulated Time Display
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Row(
                        children: [
                          Icon(Icons.wifi, color: Colors.black, size: 22),
                          SizedBox(width: 8),
                          Icon(Icons.battery_full, color: Colors.black, size: 22),
                        ],
                      ),
                    ],
                    )
                ],
              )
              )
            ),
          title: Text('Settings Page'),
        ),
      ),
      body: Center(
        child: Text('Settings Page'),
          
        ),
      
    );
  }
}