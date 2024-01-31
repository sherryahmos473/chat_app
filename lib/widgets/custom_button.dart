import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({super.key,this.ontap, required this.title});

  final String title;
  final VoidCallback? ontap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text(title)),
      ),
    );
  }
}
