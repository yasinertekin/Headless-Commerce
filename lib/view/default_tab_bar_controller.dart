import 'package:flutter/material.dart';
import 'package:headless_commerce/styles/colors.dart';
import 'package:headless_commerce/view/home_dashbord.dart';
import 'package:headless_commerce/view/search_view.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> with TickerProviderStateMixin {
  late final TabController _tabController;
  final String _labelHomeText = 'Home';
  final String _labelSearchText = 'Search';
  final String _labelStoreText = 'Store';
  final String _labelCardText = 'Card';
  final String _labelProfileText = 'Profile';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabView.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabView.values.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: _myTabView(),
        ),
        extendBody: true,
        backgroundColor: MyColor().white,
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomeDashbord(),
            SearchView(),
            Center(
              child: Text('Search'),
            ),
            Center(
              child: Text('Cart'),
            ),
            Center(
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
      indicator: const BoxDecoration(),
      indicatorColor: MyColor().illuminatingEmerald,
      labelColor: MyColor().illuminatingEmerald,
      unselectedLabelColor: MyColor().gray,
      controller: _tabController,
      padding: EdgeInsets.zero,
      tabs: _MyTabView.values.map((e) {
        IconData iconData;
        String labelText;

        switch (e) {
          case _MyTabView.home:
            iconData = Icons.home;
            labelText = _labelHomeText;
            break;
          case _MyTabView.search:
            iconData = Icons.search;
            labelText = _labelSearchText;
            break;
          case _MyTabView.order:
            iconData = Icons.shopping_cart;
            labelText = _labelCardText;
            break;
          case _MyTabView.store:
            iconData = Icons.store;
            labelText = _labelStoreText;
            break;

          case _MyTabView.profile:
            iconData = Icons.person;
            labelText = _labelProfileText;
            break;
        }

        return Tab(
          icon: Icon(iconData),
          text: labelText,
        );
      }).toList(),
    );
  }
}

enum _MyTabView { home, search, store, order, profile }

extension _MyTabViewExtension on _MyTabView {}
