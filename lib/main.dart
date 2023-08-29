import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/auth/splash_screen.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      debugShowCheckedModeBanner: false,
      title: 'Vegas Brain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      home: const SplashScreen(),
    );
  }
}
