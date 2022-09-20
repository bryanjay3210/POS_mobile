import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:price_checker/view/price_checker/price_checker.dart';
import 'package:price_checker/view/product/product.dart';
import 'package:price_checker/view/register/register.dart';
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
        controller: ctrl,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        children: const[
          PriceCheckerScreen(),
          LoginScreen(),
          RegisterScreen(),
          ProductScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        backgroundColor: const Color(0xFF3C3F41),
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedTitle: const Text('Home'),
              title: const Text('Home'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              selectedTitle: const Text('Login'),
              title: const Text('Login'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.how_to_reg),
              selectedTitle: const Text('Register'),
              title: const Text('Register'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text('Product'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index){
            setState((){
              _currentIndex = index;
              onChangePage(index);
            });
          }
      ),
    );
  }
  void onChangePage(int index){
    ctrl.jumpToPage(index);
  }
}
