import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final labelText;
  // ignore: prefer_typing_uninitialized_variables
  final prefixIcon;
  // ignore: prefer_typing_uninitialized_variables
  final suffixIcon;
  const MyTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
