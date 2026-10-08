import 'package:flutter/material.dart';
import 'package:footware/Features/Cart/cart_controller.dart';
import 'package:footware/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'cart_tile_widget.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  // List<Map<String, dynamic>>? localCheckoutListItems = [];

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.put(CartController());


@override
  void initState() {
    super.initState();
    controller.onInit();

  }
  // double getTotalPrice() {
  //   double total = 0;
  //
  //   for (int i = 0; i < (widget.localCheckoutListItems?.length ?? 0); i++) {
  //     final item = SingletonList.cartItems![i];
  //
  //     double price = (item["price"] ?? 0).toDouble();
  //
  //     total += price * quantities[i];
  //   }
  //
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_sharp)),
        ],
        backgroundColor: Colors.grey[50],
        leadingWidth: 220,
        toolbarHeight: 90,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                child :   Obx(
                      () => ListView.builder(
                    itemCount: controller.localCheckoutListItems.length ,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,

                    itemBuilder: (BuildContext context, int index) {
                      final cartProduct = controller.localCheckoutListItems.value[index];

                      return Obx((){
                        return CartTileWidget(
                          imageLocation: "${cartProduct["image"]}",
                          productName: "${cartProduct["name"]}",
                          productPrice: "Rs.${cartProduct["price"]}",
                          colorValue: cartProduct["color"],
                          sizeValue: cartProduct["size"],
                          quantity: controller.quantities[index],
                          onQuantityChanged: (onchange) => controller.setQuantity(index, onchange),
                          onDelete: () => controller.removeAt(index),
                        );
                      }
                      );
                    },
                  ),
                )
                ),
              ),
            ),


          // ---------------- TOTAL PRICE ----------------
          Container(
            decoration: const BoxDecoration(color: Colors.white),
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

                      Obx((){
                        return Text(
                          "Rs. ${controller.TotalPrice.toStringAsFixed(0)}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
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
                        Get.to(()=> Checkout(
                          isFromProductDescription: false,
                          checkoutItems:
                          List.from(controller.localCheckoutListItems ) ,
                        ),);

                        // Navigator.push(
                        //   context,
                        //
                        //   MaterialPageRoute(
                        //     builder: (context) => Checkout(
                        //       isFromProductDescription: false,
                        //       checkoutItems:
                        //          List.from(controller.localCheckoutListItems ?? []) ,
                        //     ),
                        //   ),
                        // );
                      },

                      label: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white),
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
