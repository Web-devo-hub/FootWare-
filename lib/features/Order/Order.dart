import 'package:flutter/material.dart';
import 'package:footware/features/Order/trackorder.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        scrolledUnderElevation: 0,

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),

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
        leadingWidth: 250,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Text(
            "My Orders",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  // border: BoxBorder.fromLTRB(bottom: BorderSide(width: 2)),
                ),
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isActive = true;
                        });
                      },
                      child: Text(
                        "Active",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isActive? Colors.black:Colors.grey,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isActive = false;
                        });

                      },
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: isActive ? Colors.grey: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Divider(

                      thickness: isActive?  2 : 0.5,
                      color: Colors.black,

                    ),
                  ),


                  Expanded(
                    child: Divider(
                      thickness: isActive? .5:2,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 20),
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kaifshoes.jpeg"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          // color: Colors.red,
                          width: 220,
                          height: 145,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Air Jordan 3 Retro",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 20,
                                      color: index.isEven
                                          ? Colors.grey
                                          : Colors.blue,
                                    ),
                                    SizedBox(width: 5),

                                    Text(
                                      index.isEven ? "Grey" : "Blue",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Size = 42",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Qty = 2",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 90,
                                  height: 29,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "In Delivery",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$105.00",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(0),
                                      width: 110,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> TrackOrder()));
                                        },
                                        child: Text(
                                          "Track Order",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
