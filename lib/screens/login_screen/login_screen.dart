import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/provider/google_sign_in_provider.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';
import 'package:ganna/screens/login_screen/middleware.dart';
import 'package:ganna/screens/splash_screen/splash_screen.dart';
import 'package:ganna/widgets/sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScren extends StatefulWidget {
  const LoginScren({Key? key}) : super(key: key);

  @override
  _LoginScrenState createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  final googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: Column(
          children: [
            Spacer(),
            Center(
                child: CircleAvatar(
              child: Icon(Icons.music_note, size: 50),
              radius: 50,
            )),
            Spacer(),
            Spacer(),

            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: true);

                if (snapshot.hasData) {
                  return MiddleWare();
                }

                return SignInBUtton();
              },
            ),

            Spacer(),

            // Padding(
            //     padding: EdgeInsets.only(top: 0),
            //     child: StreamBuilder(
            //       stream: FirebaseAuth.instance.authStateChanges(),
            //       builder:
            //           (BuildContext context, AsyncSnapshot<User?> snapshot) {
            //         final provider = Provider.of<GoogleSignInProvider>(context,
            //             listen: true);

            //         if (snapshot.hasData) {
            //           return MiddleWare();
            //         }

            //         return SignInBUtton();
            //       },
            //     )),
            // Icon(Icons.music_note, size: 100),

            // Spacer(),
          ],
        ),
      ),
    );
  }
}
