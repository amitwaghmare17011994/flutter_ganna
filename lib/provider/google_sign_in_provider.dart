import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  late bool loading;
  GoogleSignInProvider() {
    loading = false;
  }

  bool get isLoading => loading;

  set isLoading(bool _isLoading) {
    isLoading = _isLoading;
    notifyListeners();
  }

  Future login() async {
    loading = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      loading = false;
      return;
    } else {
      final googleAuth = await user.authentication;
      final creds = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(creds);
      loading = false;
    }
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
