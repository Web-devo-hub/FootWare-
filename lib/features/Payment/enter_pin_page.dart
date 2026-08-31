import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

import '../Order/Order.dart';
import '../Order/trackorder.dart';

class EnterPinPage extends StatefulWidget {
  const EnterPinPage({super.key});

  @override
  State<EnterPinPage> createState() => _EnterPinPageState();
}

class _EnterPinPageState extends State<EnterPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 100,
        title: Text(
          "Enter Your Pin",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "Enter your PIN to Confirm Payment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(height: 80),
            Pinput(obscureText: true, keyboardAppearance: Brightness.dark),
            Spacer(),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton.icon(
                onPressed: () {
                  showDialog(

                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return Center(
                        child: Container(
                          width: 350,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(40),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                                ),
                              ),

                              Text("Order Successful!",style: TextStyle(fontSize: 25,color: Colors.black),),
                              SizedBox(height: 20,),

                              Text("You have successfully made order",style: TextStyle(fontSize: 15,color: Colors.black),),
                              SizedBox(height: 20,),

                              Container(
                                width: 270,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OrderPage()),
                                    );
                                  },
                                  label: Text(
                                    "View Order",
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),

                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 270,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => TrackOrder()),
                                    );
                                  },
                                  label: Text(
                                    "Track Order",
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                label: Text("Continue", style: TextStyle(color: Colors.white)),
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                iconAlignment: IconAlignment.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Container(
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//               width: double.infinity,
//               height: 270,
//               color: Colors.grey.shade100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "1",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "2",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "3",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "4",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "5",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "6",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "7",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "8",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "9",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 20,
//                         height: 20,
//                         child: Text(
//                           "*",
//                           style: TextStyle(
//                             fontSize: 23,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "0",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Icon(Icons.backspace_outlined, size: 20),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
