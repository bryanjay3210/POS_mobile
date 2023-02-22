import 'package:flutter/material.dart';
import 'package:price_checker/utils/logo_banner.dart';

import 'components/category_list.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<String> category = [
    'Junk Foods',
    'Drinks',
    'Shampoo',
    'Noodles',
    'Candy',
    'Beverage',
    'Cosmetics',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoBanner(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (var ds in category)
                    CategoryList(
                      category: ds,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Expanded(
            //     child: Scrollbar(
            //   child: GridView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     itemCount: products.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2, childAspectRatio: 0.75),
            //     itemBuilder: (context, index) => ProductTile(
            //       product: products[index],
            //       func: () => Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) =>
            //             ProductDetail(product: products[index]),
            //       )),
            //     ),
            //   ),
            // ))
          ],
        ),
      ),
    );
  }
}
