import 'package:Maruthuvan/pages/detect.dart';
import 'package:Maruthuvan/pages/explore.dart';
import 'package:Maruthuvan/pages/homescreen.dart';
import 'package:flutter/material.dart';

final Map<Widget, Widget> pages = {
  Icon(Icons.home, size: 30): HomeScreen(),
  Icon(Icons.center_focus_strong, size: 30): Detect(),
};
