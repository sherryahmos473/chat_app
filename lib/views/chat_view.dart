import 'package:chat_app/constants.dart';
import 'package:chat_app/cubit/chat/chat_cubit.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  final _controller = ScrollController();
  TextEditingController controler = TextEditingController();
  List<Message> messagesList = [];

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const Spacer(flex: 1),
            Image.asset(logo, height: 50, width: 50),
            const Text('Chat'),
            const Spacer(flex: 1),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
                FirebaseAuth.instance.signOut();
              },
              child: const Text('logout', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                              color: primaryColor,
                              index: 1,
                            )
                          : ChatBuble(
                              message: messagesList[index],
                              color:
                                  const Color(0xffD56C04), //Color(0xff006388),
                              index: 2,
                            );
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controler,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: const TextStyle(color: Colors.grey),
                      //filled: true, // Set to true
                      //fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 2, color: primaryColor),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    String data = controler.text.trim();
                    if (data.isNotEmpty) {
                      BlocProvider.of<ChatCubit>(context).sendMessage(
                        message: data,
                        email: email,
                      );
                      controler.clear();
                      _controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
