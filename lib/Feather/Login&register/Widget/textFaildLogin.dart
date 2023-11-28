import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shard/text.dart';

TextFormField textFaildLogin({
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  TextInputType? keyboardType,
  TextEditingController? controller,
  String? hintText,
  required String name,
  required IconData prefixIcon,
  IconData? suffixIcon,
  bool obscureText = false,
  required void Function()? onPressedicon,
}) {
  return TextFormField(
    obscureText: obscureText,
    validator: validator,
    onChanged: onChanged,
    keyboardType: keyboardType,
    cursorColor: Colors.grey,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      hintText: hintText,
      label: Text(
        name,
        style: StyleText.textStyle18,
      ),
      prefixIcon: Icon(
        prefixIcon,
      ),
      suffixIcon: IconButton(
        onPressed: onPressedicon,
        icon: Icon(
          suffixIcon,
        ),
      ),
    ),
  );
}
