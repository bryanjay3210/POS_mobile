import 'package:flutter/material.dart';
import 'package:price_checker/model/hive/product/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Hero(
                  tag: widget.product.id,
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.06)),
                  child: const Center(
                    child: Icon(Icons.arrow_back, color: Colors.black26),
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Container(color: Colors.grey[200]),
          )
        ],
      ),
    );
  }
}
