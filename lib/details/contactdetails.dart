import 'package:chat_app1/chatscreen/callscreen.dart';
import 'package:flutter/material.dart';

import '../chatscreen/contactscreen.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${contact.name}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone Number: ${contact.phoneNumber}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallScreen(
                        recipientName: '${contact.name}',
                        recipientPhoneNumber: '${contact.phoneNumber}'),
                  ),
                );
              },
              child: Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }
}
