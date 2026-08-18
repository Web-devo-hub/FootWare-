import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, toolbarHeight: 53.96),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/kaifshoes.jpeg"),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.red,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Positioned(child: Row(
                children: [

                ],
              ),)
            ],
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.50,
          ),
        ],
      ),
    );
  }
}
