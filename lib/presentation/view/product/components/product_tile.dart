import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatefulWidget {
  final VoidCallback func;
  const ProductTile({
    super.key,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //     flex: 5,
            //     child: GestureDetector(
            //       onTap: widget.func,
            //       child: Hero(
            //         tag: widget.product.id,
            //         child: SizedBox(
            //           width: double.infinity,
            //           height: 200,
            //           child: Image.network(
            //             widget.product.image,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(ucwidget.product.product.toString(),
                      //     style: GoogleFonts.lato(
                      //         textStyle: const TextStyle(
                      //             fontSize: 18, fontWeight: FontWeight.bold))),
                      // Text(widget.product.descrption.toString()),
                      // Text("₱${widget.prodt.price.toStringAsFixed(2)}"),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
