import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  late bool showLoader = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showLoader = false;
  }

  @override
  Widget build(BuildContext context) {
    return showLoader == true
        ? CircularProgressIndicator(
            color: Colors.white,
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                onTap: () async {
                  setState(() {
                    showLoader = true;
                  });
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  await provider.login(context);
                  setState(() {
                    showLoader = false;
                  });
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
                        child: FaIcon(FontAwesomeIcons.twitter,
                            color: Colors.white)))),
            Padding(
                padding: EdgeInsets.only(left: 30),
                child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                        child: FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.white))))
          ]);
  }
}
