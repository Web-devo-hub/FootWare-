import 'package:flutter/material.dart';
import 'package:footware/Authentication/loginpage.dart';
import 'package:footware/Authentication/signup.dart';
import 'package:footware/homepage.dart';
import 'package:footware/product_description.dart';
import 'package:footware/widget/navigationbar.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LogInPage(),
        "Signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "product": (context) => Product(),
        "navigationbar": (context) => KNavigationBar(),
      },
    );
  }
}

