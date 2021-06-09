import 'package:flutter/material.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';
import 'package:ganna/screens/song_screen/song_screen.dart';

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
        '/': (context) => HomeScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
