import 'package:flutter/material.dart';

import '../Features/Cart/cart.dart';
import '../Features/Home/homepage.dart';
import '../Features/Order/Order.dart';
import '../Features/Profile_Page/profile_page.dart';
import '../Features/Wallet/wallet.dart';
// dartimport '../features/Cart/cart.dart';
// import '../features/Home/homepage.dart';
// import '../features/Order/Order.dart';
// import '../features/Profile_Page/profile_page.dart';
// import '../features/Wallet/wallet.dart';


class KNavigationBar extends StatefulWidget {
   const KNavigationBar({super.key});

  @override
  State<KNavigationBar> createState() => _KNavigationBarState();
}

class _KNavigationBarState extends State<KNavigationBar> {
   int selectedIndex = 0;

  final List<Widget> body = [
    HomePage(),
    CartPage(),
    OrderPage(),
    Wallet(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.black,showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
        unselectedItemColor: Colors.grey[400],
        currentIndex: selectedIndex,
          onTap : (index){
          setState(() {
            selectedIndex=index;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag) , label: "Cart" ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Order" ),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Wallet" ),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile" ),
          ]

      ),

    );
  }
}
