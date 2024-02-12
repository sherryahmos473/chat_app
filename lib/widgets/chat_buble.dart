import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.message,
  });

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize:18,
                ),
              ),
              const SizedBox(
                height: 5,
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

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({
    super.key,
    required this.message,
  });

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
            color: Color(0xff006388),
          ),
          child: Column(
            children: [
              Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize:18,
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
