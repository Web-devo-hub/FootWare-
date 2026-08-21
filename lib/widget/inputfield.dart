import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
     this.textOfField,
    this.prefixIconData,
    this.suffixIconData,
    required this.obscure,
  });

  final String? textOfField;
  final IconData? suffixIconData;
  final IconData? prefixIconData;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        enabled: true,
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(prefixIconData, size: 18, color: Colors.grey[500]),
        suffixIcon: Icon(suffixIconData, size: 18, color: Colors.grey[500]),
        hintText: textOfField,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
