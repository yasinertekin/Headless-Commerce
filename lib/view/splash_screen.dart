import 'package:flutter/material.dart ';
import 'package:headless_commerce/product/service/extension/image_path_extension.dart';
import 'package:headless_commerce/styles/colors.dart';

import 'welcome_screen.dart';

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
      body: Center(child: Image.asset(ImagePaths.welcomescreen0.path())),
    );
  }
}
