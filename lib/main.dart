import 'package:flutter/material.dart';
import 'package:rise/constants.dart';
import 'package:rise/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: PRIMARY_PINK,
        focusColor: PRIMARY_DARK_PINK,
        errorColor: Colors.red,
        buttonColor: PRIMARY_DARK_PINK,
        primaryColor: PRIMARY_PINK,
        backgroundColor: PRIMARY_BG,
        primaryColorLight: PRIMARY_PINK,
        primaryColorDark: PRIMARY_BLUE,
        bottomAppBarColor: PRIMARY_BG
      ),
      home: Home(),
    );
  }
}