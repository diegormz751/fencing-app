import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/combats_screen.dart';
import 'providers/fencers_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => FencersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF2B5096),
          // ignore: deprecated_member_use
          accentColor: Color(0xFFDDD8B8),
          canvasColor: Color(0xFF84A9C0),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            headline3: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            headline4: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: HomeScreen(),
        routes: {
          CombatsScreen.route: (ctx) => CombatsScreen(),
          // FencerInfoScreen.route: (ctx) => FencerInfoScreen(),
        },
      ),
    );
  }
}
