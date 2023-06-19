import 'package:flutter/material.dart';

import '../details/contactdetails.dart';
import '../pages/homepage.dart';
import 'callscreen.dart';
import 'chatscreen.dart';

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class ContactScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', phoneNumber: '1234567890'),
    Contact(name: 'Jane Smith', phoneNumber: '9876543210'),
    Contact(name: 'Alice Johnson', phoneNumber: '5551234567'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ), // Menghapus AppBar
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CallScreen(
                          recipientName: contacts[index].name,
                          recipientPhoneNumber: contacts[index].phoneNumber,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            onTap: () {
              // Aksi yang ingin dilakukan ketika kontak ditekan
              // Misalnya, pindah ke halaman detail kontak
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ContactDetailScreen(contact: contacts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
