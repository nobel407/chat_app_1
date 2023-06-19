import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Change profile picture logic
              },
              child: Text('Change Profile Picture'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(hintText: 'Name'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Update profile name logic
              },
              child: Text('Update Name'),
            ),
          ],
        ),
      ),
    );
  }
}
