import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/navigation_controller.dart';
import 'package:grocery_application/UI/pages/welcome_page.dart';

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
              return NavigationController();
            } // user not logged in
            else {
              return WelcomePage();
            }
          },
        )
    );
  }
}