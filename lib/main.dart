import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:neurist_mobile/views/todos.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import './customs/theme.dart';
import './views/home.dart';

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
      theme: ThemeData.dark(),
      home: DoubleBack(
        background: AppColors.darkAccent,
        child: const Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      confineInSafeArea: true,
      screens: screens(),
      items: navBarItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
      backgroundColor: AppColors.darkAccent,
    );
  }

  List<Widget> screens() {
    return [
      const Home(),
      const Todos(),
    ];
  }
}

List<PersistentBottomNavBarItem> navBarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      iconSize: 22,
      textStyle: const TextStyle(fontSize: 12),
      title: 'Home',
      activeColorPrimary: AppColors.primaryAppColor3,
      inactiveColorPrimary: AppColors.primaryAppColor2,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.list_bullet),
      iconSize: 22,
      textStyle: const TextStyle(fontSize: 12),
      title: 'Todo',
      activeColorPrimary: AppColors.primaryAppColor3,
      inactiveColorPrimary: AppColors.primaryAppColor2,
    ),
  ];
}
