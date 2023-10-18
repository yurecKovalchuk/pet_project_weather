import 'package:flutter/material.dart';

import 'package:weather/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    City? selectedCity,
    required this.builder,
  });

  final Widget Function(int index) builder;

  static void selectTab(BuildContext context, int index) {
    context.findAncestorStateOfType<_HomeScreenState>()?._changeIndex(index);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.builder.call(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _changeIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "weather",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "menu",
          ),
        ],
      ),
    );
  }

  void _changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
