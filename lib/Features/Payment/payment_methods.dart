import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footware/Core/sharedprefrences/shared_preferences.dart';

import 'addcard.dart';
import 'enter_pin_page.dart';

class PaymentMethods extends StatefulWidget {
   const PaymentMethods({
    super.key,
    required this.isNavigatedFromProfile,
    this.cardHoldername,
    this.cardNumber,
  });

  final bool isNavigatedFromProfile;
  final String? cardHoldername;
  final String? cardNumber;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int selectedIndex = 0;

  Future<void> showDeleteSnackBar(int index ,Map<String, dynamic> cardData) async {
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Center(
            child: Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
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
                        Icons.delete_forever,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),

                  Text(
                    "Delete Card",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "click to delete Payment Method",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {

                            setState(() {
                              SharedPreferencesClient.instance.deleteCard(cardData);
                              if(savedCards.isNotEmpty  ){
                                savedCards.removeAt(index);
                              }
                              // loadCards();
                            });
                            Navigator.pop(context);

                          },
                          label: Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TrackOrder(),
                            //   ),
                            // );
                          },
                          label: Text(
                            "Track Order",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
  }

  List<Map<String, dynamic>> savedCards = [];

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  Future<void> loadCards() async {
    final cards = await SharedPreferencesClient.instance.getCardsInfo();

    if (!mounted) return;

    setState(() {
      savedCards = cards;
    });
  }

  Future<void> openAddCardPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  AddCard()),
    );

    await loadCards();
  }

  String getLastFour(dynamic cardNumber) {
    if (cardNumber == null) {
      return "0000";
    }

    String number = cardNumber.toString();

    if (number.length <= 4) {
      return number;
    }

    return number.substring(number.length - 4);
  }

  String getCardImage(String? cardType) {
    switch (cardType) {
      case "visa":
        return "assets/visa.png";

      case "mastercard":
        return "assets/mastercard.svg";

      case "americanExpress":
        return "assets/amex.png";

      case "discover":
        return "assets/discover.png";

      case "unionpay":
        return "assets/unionpay.png";

      case "rupay":
        return "assets/rupay.png";

      default:
        return "assets/mastercard.svg";
    }
  }

  Widget getCardLogo(String assetName) {
    if (assetName.endsWith(".svg")) {
      return SvgPicture.asset(assetName, fit: BoxFit.contain);
    }

    return Image.asset(assetName, fit: BoxFit.contain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[50],
        toolbarHeight: 90,

        title:  Text(
          "Payment Method",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),

        actions: [
          Container(
            margin:  EdgeInsets.only(right: 20),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1),
            ),
            child: IconButton(
              onPressed: openAddCardPage,
              icon:  Icon(Icons.add),
            ),
          ),
        ],
      ),

      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the payment method you want to use.",
              style: TextStyle(color: Colors.grey),
            ),

             SizedBox(height: 10),

            Expanded(
              child: savedCards.isEmpty
                  ?  Center(child: Text("No saved cards")) : ListView.builder(
                      itemCount: savedCards.length,

                      itemBuilder: (BuildContext context, int index) {
                        final card = savedCards[index];

                        final String brandName = card["brandName"]?.toString() ?? "";

                        final String lastFour = getLastFour(card["cardNumber"]);

                        final bool isSelected = selectedIndex == index;

                        return PaymentOptions(
                          logo: getCardLogo(getCardImage(brandName)),

                          nameofOption: "**** **** **** $lastFour",

                          endIcon: widget.isNavigatedFromProfile
                              ? IconButton(
                                  onPressed: () {
                                    showDeleteSnackBar(index , card);
                                  },
                                  icon:  Icon(
                                    Icons.delete_outline_rounded,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  icon: Icon(
                                    isSelected
                                        ? Icons.circle
                                        : Icons.circle_outlined,
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                ),
                        );
                      },
                    ),
            ),

            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton.icon(
                onPressed: () async {
                  if (widget.isNavigatedFromProfile) {
                    await openAddCardPage();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  EnterPinPage(),
                      ),
                    );
                  }
                },

                label: Text(
                  widget.isNavigatedFromProfile
                      ? "Add Card"
                      : "Continue to payment",
                  style:  TextStyle(color: Colors.white),
                ),

                icon:  Icon(Icons.arrow_forward, color: Colors.white),

                iconAlignment: IconAlignment.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptions extends StatelessWidget {
   const PaymentOptions({
    super.key,
    required this.nameofOption,
    required this.endIcon,
    required this.logo,
    this.mainIcon,
  });

  final String nameofOption;
  final IconData? mainIcon;
  final Widget endIcon;
  final Widget logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 10),
      padding:  EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 60,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              mainIcon != null
                  ? Icon(mainIcon, size: 25)
                  : SizedBox(width: 35, height: 25, child: logo),

               SizedBox(width: 8),

              Text(
                nameofOption,
                style:  TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          endIcon,
        ],
      ),
    );
  }
}