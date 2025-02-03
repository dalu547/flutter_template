import 'package:flutter/material.dart';

import 'bottom_screens/calendar_screen.dart';
import 'bottom_screens/home_screen.dart';
import 'bottom_screens/profile_screen.dart';
import 'bottom_screens/setting_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  MainHomeScreenState createState() => MainHomeScreenState();
}

class MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    HomeScreen(),
    CalendarScreen(),
    // Center(child: Text('Add Habit', style: TextStyle(fontSize: 24))),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digitele Flutter Template'),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.add),
          //   label: 'Add Habit',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
