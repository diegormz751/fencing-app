import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2B50AA),
        accentColor: Color(0xFFDDD8B8),
        canvasColor: Color(0xFF84A9C0),
      ),
      home: Home(),
    );
  }
}
