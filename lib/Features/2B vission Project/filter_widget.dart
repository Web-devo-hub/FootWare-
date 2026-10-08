import 'package:flutter/material.dart';
import 'package:footware/theme_controller.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.widgetIcon,
    required this.widgetName,
    required this.widgetDescription,
    required this.topRightWidget,
    this.onTap,
    required this.isSelected, required this.controller, this.onTapOfEnterText, this.onChanged,
  });

  final IconData widgetIcon;
  final String widgetName;
  final String widgetDescription;
  final Widget topRightWidget;
  final void Function()? onTap;
  final void Function()? onTapOfEnterText;
  final bool isSelected;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width * 0.44,
        height: 120,
        decoration: BoxDecoration(
          color: c.cardBg, // CHANGED
          border: Border.all(
            width: isSelected ? 2 : 0.2,
            color: isSelected ? Color(0xFF38BDF8) : c.cardBorder, // CHANGED
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Icon(
              //       widgetIcon,
              //       size: 23,
              //       color: isSelected ? Color(0xFF38BDF8) : Color(0xFF8FA2BD),
              //     ),
              //     topRightWidget,
              //   ],
              // ),
              SizedBox(height: 10),
              Text(
                widgetName,
                style: TextStyle(
                  color: c.cardText, // CHANGED
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller,
                readOnly: false,
                onTap: onTapOfEnterText,
                onChanged: onChanged,
                cursorColor:  Color(0xFF38BDF8),
                style:  TextStyle(color: Color(0xFF38BDF8), fontSize: 15),
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  hintText: widgetDescription,
                  hintStyle:  TextStyle(
                    color: c.hint, // CHANGED
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}