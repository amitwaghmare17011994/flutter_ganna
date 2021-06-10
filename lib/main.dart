import 'package:flutter/material.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';
import 'package:ganna/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
