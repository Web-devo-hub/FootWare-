import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Container(
            margin: EdgeInsets.only(right: 13),
            width: 20,
            height: 20,
            // color: Colors.red,
            decoration: BoxDecoration(
              // color: Colors.red,
              shape: BoxShape.circle,
              border: BoxBorder.all(width: 1)
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Icon(Icons.more_horiz,size: 15,)
            ]),
          ),
        ],
        backgroundColor: Colors.white,
        leadingWidth: 350,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Text(
            "My E-Wallet",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: "6110187800144321",
              expiryDate: "01/28",
              cardHolderName: "Muhammad Kaif",
              cvvCode: "123",
              showBackView: false,
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
              obscureCardNumber: false,
              cardBgColor: Colors.black12,
              // animationDuration:  Duration(milliseconds: 12),
              isHolderNameVisible: true,
              bankName: "Habib Metro",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transaction History",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount:10,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    width: double.infinity,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kaifshoes.jpeg"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          width: 245,
                          height: 145,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
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
                                        Text(
                                          "\$105",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Dec 15,2024",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "|",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "10:00 AM",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 13,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Orders"),
                                            Icon(Icons.outbox, size: 15),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // SizedBox(height: 10),

                                // Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "\$105.00",
                                //       style: TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 17,
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     ),
                                //
                                //   ],
                                // ),
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
          ],
        ),
      ),
    );
  }
}
