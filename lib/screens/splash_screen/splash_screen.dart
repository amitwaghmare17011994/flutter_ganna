import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(
                  context, SlideRightRoute(page: HomeScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.redAccent),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.music_note, size: 50),
                      backgroundColor: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text('Gaana',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic))
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'Gaana Hai To Sab Hai !',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ))
          ],
        )
      ],
    ));
  }
}
