import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartTileWidget extends StatefulWidget {
  const CartTileWidget({
    super.key,
    required this.imageLocation,
    required this.productName,
    required this.productPrice,
    this.index,
    this.colorValue,
    this.sizeValue,

    required this.quantity,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  final String imageLocation;
  final String productName;
  final String productPrice;

  final int? index;
  final int? colorValue;
  final int? sizeValue;

  final int quantity;
  final Function(int) onQuantityChanged;
  final VoidCallback onDelete;

  @override
  State<CartTileWidget> createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 160,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          // ---------------- IMAGE ----------------
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 110,
            height: 110,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageLocation),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // ---------------- PRODUCT DETAILS ----------------
          SizedBox(
            width: 230,
            height: 145,

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  // ---------------- NAME + DELETE ----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Expanded(
                        child: Text(
                          widget.productName,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: widget.onDelete,
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          size: 26,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ---------------- COLOR + SIZE ----------------
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 20,
                        color: Color(widget.colorValue ?? 0xff000000),
                      ),

                      const SizedBox(width: 5),

                      const Text(
                        "color",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 5),

                      const Text(
                        "|",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 5),

                      Text(
                        "Size = ${widget.sizeValue}",

                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // ---------------- PRICE + COUNTER ----------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      // PRICE
                      Text(
                        widget.productPrice,

                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // ---------------- COUNTER ----------------
                      Container(
                        width: 110,
                        height: 40,

                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            // MINUS
                            IconButton(
                              onPressed: () {
                                if (widget.quantity > 1) {
                                  widget.onQuantityChanged(widget.quantity - 1);
                                }
                              },

                              icon: const FaIcon(
                                FontAwesomeIcons.minus,
                                size: 8,
                              ),
                            ),

                            // QUANTITY
                            Text(
                              "${widget.quantity}",

                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // PLUS
                            IconButton(
                              onPressed: () {
                                widget.onQuantityChanged(widget.quantity + 1);
                              },

                              icon: const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 8,
                              ),
                            ),
                          ],
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
  }
}
