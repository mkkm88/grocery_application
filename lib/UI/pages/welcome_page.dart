import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_application/UI/components/my_button.dart';
import 'package:grocery_application/UI/pages/signup_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = CarouselController();
  int activeIndex = 0;
  final List<String> splashImages = [
    "assets/images/front.png",
    "assets/images/front.png",
    "assets/images/front.png",
  ];
  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }
  // void startTimer() {
  //   Timer(const Duration(seconds: 3), () {
  //     navigateToNextScreen();
  //   });
  // }
  // void navigateToNextScreen() {
  //   if(activeIndex == splashImages.length - 1) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const SignUp()),
  //     );
  //   } else {
  //     setState(() {
  //       activeIndex++;
  //       startTimer();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                itemCount: splashImages.length,
                carouselController: controller,
                options: CarouselOptions(height: 400,
                  initialPage: 0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                  if(index == splashImages.length) {
                      Navigator.pushNamed(
                        context, '/signup_page'
                      );
                    }
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  final splashImage = splashImages[index];
                  return buildImage(splashImage, index);
                }
            ),
            const SizedBox(height: 32,),
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
            const SizedBox(height: 32,),
            buildIndicator(),
            const SizedBox(height: 48,),
            buildButtons(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup_page');
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color(0XFFD9D9D9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Skip',
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget buildImage(String splashImage, int index) => Container(
    color: Colors.grey,
    child: Image.asset(
        splashImage,
      fit: BoxFit.cover,
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: splashImages.length,
      effect: const ExpandingDotsEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: Color(0xFF359751),
        dotColor: Colors.black12,
      ),
  );
  Widget buildButtons({bool stretch = false}) =>
      MyButton(
          onTap: () => next(),
          text: 'Next',
      );
  void next() => controller.nextPage(duration: const Duration(milliseconds: 500));
}