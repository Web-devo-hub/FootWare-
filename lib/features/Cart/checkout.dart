import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footware/constants/constants.dart';

import '../Payment/payment_methods.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
        centerTitle: false,
        scrolledUnderElevation: 0,

        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
          Container(
            margin: EdgeInsets.only(right: 13),
            width: 23,
            height: 23,
            // color: Colors.red,
            decoration: BoxDecoration(
              // color: Colors.red,
              shape: BoxShape.circle,
              border: BoxBorder.all(width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.more_horiz, size: 15)],
            ),
          ),
        ],
        backgroundColor: Colors.grey[50],
        toolbarHeight: 90,
        title: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "9876 Suburban Park,PC 5678",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.edit, size: 20),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Order List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems?.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final cartProduct = cartItems![index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${cartProduct["image"]}"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          width: 230,
                          height: 145,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text(
                                      "${cartProduct["name"]}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems?.removeAt(index);

                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        size: 26,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 20,
                                      color: index.isEven
                                          ? Colors.grey
                                          : Colors.blue,
                                    ),
                                    SizedBox(width: 5),

                                    Text(
                                      "color",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Size = ${cartProduct["sizes"]}",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rs. ${getTotalPrice().toStringAsFixed(0)}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        shape: BoxShape.circle,
                                        // borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          quantities[index].toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Text(
                "Choose Shipping",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Regular",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Estimated...Dec 20-29",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "\$15",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.edit, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.2),

              SizedBox(height: 20),
              Text(
                "Promo Code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 190,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Discount 30% off",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.close, color: Colors.white, size: 13),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      // borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsetsGeometry.all(15),
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount", style: TextStyle(color: Colors.grey)),
                        Text(getTotalPrice().toStringAsFixed(0)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping", style: TextStyle(color: Colors.grey)),
                        Text("\$15.00"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Promo", style: TextStyle(color: Colors.grey)),
                        Text("\$-175.00"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(thickness: 0.2),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle(color: Colors.grey)),
                        Text("${[]}"),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PaymentMethods(isNavigatedFromProfile: false),
                      ),
                    );
                  },
                  label: Text(
                    "Continue to payment",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  iconAlignment: IconAlignment.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
