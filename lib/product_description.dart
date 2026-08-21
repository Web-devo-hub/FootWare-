import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'checkout.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int selectedIndex = 0;
  int colorSelectedIndex = 0;
  int counter = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, toolbarHeight: 53.96),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black.withValues(alpha: 0.8),
                //       blurRadius: 40,
                //       offset: Offset(0, 55),
                //       spreadRadius: -60,
                //     ),
                //   ],
                // ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // margin: EdgeInsets.all(2),
                      // height: 200,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/kaifshoes.jpeg"),
                          fit: BoxFit.fill,
                        ),
                        // borderRadius: BorderRadius.circular(30),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 315,
                left: MediaQuery.of(context).size.width * 0.435,
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            // color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AirJordan 3 Retro",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.favorite_outline, size: 25),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                      width: 50,
                      height: 18,
                      child: Text(
                        "8370 sold",
                        style: TextStyle(color: Colors.black, fontSize: 8),
                      ),
                    ),
                    SizedBox(width: 10),

                    Icon(Icons.star_half, size: 20),
                    SizedBox(width: 5),

                    Text(
                      "4.5",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    SizedBox(width: 5),
                    // Text(
                    //   "|",
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 13,
                    //   ),
                    // ),
                    Text(
                      "(8,370 reviews)",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(height: 5),

                Divider(thickness: 1, color: Colors.grey.shade200),

                SizedBox(height: 10),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Stylish, comfortable, and built for everyday wear comfortable, and built for everyday wear.",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          width: 120,
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                        margin: EdgeInsets.only(right: 6),
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: isSelected ? Colors.black: Colors.white,
                                          shape: BoxShape.circle,
                                          border: BoxBorder.all(width: 1.5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "41",
                                            style: TextStyle(
                                              color: isSelected ? Colors.white : Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )

                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Color",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              bool isSelected = colorSelectedIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    colorSelectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 6),
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index.isEven
                                        ? Colors.red
                                        : Colors.purple,
                                    // border: BoxBorder.all(width: 1.5,color: Colors.grey),
                                  ),
                                  child: isSelected
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.lightGreenAccent,
                                        )
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (counter > 1) {
                                setState(() {
                                  counter--;

                                });
                              }

                            },
                            child: FaIcon(FontAwesomeIcons.minus, size: 10),
                          ),
                          Text(
                            "$counter",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                counter++;
                              });
                            },
                            child: FaIcon(FontAwesomeIcons.plus, size: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1, color: Colors.grey.shade200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$585.00",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 240,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Checkout()));
                        },
                        label: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        iconAlignment: IconAlignment.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
