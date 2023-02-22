import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:price_checker/presentation/view/product/product.dart';

import '../settings/settings.dart';

class Authenticated extends StatefulWidget {
  const Authenticated({Key? key}) : super(key: key);

  @override
  State<Authenticated> createState() => _AuthenticatedState();
}

class _AuthenticatedState extends State<Authenticated> {
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
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
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
