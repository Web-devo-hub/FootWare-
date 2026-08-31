import 'package:flutter/material.dart';
import 'package:footware/features/Product/product_description.dart';

import '../../constants/dome_constant_data.dart';


class ItemCategory extends StatefulWidget {
   const ItemCategory({super.key, this.category});

  final Map<String ,dynamic>? category;
  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  // int index = 0;
  int selectedIndex = 0;
  // int shoeIndex = 0;
  int? selectedShoeIndex ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
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
          "Nike",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            var isSelectedShoe = selectedShoeIndex==shoeIndex;
            final productCategory = widget.category?["products"][shoeIndex];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product(productDetail: productCategory,),
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
                              image: NetworkImage("${productCategory["image"]}"),
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
                              color: isSelectedShoe? Colors.red :Colors.black ,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedShoeIndex = shoeIndex;
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
                      "${productCategory["name"]}",
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
                          "${productCategory["rating"]}",

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
                            "${productCategory["itemsSold"]}",

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
                      "Rs.${productCategory["price"]}",

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
    );
  }
}
