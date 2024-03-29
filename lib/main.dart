import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/ForgotPasswordScreens/forgot_password.dart';
import 'package:grocery_application/UI/ForgotPasswordScreens/new_password.dart';
import 'package:grocery_application/UI/ForgotPasswordScreens/verify_email.dart';
import 'package:grocery_application/UI/cart_page.dart';
import 'package:grocery_application/UI/favorite_page.dart';
import 'package:grocery_application/UI/product.dart';
import 'package:grocery_application/UI/navigation_controller.dart';
import 'package:grocery_application/UI/pages/auth_page.dart';
import 'package:grocery_application/UI/product_detail.dart';
import 'package:grocery_application/UI/profile_page.dart';
import 'package:grocery_application/UI/pages/login_page.dart';
import 'package:grocery_application/UI/pages/signup_page.dart';
import 'package:grocery_application/UI/pages/start_page.dart';
import 'package:grocery_application/UI/pages/welcome_page.dart';
import 'package:grocery_application/model/CartModel.dart';
import 'package:grocery_application/provider/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery App',
        theme: getTheme(context),
        home: const AuthPage(),
        routes: {
          '/profile_page': (context) => const ProfilePage(),
          '/welcome_page': (context) => const WelcomePage(),
          '/login_page': (context) => const LoginPage(),
          '/signup_page': (context) => const SignUp(),
          '/start_page': (context) => const StartPage(),
          '/home_page': (context) => const NavigationController(),
          '/cart_page' : (context) => const CartPage(),
          '/favorite_page' : (context) => const FavoritePage(),
          '/forgot_password' : (context) => const ForgotPassword(),
          '/verify_email' : (context) => const VerifyEmail(),
          '/new_password' : (context) => const NewPassword(),
          ProductPage.routename: (_) => const ProductPage(),
          ProductDetailPage.routename: (_)=> const ProductDetailPage()
        },
      ),
    );
  }

  ThemeData getTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        textTheme: const  TextTheme(
            titleSmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Montserrat'),
            titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Montserrat'),
            titleLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: 'Montserrat')),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
          backgroundColor: Colors.white,
        ));
  }
}