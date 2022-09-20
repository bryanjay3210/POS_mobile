import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:price_checker/view/dashboard.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('account');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue,
          secondary: Colors.grey,
          brightness: Brightness.light,
        ),
        primaryTextTheme:
            const TextTheme(headline6: TextStyle(color: Colors.white)),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              //this determines the text style of the text displayed on buttons
              fontSize: 14,
              fontFamily: 'Lato',
              color: Colors.red, //color not used
            ),
          ),
          enableFeedback: true,
        )),
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}
