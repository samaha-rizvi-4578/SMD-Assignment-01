import 'package:flutter/material.dart';

void main() {
  runApp(const PlayStoreApp());
}

class PlayStoreApp extends StatelessWidget {
  const PlayStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> games = [
    {
      'title': 'Join Clash 3D',
      'details': 'Arcade • 4.0 ★ • 61 MB',
      'icon': 'assets/join_clash.png'
    },
    {
      'title': 'Yalla Ludo',
      'details': 'Board • 4.3 ★ • 104 MB',
      'icon': 'assets/yalla_ludo.png'
    },
    {
      'title': 'PUBG MOBILE - DREAM TEAM',
      'details': 'Action • 4.2 ★ • 626 MB',
      'icon': 'assets/pubg.png'
    },
    {
      'title': '8 Ball Pool',
      'details': 'Sports • Installed',
      'icon': 'assets/8ball.png'
    },
    {
      'title': 'Subway Surfers',
      'details': 'Arcade • 4.4 ★ • 137 MB',
      'icon': 'assets/subway.png'
    },
    {
      'title': 'Water Color Sort',
      'details': 'Puzzle • 4.1 ★ • 13 MB',
      'icon': 'assets/water_sort.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search for apps & games',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.mic, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          actions: [
            CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: [
              Tab(text: 'For You'),
              Tab(text: 'Top Charts'),
              Tab(text: 'Premium'),
              Tab(text: 'Categories'),
            ],
          ),
        ),
        body: Column(
          children: [
            TabBarSection(),
            Expanded(
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("${index + 1}"),
                      ),
                    ),
                    title: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(games[index]['icon']!,
                              width: 50, height: 50),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(games[index]['title']!,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(games[index]['details']!),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Games'),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Apps'),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterChip(
            label: Text('Top free'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onSelected: (value) {},
            selectedColor: Colors.lightGreen[100],
            selected: true,
            showCheckmark: false,
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 12, 110, 15),
              fontWeight: FontWeight.bold,
            ),
          ),
          FilterChip(
            label: Text('Categories'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onSelected: (value) {},
            selectedColor: Colors.lightGreen[100],
            selected: false,
            showCheckmark: false,
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 84, 84, 84),
              fontWeight: FontWeight.bold,
            ),
          ),
          FilterChip(
            label: Text('New'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onSelected: (value) {},
            selectedColor: Colors.lightGreen[100],
            selected: false,
            showCheckmark: false,
            labelStyle: TextStyle(
              color: const Color.fromARGB(255, 84, 84, 84),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}