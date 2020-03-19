import 'package:covid19/languagePage.dart';
import 'package:covid19/loginPage.dart';
import 'package:covid19/slefDeclaration.dart';
import 'package:covid19/splashPage.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguagePage(),
    );
  }
}
