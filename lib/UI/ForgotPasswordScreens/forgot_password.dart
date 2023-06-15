import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_button.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:email_auth/email_auth.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key,}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Forgot Password',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Poppins'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CircleAvatar(
             radius: 90,
             backgroundColor: Colors.transparent,
             child: Image.asset(
               'assets/images/forgot-password.png',
             ),
           ),
            const Spacer(),
            const Text(
              'Please Enter Your Email Address To \n Receive a Password Reset Link.',
              textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
                fontFamily: 'Poppins',)
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0.0),
              child: TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                ? 'Enter a valid Email'
                : null,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.grey[400], fontFamily: 'Poppins', fontSize: 20),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(13),
                  //   borderSide: const BorderSide(color: Colors.grey, width: 2),
                  // ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                      borderRadius: BorderRadius.circular(13)
                  ),
                ),
              ),
            ),
            // const Spacer(),
            // GestureDetector(
            //   onTap: () {},
            //     child: Text(
            //       'Try another way',
            //       style: TextStyle(
            //           decoration: TextDecoration.underline,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.grey[800],
            //           fontFamily: 'Poppins',
            //       ),
            //     )
            // ),
            const Spacer(),
            MyButton(
                onTap: () {
                  verifyEmail();
                },
                text: 'Send',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
  Future verifyEmail() async {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());

      _showSnackBar('Password Reset Email Sent');
      Navigator.popUntil(context, ModalRoute.withName('/login_page'));
    } on FirebaseAuthException catch (e) {
      print(e);

      _showSnackBar(e.message.toString());
      Navigator.of(context).pop();
    }
  }

  Future<void> _showSnackBar(String msg) async {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
