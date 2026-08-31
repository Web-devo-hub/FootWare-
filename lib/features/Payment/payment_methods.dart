import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'addcard.dart';
import 'enter_pin_page.dart';


class PaymentMethods extends StatefulWidget {
  PaymentMethods({super.key, required this.isNavigatedFromProfile});

  final bool isNavigatedFromProfile;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int index = 0;
  int selectedIndex = 0;

  final List<String> names = ["GooglePay", "**** **** **** 4679"];

  final List<String> svg = ["assets/google.svg", "assets/mastercard.svg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,

        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCard()),
              );
            },
            icon: Icon(Icons.add, size: 30),
          ),
        ],
        backgroundColor: Colors.grey[50],
        toolbarHeight: 90,
        title: Text(
          "Payment Method",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the payment method you want to use.",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = selectedIndex == index;
                return PaymentOptions(
                  svgAssetName: svg[index],
                  nameofOption: names[index],
                  endIcon: widget.isNavigatedFromProfile
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline_rounded),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          icon: Icon(
                            isSelected ? Icons.circle : Icons.circle_outlined,
                            color: isSelected ? Colors.black : Colors.grey,
                          ),
                        ),
                );
              },
            ),
            // PaymentOptions(
            //   mainIcon: Icons.account_balance_wallet,
            //   nameofOption: "",
            //   endIcon:widget.isNavigatedFromProfile
            //       ? IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_rounded))
            //       : IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined)),
            // ),
            // PaymentOptions(
            //   nameofOption: "",
            //   svgAssetName: "assets/google.svg",
            //   endIcon: widget.isNavigatedFromProfile
            //       ? IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_rounded))
            //       : IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined)),
            // ),
            // PaymentOptions(
            //   nameofOption: "",
            //   mainIcon: Icons.apple,
            //   endIcon: widget.isNavigatedFromProfile
            //       ? IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_rounded))
            //       : IconButton(onPressed: (){
            //         // setState(() {
            //         //   if()
            //         // });
            //   }, icon: Icon(Icons.circle_outlined,)),
            // ),
            // PaymentOptions(
            //   nameofOption: "",
            //   svgAssetName: "assets/mastercard.svg",
            //   endIcon: widget.isNavigatedFromProfile
            //       ? IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_rounded))
            //       : IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined)),
            // ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton.icon(
                onPressed: () {
                  if (widget.isNavigatedFromProfile) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCard()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnterPinPage()),
                    );
                  }
                },
                label: Text(
                  widget.isNavigatedFromProfile
                      ? "Add Card"
                      : "Continue to payment",
                  style: TextStyle(color: Colors.white),
                ),
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

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    super.key,
    this.mainIcon,
    required this.nameofOption,
    this.svgAssetName,
    required this.endIcon,
  });

  final String? svgAssetName;
  final String nameofOption;
  final IconData? mainIcon;
  final Widget endIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
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
                  : SizedBox(
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset("$svgAssetName"),
                    ),
              SizedBox(width: 5),
              Text(nameofOption, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          endIcon,
        ],
      ),
    );
  }
}
