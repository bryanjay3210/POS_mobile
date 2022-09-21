import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:price_checker/view/product/product.dart';
import 'package:price_checker/view/settings/settings.dart';

import 'login/login.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  PageController ctrl = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: ctrl,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          ProductScreen(),
          LoginScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.list_sharp),
              title: const Text('Product'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              selectedTitle: const Text('Login'),
              title: const Text('Login'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              onChangePage(index);
            });
          }),
    );
  }

  void onChangePage(int index) {
    ctrl.jumpToPage(index);
  }
}
