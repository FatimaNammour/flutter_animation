import 'package:flutter/material.dart';
import 'package:flutter_animation/core/theme/theme.dart';
import 'package:flutter_animation/pages/animated_builder_tab.dart';
import 'package:flutter_animation/pages/animation_cont.dart';
import 'package:flutter_animation/pages/animated_foo_widgets.dart';
import 'package:flutter_animation/pages/tween_paage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: currentPAge(_currentPageIndex)),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: "1",
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: "2",
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: "3",
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: "4",
            icon: Icon(Icons.abc),
          ),
        ],
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }

  Widget currentPAge(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return const TweenPage();
      case 2:
        return const AnimCont();
      case 3:
        return const AnimatedBuilderTab();
      default:
        return const HomeScreen();
    }
  }
}
