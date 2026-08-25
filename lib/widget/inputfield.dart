import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {
    super.key,
     this.textOfField,
    this.suffixIcon,
    required this.obscure,
    this.prefixIcon, this.controller,
  });

  final String? textOfField;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        enabled: true,
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: prefixIcon,
        // suffixIcon: IconButton(onPressed: (){}, icon: Icon(suffixIconData)),
        suffixIcon: suffixIcon,
        hintText: textOfField,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
