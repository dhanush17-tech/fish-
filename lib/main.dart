import 'package:Maruthuvan/utils/routes.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Man());
}

class Man extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Maruthuvan',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: MainApp());
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final PageController _pageController = PageController();
  int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          children: pages.values.toList(),
          onPageChanged: (int index) {
            setState(() {
              _index = index;
              _pageController.jumpToPage(index);
            });
          }),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        index: _index,
        items: pages.keys.toList(),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xFFB5DFEA),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int index) {
          setState(() {
            _index = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
