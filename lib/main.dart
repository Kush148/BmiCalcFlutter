import 'package:flutter/material.dart';
import 'package:flutter_app3/screens/input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/OutputPage': (context) => ResultPage(),
      // },
    );
  }
}
