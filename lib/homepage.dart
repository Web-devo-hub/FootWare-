import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footware/widget/inputfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        // backgroundColor: Colors.blue,
        leadingWidth: 250,
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage("assets/images.jpeg"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Good Morning",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "Muhammad Kaif",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.bell)),
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.heart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            CustomInputField(
              textOfField: "Search",
              obscure: false,
              prefixIconData: Icons.search,
              suffixIconData: Icons.tune_outlined,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special Offers",
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
            SizedBox(height: 15),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            width: 390,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("shoesred.jpeg"),
                                fit: BoxFit.fill,
                              ),
                              // boxShadow: [ BoxShadow(color: Colors.grey, blurRadius: 1 , spreadRadius: 10),],
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 25, top: 45),
                                height: 200,
                                width: 130,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "25%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Today's Special!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "Get discount for every order only valid for today",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(

              color: Colors.blue,

              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
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
