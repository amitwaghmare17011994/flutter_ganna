import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ganna/animations/slide_right_route/slide_right_route.dart';
import 'package:ganna/screens/home_screen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  late bool loading;
  GoogleSignInProvider() {
    loading = false;
  }

  bool get isLoading => loading;

  set isLoading(bool _isLoading) {
    loading = _isLoading;
    notifyListeners();
  }

  Future login(BuildContext context) async {
    loading = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      loading = false;
      return false;
    } else {
      final googleAuth = await user.authentication;
      final creds = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(creds);
      loading = false;
      Navigator.pushReplacement(context, SlideRightRoute(page: HomeScreen()));
      return true;
    }
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
