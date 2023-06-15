import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_application/UI/pages/start_page.dart';

class AuthProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isRememberMe = false;

  final user = FirebaseAuth.instance.currentUser;

  void signUserIn(BuildContext context) async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code, context);
    }
  }

signInWithGoogle(BuildContext context) async {
    try {
      showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken,
        );
        FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pop(context);
      }
      // await FirebaseFirestore.instance.collection('users').add({
      //   'Google-Email': GoogleSignIn().currentUser?.email,
      //   'Google-Image-Url': GoogleSignIn().currentUser?.photoUrl,
      //   'Google-User-Name': GoogleSignIn().currentUser?.displayName,
      // });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.message.toString(), context);
    } catch (e){
      log('message: $e');
    }
  }

  signWithFacebook(BuildContext context) async {
    // showDialog(
    //   context: context,
    //   builder: (dialogContext) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    // try {
    //   final facebookLoginResult = await FacebookAuth.instance.login();
    //   final userData = await FacebookAuth.instance.getUserData();
    //
    //   final facebookAuthCredential = FacebookAuthProvider.credential(
    //       facebookLoginResult.accessToken!.token);
    //   await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    //
    //   await FirebaseFirestore.instance.collection('users').add({
    //     'Facebook-Email': userData['email'],
    //     'Facebook-Image-Url': userData['picture']['data']['url'],
    //     'Facebook-User-Name': userData['name'],
    //   });
    //
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (_) => AuthPage()), (route) => false);
    //   Navigator.pop(context);
    // } on FirebaseException catch (e) {
    //   Navigator.pop(context);
    //   showErrorMessage(e.message.toString(), context);
    // }
    showDialog(context: context, builder: (_)=>AlertDialog(
      content: const Text("This Feature is temporary disabled"),
      title: const Text("Temporary disabled"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ));
  }

  signWithApple(BuildContext context) {
    showDialog(context: context, builder: (_)=>AlertDialog(
      content: const Text("This Feature is temporary disabled"),
      title: const Text("Temporary disabled"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ));
  }

  // error message to user
  void showErrorMessage(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            message,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        );
      },
    );
  }

  Widget buildRememberCb() {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: const Color(0XFF3AA756)),
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                value: isRememberMe,
                checkColor: Colors.white,
                activeColor: const Color(0XFF3AA756),
                onChanged: (value) {
                  isRememberMe = value!;
                  notifyListeners();
                },
              )),
          Text(
            'Remember me',
            style: TextStyle(
                fontSize: 16, color: Colors.grey[700], fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}