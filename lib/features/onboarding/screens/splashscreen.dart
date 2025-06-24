import 'package:anesu_library_app/features/onboarding/screens/onboarding_screens/intro_page1.dart';
import 'package:anesu_library_app/features/onboarding/screens/onboarding_screens/intro_page2.dart';
import 'package:anesu_library_app/features/onboarding/screens/onboarding_screens/intro_page3.dart';
import 'package:anesu_library_app/features/onboarding/screens/onboarding_screens/intro_page4.dart';
import 'package:anesu_library_app/features/onboarding/screens/onboarding_screens/onboarding_screens.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/general_assets.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: "assets/logo1.png",
      splashIconSize: 100,
      screenFunction: () async {
        return const OnBoardingPage(
          introPage1: IntroPage1(),
          introPage2: IntroPage2(),
          introPage3: IntroPage3(),
          introPage4: IntroPage4(),
        );
      },
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}