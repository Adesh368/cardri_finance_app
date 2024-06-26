import 'dart:async';


import 'package:cardri_finance/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String? userName;
  String? onboardData;
  String? userFourPin;
  String? emailScreen;
  String? signUpRoute;

  // Navigation Method
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const OnboardingScreen();
      }));
    });

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screeheight,
        width: screenwidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
