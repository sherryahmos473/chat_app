import 'package:flutter/material.dart';

class CustomTextFromfield extends StatelessWidget {
  const CustomTextFromfield({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD56C04)),
        ),
      ),
    );
  }
}
