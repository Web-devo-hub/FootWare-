import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footware/constants/constants.dart';

import '../Cart/checkout.dart';
import 'favourite_items.dart';

class Product extends StatefulWidget {
  const Product({super.key, this.productDetail});

  final Map<String, dynamic>? productDetail;



  @override
  State<Product> createState() => _ProductState();


}

class _ProductState extends State<Product> {

  bool itemExists = false;

  @override
  void initState() {
    super.initState();
    itemExists = cartItems?.any((element) => element[""] == widget.productDetail?[""],)??false;

    selectedSize = widget.productDetail?["sizes"][0];
    selectedColor = widget.productDetail?["colors"][0];
    quantity = 1;
    totalPrice = widget.productDetail?["price"];
  }

  int selectedIndex = 0;
  int colorSelectedIndex = 0;
  int counter = 1;
  bool like = false;

  int? selectedColor;
  int? selectedSize;
  int? quantity;
  int? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, toolbarHeight: 80),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,

                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // margin: EdgeInsets.all(2),
                        // height: 200,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              ("${widget.productDetail?["image"]}"),
                            ),
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
                        widget.productDetail?["name"],
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          like ? Icons.favorite : Icons.favorite_outline,
                          size: 25,
                          color: like ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            like = !like;
                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteItems()));
                        },
                      ),
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
                          // widget.productDetail?["itemsSold"]??"",
                          "${widget.productDetail?["itemsSold"]} sold",
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      ),
                      SizedBox(width: 10),

                      Icon(Icons.star_half, size: 20),
                      SizedBox(width: 5),

                      Text(
                        // widget.productDetail?["rating"],
                        "${widget.productDetail?["rating"]}",
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
                        "${widget.productDetail?["ratingCount"]} rating ",

                        // widget.productDetail?["ratingCount"]??"",
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
                    "${widget.productDetail?["description"]}",
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
                              itemCount: widget.productDetail?["sizes"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var productSize = widget.productDetail?["sizes"][index];
                                bool isSelected = selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = productSize;
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                      border: BoxBorder.all(width: 1.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$productSize",
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
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
                              itemCount: widget.productDetail?["colors"].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final int productColor = widget.productDetail?["colors"][index];
                                bool isSelected = colorSelectedIndex == index;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = productColor;
                                      colorSelectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 6),
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(productColor),
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
                                    quantity = counter;
                                    totalPrice = (quantity! * (widget.productDetail?["price"] ?? 0)).toInt();
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
                              onTap: () {
                                setState(() {
                                  counter++;
                                  quantity = counter;
                                  totalPrice = (quantity! * (widget.productDetail?["price"] ?? 0)).toInt();
                                });
                              },
                              child: FaIcon(FontAwesomeIcons.plus, size: 10),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      TextButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () {
                          if(widget.productDetail!=null){
                            bool itemExists = cartItems?.any((element) => element["name"] == widget.productDetail?["name"],)??false;
                            if(!itemExists){

                              var productData = {
                                  "name": widget.productDetail?["name"],
                                  "description": widget.productDetail?["description"],
                                  "image": widget.productDetail?["image"],
                                  "price": totalPrice,
                                  "sizes": selectedSize,
                                  "colors": selectedColor,
                                  "quantity": quantity
                              };
                              cartItems?.add(productData);
                              print(cartItems);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Item Added.")),
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Item Already Added!")),
                              );
                            }
                          }
                        },
                        label: Text("Add to Cart",style: TextStyle(color: Colors.black),),
                        icon: Icon(itemExists? Icons.shopping_cart : Icons.shopping_cart_outlined, color: Colors.black,),
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
                            "Rs.${widget.productDetail?["price"] * counter}",
                            // "Rs.${widget.productDetail?["price"]} * $counter",
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Checkout(),
                              ),
                            );
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
      ),
    );
  }
}
