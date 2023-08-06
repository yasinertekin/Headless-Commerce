import 'package:flutter/material.dart ';
import 'package:headless_commerce/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().illuminatingEmerald,
      body: Center(child: Image.asset('assets/images/welcomescreen0.png')),
    );
  }
}
