import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';

class MiddleWare extends StatefulWidget {
  const MiddleWare({Key? key}) : super(key: key);

  @override
  _MiddleWareState createState() => _MiddleWareState();
}

class _MiddleWareState extends State<MiddleWare> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => {
              Navigator.pushReplacement(
                  context, SlideRightRoute(page: HomeScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
