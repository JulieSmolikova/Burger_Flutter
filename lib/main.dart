import 'package:flutter/material.dart';
import 'package:burger/start_page.dart';
import 'package:burger/burger_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        '/start_page': (context) => const StartPage(),
        '/burger_page': (context) => const BurgerPage(),
      },

      initialRoute: '/start_page',

      home: Scaffold(),

    );
  }
}
