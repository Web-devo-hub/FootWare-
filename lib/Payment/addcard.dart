import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:footware/widget/inputfield.dart';


class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: false,

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
          "Add New Card",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreditCardWidget(
                cardNumber: "6110187800144321",
                expiryDate: "01/28",
                cardHolderName: "Muhammad Kaif",
                cvvCode: "123",
                showBackView: false,
                onCreditCardWidgetChange: (CreditCardBrand brand) {},
                obscureCardNumber: true,
                cardBgColor: Colors.black12,
                // animationDuration:  Duration(milliseconds: 12),
                isHolderNameVisible: true,
                bankName: "Habib Metro",
              ),
              SizedBox(height: 10,),
              Text(
                "Card Name",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10,),
        
              CustomInputField(obscure: false),
              SizedBox(height: 20,),
              Text(
                "Card Number",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10,),
              CustomInputField(textOfField: "2342 4655 9384 3487", obscure: false),
              SizedBox(height: 20,),

              Row(
                children: [
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10,),

                  // CustomInputField(textOfField: "2342 4655 9384 3487", obscure: false),
                  // Text(
                  //   "Card Number",
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // SizedBox(height: 10,),
                  // CustomInputField(textOfField: "01/07/2026", obscure: false),
                  //
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
