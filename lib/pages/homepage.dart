import 'package:flutter/material.dart';
import 'package:chat_app1/chatscreen/chatscreen.dart';
import 'package:chat_app1/chatscreen/contactscreen.dart';
import 'package:chat_app1/chatscreen/settingscreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [
    ChatScreen(),
    ContactScreen(),
    SettingsScreen(),
  ];

  void _onTabPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabPressed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
