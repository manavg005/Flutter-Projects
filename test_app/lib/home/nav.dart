import 'package:flutter/material.dart';
import 'package:test_app/home.dart';
import 'package:test_app/home/history.dart';
import 'package:test_app/home/mainscreen.dart';
import 'package:test_app/home/profile.dart';

import 'help.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const MyScreen(),
    const MyHistory(),
    const HelpPage(),
    const MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBody: true,
        //it lets body extends to the bottom, instead of only extending to the top of bottomNavigationBar
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help),
                  label: 'Help',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.orange,
              showUnselectedLabels: true,
            ),
          ),
        ));
  }
}
