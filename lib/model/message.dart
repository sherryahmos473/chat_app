import 'package:chat_app/constants.dart';

class Message {
  final String message;
  final String id;
  final String date;
  Message(this.message, this.id, this.date);

  factory Message.fromJson(json) {
    return Message(json[kMessage], json['id'],json[kCreatedate]);
  }
}
