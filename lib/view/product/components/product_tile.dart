import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:price_checker/model/hive/product/product.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final VoidCallback func;
  const ProductTile({
    super.key,
    required this.product,
    required this.func,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(3, 3))
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: widget.func,
                  child: Hero(
                    tag: widget.product.id,
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.product.toString(),
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      Text(widget.product.descrption.toString()),
                      Text("₱${widget.product.price.toStringAsFixed(2)}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                          ),
                          const SizedBox(width: 5),
                          const Text('1',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 5),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                  child: Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
