import 'package:flutter/material.dart';
import 'package:footware/Order/Order.dart';
import 'package:footware/Home/homepage.dart';
import 'package:footware/Cart/cart.dart';
import 'package:footware/Profile_Page/profile_page.dart';
import 'package:footware/Wallet/wallet.dart';

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
