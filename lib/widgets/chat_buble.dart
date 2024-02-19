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
    Alignment alignment;

    if (index == 1) {
      borderRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      );
      alignment = Alignment.centerRight;
    } else {
      borderRadius = const BorderRadius.only(
        bottomRight: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      );
      alignment = Alignment.centerLeft;
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
                  fontSize: 18,
                ),
              ),
              Text(
                message.date[11] +
                    message.date[12] +
                    message.date[13] +
                    message.date[14] +
                    message.date[15],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          )),
    );
  }
}
