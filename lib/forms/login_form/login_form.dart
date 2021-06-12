import 'package:flutter/material.dart';
import 'package:ganna/screens/splash_screen/splash_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter valid mail id as abc@gmail.com'),
            ),
            // color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your secure password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SplashScreen()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
