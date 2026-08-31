import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footware/constants/dome_constant_data.dart';

import 'package:footware/widget/inputfield.dart';

import '../Product/favourite_items.dart';
import '../Product/product_category.dart';
import '../Product/product_description.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedIndex;
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        scrolledUnderElevation: 0,
        // backgroundColor: Colors.blue,
        leadingWidth: 250,
        leading: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 40,
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
                  Row(
                    children: [
                      Text(
                        "Good Morning",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Icon(
                        Icons.waving_hand_rounded,
                        color: Colors.orangeAccent,
                        size: 13,
                      ),
                    ],
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteItems()),
              );
            },
            icon: FaIcon(FontAwesomeIcons.heart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
          child: Column(
            children: [
              CustomInputField(
                textOfField: "Search",
                obscure: false,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.tune_outlined),
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 10),

              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.8),
                      blurRadius: 40,
                      offset: Offset(0, 55),
                      spreadRadius: -60,
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      // height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/shoesred.jpeg"),
                          fit: BoxFit.fill,
                        ),
                        // color: index.isEven ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                // padding: EdgeInsets.all(0),
                height: 200,
                width: double.infinity,
                // color: Colors.greenAccent,
                child: GridView.builder(
                  itemCount: 8,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final category = jsonData["categories"][index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemCategory(category: category),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${category["categoryImage"]}",
                                  ),
                                  fit: BoxFit.fill
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${category["categoryName"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
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
              SizedBox(height: 20),
              SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  // itemCount: jsonData["mostPopular"],
                  itemCount: jsonData["mostPopular"].length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final mostPopular = jsonData["mostPopular"][index];
                    var isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Product(productDetail: mostPopular),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        ("${mostPopular["image"]}"),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentGeometry.topRight,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 15,
                                    ),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouriteItems()));
                                        },
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 5),
                            Text(
                              mostPopular["name"],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 4),

                            Row(
                              children: [
                                Icon(Icons.star_half, size: 20),
                                SizedBox(width: 5),

                                Text(
                                  "${mostPopular["rating"]}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "|",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(3),
                                  ),

                                  width: 50,
                                  height: 18,
                                  child: Text(
                                    "${mostPopular["itemsSold"]} sold",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),

                            Text(
                              "Rs.${mostPopular["price"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
