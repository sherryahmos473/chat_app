import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
    required this.index,
    required this.color,
  });
  final int index;
  final Color color;
  final Message message;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius;
    if (index == 1) {
      borderRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      );
    } else {
      borderRadius = const BorderRadius.only(
        bottomRight: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      );
    }
    Alignment alignment;
    if (index == 2) {
      alignment = Alignment.centerLeft;
    } else {
      alignment = Alignment.centerRight;
    }
    return Align(
      alignment: alignment,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                message.date,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
            ],
          )),
    );
  }
}
