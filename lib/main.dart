import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:footware/widget/navigationbar.dart';

import 'Features/Authentication/loginpage.dart';
import 'Features/Authentication/signup.dart';
import 'Features/Home/favourite_items.dart';
import 'Features/Home/homepage.dart';
import 'Features/Home/product_category.dart';
import 'Features/Payment/enter_pin_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintPointersEnabled = false;
  debugPaintLayerBordersEnabled = false;
  debugRepaintRainbowEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, child) {
      //   return SafeArea(child: child!);
      // },
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LogInPage(),
        "Signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        // "product": (context) => Product(),
        "navigationbar": (context) => KNavigationBar(),
        // "checkout": (context) => Checkout(),
        "enterPin": (context) => EnterPinPage(),
        "category": (context) => ItemCategory(category: {}),
        "favouriteItems": (context) => FavouriteItems(),
      },
    );
  }
}
