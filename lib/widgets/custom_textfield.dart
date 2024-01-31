import 'package:flutter/material.dart';

class CustomTextFromfield extends StatelessWidget {
  const CustomTextFromfield({
    super.key,
    required this.hintText,
    this.onChanged, required this.pass,
  });

  final String hintText;
  final Function(String)? onChanged;
  final bool pass;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
