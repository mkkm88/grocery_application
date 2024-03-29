import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_button.dart';
import 'package:grocery_application/UI/components/my_textfield.dart';
import 'package:grocery_application/UI/components/square_tile.dart';
import 'package:grocery_application/UI/pages/start_page.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import 'auth_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(builder: (_, authProv, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Let's get started",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'E-mail address',
                      hintStyle: TextStyle(color: Colors.grey[400], fontFamily: 'Poppins', fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                            borderRadius: BorderRadius.circular(13)
                        ),
                      fillColor: Colors.transparent,
                      filled: true,
                    ),
                    controller: authProv.emailController,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  hintText: 'Password',
                  controller: authProv.passController,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 13, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      authProv.buildRememberCb(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                MyButton(
                  text: 'Sign in',
                  onTap: () {
                    authProv.signUserIn(context);
                    // bool signUserIn = true;
                    // if(signUserIn) {
                    //   Navigator.push(
                    //       context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const StartPage(),
                    //     ),
                    //   );
                    // }
                  }
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
                              fontSize: 16),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey[400],
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: () async {
                          await authProv.signInWithGoogle(context).then((e){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const AuthPage()));
                          });
                        },
                        imagePath: 'assets/images/google.png'),
                    const SizedBox(width: 10),
                    SquareTile(
                        onTap: () async{
                          await authProv.signWithFacebook(context);
                        },
                        imagePath: 'assets/images/facebook.png'),
                    const SizedBox(width: 10),
                    SquareTile(
                        onTap: () async {
                          await authProv.signWithApple(context);
                        },
                      imagePath: 'assets/images/apple-logo.png',  // SquareTile
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: Colors.black54),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup_page');
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color(0XFF3AA756),
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}