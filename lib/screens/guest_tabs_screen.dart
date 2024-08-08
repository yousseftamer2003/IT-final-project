import 'package:flutter/material.dart';
import 'package:hacker_rank_final/screens/committees_screen.dart';
import 'package:hacker_rank_final/screens/guest_home_screen.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class GuestTabsScreen extends StatefulWidget {
  const GuestTabsScreen({super.key});

  @override
  State<GuestTabsScreen> createState() => _GuestTabsScreenState();
}

class _GuestTabsScreenState extends State<GuestTabsScreen> with TickerProviderStateMixin{
MotionTabBarController? _motionTabBarController;
  @override
  void initState() {
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }
  Widget _buildBody() {
    switch (_motionTabBarController!.index) {
      case 0:
        return const ControlScreen();
      case 1:
        return const GuestHomeScreen(); 
      case 2:
        return const CommitteesScreen(); 
      default:
        return const GuestHomeScreen(); 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        labels: const ["Learning Hub", "Home", "Committees"],
        icons: const [Icons.school,Icons.home,Icons.group],
    tabSize: 50,
    tabBarHeight: 55,
    textStyle: const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    tabIconColor: Colors.green[600],
    tabIconSize: 28.0,
    tabIconSelectedSize: 26.0,
    tabSelectedColor: Colors.green[900],
    tabIconSelectedColor: Colors.white,
    tabBarColor: Colors.white,
    onTabItemSelected: (int value) {
      setState(() {
        _motionTabBarController!.index = value;
      });
    },
    ),
    );
  }
}

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('learning hub'),
      ),
    );
  }
}