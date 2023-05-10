import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 360,
                height: 360,
                color: Colors.transparent,
                child: Image.asset("assets/images/img.jpg"),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome to our \n Grocery app',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 30,fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Our goal is to always provide you with \n fresh and quality products.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 15, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 80),
            MyButton(
              text: 'Next',
              onTap: () {
                Navigator.pushNamed(context, '/signup_page');
              },
            ),
            const SizedBox(height: 10),
            MyButton(
              text: 'Skip',
              onTap: () {
                Navigator.pushNamed(context, '/signup_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}