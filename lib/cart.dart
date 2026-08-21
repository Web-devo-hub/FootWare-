import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp,)),

        ],
        backgroundColor: Colors.grey[50],
        leadingWidth: 200,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
               child: SizedBox(
                 // color: Colors.red ,
                 width: double.infinity,
                 height: MediaQuery.of(context).size.height * .604,
                 child: ListView.builder(
                   itemCount: 10,
                   shrinkWrap: true,
                   scrollDirection: Axis.vertical,
                   itemBuilder: (BuildContext context, int index) {
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
                                 image: AssetImage("assets/kaifshoes.jpeg"),
                                 fit: BoxFit.fill,
                               ),
                               borderRadius: BorderRadius.circular(20),
                             ),
                           ),
                           Container(
                             // color: Colors.red,
                             width: 185,
                             height: 145,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(vertical: 15),
                               child: Column(
                                 mainAxisAlignment:
                                     MainAxisAlignment.spaceAround,
                                 children: [
                                   Row(
                                     mainAxisAlignment:
                                         MainAxisAlignment.spaceBetween,

                                     children: [
                                       Text(
                                         "Air Jordan 3 Retro",
                                         style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 17,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                       Icon(
                                         Icons.delete_outline_rounded,
                                         size: 26,
                                         color: Colors.grey[600],
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
                                         "Black",
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
                                         "Size = 42",
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
                                         "\$105.00",
                                         style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 17,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                       Container(
                                         width: 80,
                                         height: 30,
                                         decoration: BoxDecoration(
                                           color: Colors.grey[100],
                                           borderRadius: BorderRadius.circular(
                                             20,
                                           ),
                                         ),
                                         child: Row(
                                           mainAxisAlignment:
                                               MainAxisAlignment.spaceEvenly,
                                           children: [
                                             FaIcon(
                                               FontAwesomeIcons.minus,
                                               size: 10,
                                             ),
                                             Text(
                                               "1",
                                               style: TextStyle(
                                                 fontSize: 15,
                                                 fontWeight: FontWeight.bold,
                                               ),
                                             ),
                                             FaIcon(
                                               FontAwesomeIcons.plus,
                                               size: 10,
                                             ),
                                           ],
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
               ),
             ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            alignment: AlignmentGeometry.bottomEnd,
            width: double.infinity,
            height: 100 ,
            child: Padding(
              padding:  EdgeInsets.all(20.0),
              child: Row(
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
                    width: 240,
                    height: 120,
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
            ),
          ),
        ],
      ),
    );
  }
}
