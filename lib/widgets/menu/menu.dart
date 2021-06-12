import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:ganna/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(onSelected: (value) {
      final provider =
          Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();
      Timer(
          Duration(seconds: 1),
          () => {
                Navigator.pushReplacement(
                    context, SlideRightRoute(page: LoginScren()))
              });
    }, itemBuilder: (BuildContext context) {
      return Constants.choices.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    });
  }
}

class Constants {
  static const String fund = 'Fund';
//  static const String Settings = 'Settings';
  static const String SignOut = 'sign out';

  static const List<String> choices = <String>['sign out'];
}
