import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
import '../product/product.dart';

class Unathenticated extends StatefulWidget {
  const Unathenticated({Key? key}) : super(key: key);

  @override
  State<Unathenticated> createState() => _UnathenticatedState();
}

class _UnathenticatedState extends State<Unathenticated> {
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
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              selectedTitle: const Text('Login'),
              title: const Text('Login'),
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
