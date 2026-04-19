import 'package:flutter/material.dart';
import 'home_screen.dart'; // سنقوم بإنشاء هذا الملف الآن

void main() => runApp(SamaqApp());

class SamaqApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAMAQ',
      theme: ThemeData.dark(), // سنجعله ليلياً بشكل افتراضي لعشاق المانهوا
      home: SAMAQMainScreen(),
    );
  }
}
