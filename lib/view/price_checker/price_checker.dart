import 'package:flutter/material.dart';
import 'package:price_checker/view/price_checker/component/search_product.dart';

class PriceCheckerScreen extends StatefulWidget {
  const PriceCheckerScreen({Key? key}) : super(key: key);

  @override
  State<PriceCheckerScreen> createState() => _PriceCheckerScreenState();
}

class _PriceCheckerScreenState extends State<PriceCheckerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Price Checker', style: TextStyle(color: Colors.grey, fontSize: 30, fontWeight: FontWeight.bold))),
            const SizedBox(height: 30,),
            const Center(child: Text('Please select option to scan', style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold))),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchProductScreen(),)),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: const Center(child: Text('Product Name')),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: const Center(child: Text('Barcode')),
            ),
          ],
        ),
      ),
    );
  }
}
