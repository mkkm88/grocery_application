import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../components/my_button.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify Your Email',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Poppins'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/mail.png',
              ),
            ),
            const Text(
              'Please Enter The 4 Digit Code Send To \n mohdkasimkhan1999@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
                fontFamily: 'Poppins'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: OtpTextField(
                    enabled: true,
                    keyboardType: TextInputType.number,
                    numberOfFields: 4,
                    textStyle: const TextStyle(color: Colors.black87),
                    showCursor: true,
                    cursorColor: Colors.lightGreen,
                    disabledBorderColor: Colors.lightBlue,
                    enabledBorderColor: Colors.grey,
                    focusedBorderColor: Colors.green,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    fieldWidth: 60,
                    margin: const EdgeInsets.all(10),
                    showFieldAsBox: true,
                    // onSubmit: (String verificationCode) {
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           title: const Text('Verification Code', style: TextStyle(color: Colors.green),),
                    //           content: Text('Code entered is $verificationCode'),
                    //         );
                    //       }
                    //   );
                    // },
                  ),
                )
              ],
            ),
            GestureDetector(
                onTap: () {},
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontFamily: 'Poppins',
                  ),
                )
            ),
            MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/new_password');
                },
                text: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
