import 'package:flutter/material.dart ';

class TabChangeProvider extends ChangeNotifier {
  PageController pageController = PageController();

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;

    notifyListeners();
  }
}
