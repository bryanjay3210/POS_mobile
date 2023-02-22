import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:price_checker/presentation/view/admin_pannel/product/product_listing.dart';

import '../settings/settings.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
          ProductListing(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.add_circle),
              title: const Text('Product'),
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
