import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/Home/Home.dart';
import 'package:grocery_application/UI/NavigationController.dart';
import 'package:grocery_application/UI/pages/signup_page.dart';
import 'package:grocery_application/UI/pages/welcome_page.dart';
import 'package:grocery_application/UI/profile_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?> (
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user logged in
            if(snapshot.hasData) {
              return NavigatationController();
            } // user not logged in
            else {
              return WelcomePage();
            }
          },
        )
    );
  }
}