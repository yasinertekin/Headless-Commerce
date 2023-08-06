import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/provider/tab_change_provider.dart';
import 'package:headless_commerce/routing/app_router.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/WelcomeScreen/tab_indicator.dart';
import 'package:headless_commerce/view/WelcomeScreen/welcome_screen_model.dart';
import 'package:headless_commerce/view/login_screen_view.dart';
import 'package:provider/provider.dart';

import '../splash_screen.dart';

class WelcomeScreen extends StatefulWidget with MyColor {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with NavigatorManager {
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    changeLoading();
  }

  Future<void> changeLoading() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isloading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: MyColor().illuminatingEmerald,
                      ),
                    ),
                    Expanded(
                      child: Container(color: MyColor().white),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 400, // PageView yüksekliği
                        width: 350, // PageView genişliği
                        child: _buildWelcomePageView(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TabIndicator(
                            selectedIndex: Provider.of<TabChangeProvider>(context).selectedIndex,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      textColor: MyColor().white,
                      backgroundColor: MyColor().illuminatingEmerald,
                      buttonText: Provider.of<TabChangeProvider>(context).selectedIndex ==
                              WelcomeScreenModels.welcomeScreenItems.length - 1
                          ? "Giriş Yap"
                          : "Devam Et",
                      onPressed: () {
                        _navigateToNextOrLoginScreen(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SplashScreen();
  }

  PageView _buildWelcomePageView(BuildContext context) {
    return PageView.builder(
      controller: Provider.of<TabChangeProvider>(context, listen: false).pageController,
      onPageChanged: (index) {
        Provider.of<TabChangeProvider>(context, listen: false).changeIndex(index);
      },
      itemCount: WelcomeScreenModels.welcomeScreenItems.length,
      itemBuilder: (context, index) {
        return _welcomeScreenCard(index);
      },
    );
  }

  void _navigateToNextOrLoginScreen(BuildContext context) {
    if (Provider.of<TabChangeProvider>(context, listen: false).selectedIndex ==
        WelcomeScreenModels.welcomeScreenItems.length - 1) {
      navigatoToWidget(context, const LoginScreen());
    } else {
      int newIndex = Provider.of<TabChangeProvider>(context, listen: false).selectedIndex + 1;
      Provider.of<TabChangeProvider>(context, listen: false).changeIndex(newIndex);
      Provider.of<TabChangeProvider>(context, listen: false)
          .pageController
          .animateToPage(newIndex, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  Card _welcomeScreenCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: Column(
        children: [
          Image.asset(
            WelcomeScreenModels.welcomeScreenItems[index].imageWithPath,
            height: 300,
          ),
          Text(
            WelcomeScreenModels.welcomeScreenItems[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
