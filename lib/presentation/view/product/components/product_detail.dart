import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key,});

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
              // child: Hero(
              //     tag: widget.product.id,
              //     child: Image.network(
              //       widget.product.image,
              //       fit: BoxFit.fill,
              //     )),
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
                      color: Colors.white.withOpacity(0.6)),
                  child: const Center(
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Column(
              children: [
                const Divider(thickness: 2, color: Colors.red),
                Expanded(
                  child: Container(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
