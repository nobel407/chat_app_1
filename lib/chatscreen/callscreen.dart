import 'package:chat_app1/pages/homepage.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String recipientName;
  final String recipientPhoneNumber;

  CallScreen({required this.recipientName, required this.recipientPhoneNumber});

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool isCallEnded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calling ${widget.recipientName}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone number: ${widget.recipientPhoneNumber}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                setState(() {
                  isCallEnded = true;
                });
              },
              child: Icon(Icons.call_end),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Lakukan tindakan tertentu saat panggilan berakhir, seperti mengirim status panggilan ke server, dll.
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isCallEnded) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      Navigator.pop(context);
    }
    super.didChangeDependencies();
  }
}
