import 'package:flutter/material.dart';
import 'package:headless_commerce/components/CustomButton/custom_button.dart';
import 'package:headless_commerce/product/service/extension/image_path_extension.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/login_screen_view.dart';

import 'splash_screen.dart';

class WelcomeScreen extends StatefulWidget with MyColor {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isloading = false;
  late final PageController _pageController = PageController();
  final int _lastPageNumber = 2;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0;
      });
    });
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
                    children: [
                      SizedBox(
                        height: 400, // PageView yüksekliği
                        width: 350, // PageView genişliği
                        child: PageView(
                          controller: _pageController,
                          children: [
                            _PageScreen(
                                imageUrl: ImagePaths.welcomescreen1.toWidget(),
                                title: 'Empowering Artisans,\nFarmers & Micro Business'),
                            _PageScreen(
                              imageUrl: ImagePaths.welcomescreen2.toWidget(),
                              title: 'Connecting NGOs, Social\nEnterprises with Communities',
                            ),
                            _PageScreen(
                              imageUrl: ImagePaths.welcomescreen3.toWidget(),
                              title: ' Donate, Invest & Support\ninfrastructure projects',
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _PageSelectorButton(pageController: _pageController, pageNumber: 0),
                          _PageSelectorButton(pageController: _pageController, pageNumber: 1),
                          _PageSelectorButton(pageController: _pageController, pageNumber: 2),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Builder(
                      builder: (context) => CustomButton(
                        onPressed: () {
                          _navigateToPage(context);
                        },
                        backgroundColor: MyColor().illuminatingEmerald,
                        buttonText: _pageController.page == _lastPageNumber ? 'Finish' : 'Next',
                        textColor: MyColor().white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SplashScreen();
  }

  void _navigateToPage(BuildContext context) {
    setState(() {
      if (_pageController.page == _lastPageNumber) {
        // Son sayfadaysak
        // Başka bir sayfaya yönlendirme yapabilirsiniz
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        // Son sayfada değilsek
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }
}

class _PageSelectorButton extends StatefulWidget with MyColor {
  _PageSelectorButton({
    required PageController pageController,
    required this.pageNumber,
  }) : _pageController = pageController;

  final PageController _pageController;
  int pageNumber;

  MyColor myColors = MyColor();

  @override
  _PageSelectorButtonState createState() => _PageSelectorButtonState();
}

class _PageSelectorButtonState extends State<_PageSelectorButton> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    widget._pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      isSelected = widget._pageController.page == widget.pageNumber;
    });
  }

  @override
  void dispose() {
    widget._pageController.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          widget._pageController.animateToPage(
            widget.pageNumber,
            duration: const Duration(milliseconds: 300), // Animasyon süresi
            curve: Curves.ease, // Animasyon eğrisi
          );
        },
        child: CircleAvatar(
          radius: 6,
          backgroundColor: isSelected ? MyColor().illuminatingEmerald : MyColor().morningGreen,
        ),
      ),
    );
  }
}

enum ImagePaths { welcomescreen1, welcomescreen2, welcomescreen3, welcomescreen0 }

class _PageScreen extends StatelessWidget with MyColor {
  _PageScreen({Key? key, required this.imageUrl, required this.title}) : super(key: key);

  final Widget imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageUrl,
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyColor().illuminatingEmerald,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
