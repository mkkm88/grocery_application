import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

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
              'Congratulation!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 16),
            const Text(
              'You can now choose the product you \n want and order it. We guarantee the \n quality of our products.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 15, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 72),
            MyButton(
              text: 'Start shopping now!',
              onTap: () {
                Navigator.pushNamed(context, '/home_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}