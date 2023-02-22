import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoBanner extends StatelessWidget {
  const LogoBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      height: 120,
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  child: Text(
                    'EZ Shop',
                    style: GoogleFonts.lato(
                        textStyle:
                        Theme.of(context).textTheme.headlineMedium, color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart,
                      color: Colors.white),
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
                    color: Colors.white.withOpacity(0.6),
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
    );
  }
}

