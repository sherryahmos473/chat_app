import 'package:flutter/material.dart';

class CustomPassTextField extends StatefulWidget {
  const CustomPassTextField(
      {super.key, required this.hintText, this.onChanged});
  final String hintText;
  final Function(String)? onChanged;
  @override
  State<CustomPassTextField> createState() => _CustomPassTextFieldState();
}

class _CustomPassTextFieldState extends State<CustomPassTextField> {
  bool pass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: pass,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              pass = !pass;
            });
          },
          icon: Icon(
            pass ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
