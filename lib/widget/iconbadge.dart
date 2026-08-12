import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgButton extends StatelessWidget {
  const CustomSvgButton({super.key, required this.svgLocation});
final String svgLocation;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 80,
        padding: EdgeInsets.all(15),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: SvgPicture.asset(
          svgLocation,

        ),
      ),
    );
  }
}
