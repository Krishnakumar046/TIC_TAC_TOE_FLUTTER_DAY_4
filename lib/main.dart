import 'package:flutter/material.dart';
import 'package:flutter_day_4/src/features/tictactoe/presentation/tictactoe_homescreen.dart';
import 'package:flutter_day_4/src/features/tictactoe/widget/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TICTACTOE",
        debugShowCheckedModeBanner:false,
      home: SplashScreen(),

    );
  }
}

