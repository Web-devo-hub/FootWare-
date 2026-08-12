
import 'package:flutter/material.dart';

import '../homepage.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onTap});
final  String  title ;
final void Function()? onTap;
   @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey[800],
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
