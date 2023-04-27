import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_example/page/home.dart';
import 'package:gorouter_example/page/settings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {});
          _selectedIndex = index;
          if (index == 0) {
            context.goNamed(HomePage.routeName);
          } else if (index == 1) {
            context.goNamed(SettingsPage.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  static const routeName = '/main';
}
