import 'package:chat_app1/pages/homepage.dart';
import 'package:flutter/material.dart';

import '../pages/chatpage.dart';

class ChatScreen extends StatelessWidget {
  final List<String> chatList = [
    "Chat 1",
    "Chat 2",
    "Chat 3",
    "Chat 4",
    "Chat 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              print("KLIK MORE");
            },
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ), // Menampilkan AppBar pada ChatScreen
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          final chatItem = chatList[index];
          return ListTile(
            title: Text(chatItem),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
