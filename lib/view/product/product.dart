import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:price_checker/model/hive/product/product.dart';
import 'package:price_checker/view/product/components/product_detail.dart';
import 'package:price_checker/view/product/components/product_tile.dart';

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
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            'EZ Shop',
                            style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_cart,
                              color: Colors.grey),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200],
                          ),
                          height: 45,
                          child: Row(
                            children: const [
                              Icon(Icons.search),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search'),
                                ),
                              ),
                            ],
                          )),
                    )
                  ]),
            ),
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
            Expanded(
                child: Scrollbar(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.75),
                itemBuilder: (context, index) => ProductTile(
                  product: products[index],
                  func: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProductDetail(product: products[index]),
                  )),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
