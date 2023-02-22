import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:price_checker/presentation/view/dashboard.dart';
import 'package:price_checker/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      routes: routes(),
      home: const DashboardScreen(),
    );
  }
}
