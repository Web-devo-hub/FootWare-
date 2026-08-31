import 'package:flutter/material.dart';
import 'package:footware/constants/dome_constant_data.dart';
import 'package:footware/features/Product/product_description.dart';

class FavouriteItems extends StatefulWidget {
  const FavouriteItems({super.key});

  @override
  State<FavouriteItems> createState() => _FavouriteItemsState();
}

class _FavouriteItemsState extends State<FavouriteItems> {
  // int index = 0;
  int selectedIndex = 0;
  // int shoeIndex = 0;
  int? selectedShoeIndex ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,

        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 35),
          ),
        ],
        backgroundColor: Colors.grey[50],
        toolbarHeight: 90,
        title: Text(
          "My Favourite",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {

                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                      height: 20,
                      // width: 80,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.black, width: 1.3),
                        color: isSelected ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "adidas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected? Colors.white:Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, shoeIndex) {
                  // var isSelectedShoe = selectedShoeIndex==shoeIndex;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Product(),
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
                                    image: AssetImage("assets/ShoeImage.jpeg"),
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
                                    color: Colors.red  ,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedShoeIndex = shoeIndex;
                                        });

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
                            "K-Swiss Vista Train..",
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
                                "4.5",
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
                                  "8370 sold",
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
                            "\$85.00",
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
    );
  }
}
