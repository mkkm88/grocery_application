import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_textfield.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../components/my_button.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (_, authProv, child) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 56),
            child: Column(
              children: [
                const Text('Create New Password'),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/newpass.png',
                  ),
                ),
                const Text(
                  'Your New Password Must Be Different \n from Previously Used Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: 'Poppins'),
                  ),
                MyTextField(controller: authProv.passController, hintText: 'New Password'),
                const SizedBox(height: 16,),
                MyTextField(controller: authProv.passController, hintText: 'Confirm Password'),
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
                    Navigator.pushNamed(context, '/login_page');
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        );
      })
    );
  }
}
