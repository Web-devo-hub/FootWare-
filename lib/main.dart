import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:footware/Authentication/loginpage.dart';
import 'package:footware/Authentication/signup.dart';
import 'package:footware/Payment/enter_pin_page.dart';
import 'package:footware/Home/favourite_items.dart';
import 'package:footware/Home/homepage.dart';
import 'package:footware/Home/product_description.dart';
import 'package:footware/widget/navigationbar.dart';

import 'Cart/checkout.dart';
import 'Home/product_category.dart';

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
      builder: (context, child) {
        return SafeArea(child: child!);
      },

      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LogInPage(),
        "Signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "product": (context) => Product(),
        "navigationbar": (context) => KNavigationBar(),
        "checkout": (context) => Checkout(),
        "enterPin": (context) => EnterPinPage(),
        "category": (context) => ItemCategory(),
        "favouriteItems": (context) => FavouriteItems(),
      },
    );
  }
}
