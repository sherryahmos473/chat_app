import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(messageCollection);
  List<Message> messagesList = [];

  void sendMessage({required String message, required String email}) {
    messages.add({
      kMessage: message,
      kCreatedate: DateTime.now().toString(),
      'id': email,
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedate, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var message in event.docs) {
        messagesList.add(Message.fromJson(message));
      }
      emit(ChatSuccess(messagesList));
    });
  }
}
