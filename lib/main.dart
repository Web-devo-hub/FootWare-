import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:footware/widget/navigationbar.dart';
import 'package:footware/theme_controller.dart';
import 'package:get/get.dart';

import 'Features/Authentication/loginpage.dart';
import 'Features/Authentication/signup.dart';
import 'Features/Home/favourite_items.dart';
import 'Features/Home/homepage.dart';
import 'Features/Home/Product_controller/product_category.dart';
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
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
      // routes: {
      //   // // "/": (context) => LogInPage(),
      //   // "Signup": (context) => SignUp(),
      //   // "homepage": (context) => HomePage(),
      //   // // "product": (context) => Product(),
      //   // "navigationbar": (context) => KNavigationBar(),
      //   // // "checkout": (context) => Checkout(),
      //   // "enterPin": (context) => EnterPinPage(),
      //   // "category": (context) => ItemCategory(category: {}),
      //   // "favouriteItems": (context) => FavouriteItems(),
      // },
    );
  }
}