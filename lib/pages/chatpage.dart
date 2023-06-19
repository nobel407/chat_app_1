import 'dart:io';

import 'package:chat_app1/chatscreen/callscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class Message {
  final String text;
  final String imagePath;

  Message({required this.text, required this.imagePath});
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  File? _imageFile;
  List<Message> _messages = [];

  void _selectImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<String> _saveImageToDirectory(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath =
        '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final File newImageFile = await imageFile.copy(imagePath);
    return imagePath;
  }

  void _sendMessage() async {
    String message = _messageController.text.trim();
    if (message.isNotEmpty || _imageFile != null) {
      String imagePath = '';
      if (_imageFile != null) {
        imagePath = await _saveImageToDirectory(_imageFile!);
      }
      Message newMessage = Message(text: message, imagePath: imagePath);
      setState(() {
        _messages.add(newMessage);
      });
      // Reset input fields
      _messageController.clear();
      setState(() {
        _imageFile = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a message or select an image.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreen(
                    recipientName: '',
                    recipientPhoneNumber: '',
                  ),
                ),
              );
            },
            icon: Icon(Icons.call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                Message message = _messages[index];
                return ListTile(
                  title: Text(message.text),
                  leading: message.imagePath.isNotEmpty
                      ? Image.file(File(message.imagePath))
                      : null,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: _selectImage,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
          if (_imageFile != null)
            Image.file(
              _imageFile!,
              height: 100,
            ),
        ],
      ),
    );
  }
}
