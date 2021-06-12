import 'package:flutter/material.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInBUtton extends StatelessWidget {
  const SignInBUtton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutlinedButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
          child: Text('Sign In With Google')),
    ]);
  }
}
