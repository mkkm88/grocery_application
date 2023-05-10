import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_button.dart';
import 'package:grocery_application/UI/components/square_tile.dart';
import 'package:grocery_application/UI/pages/auth_page.dart';
import 'package:grocery_application/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.grey[900],
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<AuthProvider>(builder: (_, authProv, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Let's get started",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 70),
              RectangleButton(
                  onTap: () async {
                    await authProv.signInWithGoogle(context);
                  },
                  iconPath: "assets/images/google.png",
                  name: "Connect with Google"),
              const SizedBox(height: 15),
              RectangleButton(
                  onTap: () async{
                    await authProv.signWithFacebook(context);
                  },
                  iconPath: "assets/images/facebook.png",
                  name: "Connect with Facebook"),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey[400],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        "or",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.grey[400],
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/login_page');
                },
                text: 'Sign in with E-mail',
              ),
              const SizedBox(height: 145),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login_page');
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Color(0XFF3AA756),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}