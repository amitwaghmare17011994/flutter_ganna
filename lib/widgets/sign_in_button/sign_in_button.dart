import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInBUtton extends StatelessWidget {
  const SignInBUtton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
          child: CircleAvatar(child: FaIcon(FontAwesomeIcons.google))),
      Padding(
          padding: EdgeInsets.only(left: 30),
          child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: FaIcon(FontAwesomeIcons.facebookF)))),
      Padding(
          padding: EdgeInsets.only(left: 30),
          child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child:
                      FaIcon(FontAwesomeIcons.twitter, color: Colors.white)))),
      Padding(
          padding: EdgeInsets.only(left: 30),
          child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                  child:
                      FaIcon(FontAwesomeIcons.instagram, color: Colors.white))))
    ]);
  }
}
