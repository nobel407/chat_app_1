import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement registration logic here
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
