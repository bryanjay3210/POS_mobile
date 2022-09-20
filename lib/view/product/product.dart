import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3C3F41),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Text('Product Screen')
        ],
      ),
    );
  }
}
