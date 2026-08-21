import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
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
          "Track Order",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
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
                      width: 185,
                      height: 145,
        
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Icon(Icons.circle, size: 20, color: Colors.blue),
                                SizedBox(width: 5),
        
                                Text(
                                  "Blue",
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
        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$105.00",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
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
              ),
              SizedBox(height: 20),
              EasyStepper(
                stepRadius: 20,
                direction: Axis.horizontal,
                verticalAlignment: CrossAxisAlignment.start,
                lineStyle: LineStyle(lineType: LineType.dashed),
                activeStep: 4,
                steps: [
                  EasyStep(icon: Icon(Icons.card_giftcard_outlined)),
                  EasyStep(icon: Icon(Icons.delivery_dining)),
                  EasyStep(icon: Icon(Icons.emoji_people)),
                  EasyStep(icon: Icon(Icons.open_in_browser_outlined)),
                ],
              ),
              Text(
                "Packet In Delivery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Divider(thickness: 0.5),
              SizedBox(height: 20),
        
              SizedBox(width: double.infinity,
                child: EasyStepper(
                   // titlesAreLargerThanSteps: ,
                  showTitle: true,
                  stepRadius: 18,
                  direction: Axis.vertical,
                  verticalAlignment: CrossAxisAlignment.start,
                  lineStyle: LineStyle(lineType: LineType.dashed),
                  activeStep: 5,
                  steps: [
                    EasyStep(
                      icon: Icon(Icons.circle, color: Colors.white),
                      customTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order in Transit - Dec 17",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 89,),
                              Text("12:06"),
                            ],
                          ),
                          Text("32 Manchester Ave Zurich 8,60898"),
                        ],
                      ),
                    ),
                    EasyStep(
                      icon: Icon(Icons.circle, color: Colors.white),
                      customTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order in Transit - Dec 17",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 89,),
                              Text("12:06"),
                            ],
                          ),
                          Text("32 Manchester Ave Zurich 8,60898"),
                        ],
                      ),
                    ),
                    EasyStep(
                      icon: Icon(Icons.circle, color: Colors.white),
                      customTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order in Transit - Dec 17",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 89,),
                              Text("12:06"),
                            ],
                          ),
                          Text("32 Manchester Ave Zurich 8,60898"),
                        ],
                      ),
                    ),EasyStep(
                      icon: Icon(Icons.circle, color: Colors.white),
                      customTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order in Transit - Dec 17",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 89,),
                              Text("12:06"),
                            ],
                          ),
                          Text("32 Manchester Ave Zurich 8,60898"),
                        ],
                      ),
                    ),
                    EasyStep(
                      icon: Icon(Icons.circle, color: Colors.white),
                      customTitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order in Transit - Dec 17",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 89,),
                              Text("12:06"),
                            ],
                          ),
                          Text("32 Manchester Ave Zurich 8,60898"),
                        ],
                      ),
                    ),
        
        
        
        
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
