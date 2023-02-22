import 'package:flutter/material.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 60,
            color: const Color(0xFF3C3F41),
            child: Row(
              children: [
                IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
                const SizedBox(width: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.search),)
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
          ),
          Expanded(child: Container(color: const Color(0xFF2B2B2B),))
        ],
      ),
    );
  }
}
