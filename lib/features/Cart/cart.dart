import 'package:flutter/material.dart';
import 'package:footware/constants/constants.dart';

import 'cart_tile_widget.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget {
   CartPage({super.key});

  List<Map<String, dynamic>>? checkoutItems = [];

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
    quantities = List.filled(cartItems?.length ?? 0, 1);
  }

  double getTotalPrice() {
    double total = 0;

    for (int i = 0; i < (cartItems?.length ?? 0); i++) {
      final item = cartItems![i];

      double price = (item["price"] ?? 0).toDouble();

      total += price * quantities[i];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_sharp),
          ),
        ],
        backgroundColor: Colors.grey[50],
        leadingWidth: 220,
        toolbarHeight: 90,
        leading: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 30,
          ),
          child: Text(
            "My Cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: cartItems?.length ?? 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (BuildContext context, int index) {
                    final cartProduct = cartItems![index];

                    return CartTileWidget(
                      imageLocation: "${cartProduct["image"]}",
                      productName: "${cartProduct["name"]}",
                      productPrice: "Rs.${getTotalPrice().toStringAsFixed(0)}",
                      colorValue: cartProduct["colors"],
                      sizeValue: cartProduct["sizes"],
                      quantity: quantities[index],
                      onQuantityChanged: (newQuantity) {
                        setState(() {
                          quantities[index] = newQuantity;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          cartItems?.removeAt(index);
                          quantities.removeAt(index);
                        });
                    },
                    );
                  },
                ),
              ),
            ),
          ),

          // ---------------- TOTAL PRICE ----------------

          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: double.infinity,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Rs. ${getTotalPrice().toStringAsFixed(0)}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),


                  Container(
                    width: 240,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Checkout(),
                          ),
                        );
                      },

                      label: const Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),

                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}