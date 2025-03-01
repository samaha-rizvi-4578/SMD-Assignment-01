import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @overgride
  Widget build(BuildContext context) {
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
        preferredSize: Size.fromHeight(300), // Increased AppBar height
        child: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  ),

                  SizedBox(height: 10),

                  // "Settings" Title with Expanded Spacer
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Spacer(), // Pushes icons to the right
                        Icon(Icons.search, color: Colors.black, size: 28),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual image
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            _buildTile(Icons.wifi, 'Connections', 'Wi-Fi, Bluetooth, Data usage', Colors.blue),
            SizedBox(height: 15),
            _buildGroupedTiles([
              _buildTile(Icons.volume_up, 'Sounds', 'Ringtone, Volume', Colors.purple),
              _buildTile(Icons.notifications, 'Notifications', 'App alerts, Do not disturb', Colors.orange),
            ]),
            SizedBox(height: 15),
            _buildGroupedTiles([
              _buildTile(Icons.display_settings, 'Display', 'Brightness, Blue light filter, Home screen', Colors.green),
              _buildTile(Icons.wallpaper, 'Wallpaper', 'Home screen wallpaper, Lock screen wallpaper', Colors.pink),
              _buildTile(Icons.palette, 'Themes', 'Themes, Wallpapers, Icons', Colors.deepPurple),
              _buildTile(Icons.lock, 'Lock screen', 'Screen lock, Always On Display, Clock style', Colors.blue),
            ]),
            SizedBox(height: 15),
            _buildGroupedTiles([
              _buildTile(Icons.security, 'Biometrics and security', 'Face recognition, Find My Mobile', Colors.indigo),
              _buildTile(Icons.privacy_tip, 'Privacy', 'Permission manager', Colors.blueGrey),
              _buildTile(Icons.location_on, 'Location', 'Location settings, Location requests', Colors.green),
              _buildTile(Icons.backup, 'Accounts and backup', 'Samsung Cloud, Smart Switch', Colors.blueAccent),
              _buildTile(Icons.settings, 'Google', 'Google settings', Colors.blue),
            ]),
            SizedBox(height: 15),
            _buildTile(Icons.settings_suggest, 'Advanced features', 'Motions and gestures, One-handed mode', Colors.orange),
            _buildTile(Icons.favorite, 'Digital Wellbeing and parental controls', 'Screen time, App timers, Wind Down', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, String subtitle, Color iconColor) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildGroupedTiles(List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(
          tiles.length * 2 - 1,
          (index) => index.isEven ? tiles[index ~/ 2] : Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        ),
      ),
    );
  }
}
