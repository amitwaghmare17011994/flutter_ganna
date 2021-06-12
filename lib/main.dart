import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';
import 'package:ganna/screens/login_screen/login_screen.dart';
import 'package:ganna/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final user = FirebaseAuth.instance.currentUser;

  runApp(MyApp(
    initialRoute: user != null ? '/splash' : '/login',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScren()
      },
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}
