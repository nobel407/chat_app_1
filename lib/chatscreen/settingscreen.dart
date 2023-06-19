import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String username = 'John Doe';
  File? imageFile;

  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = username;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  // Fungsi untuk memilih gambar profil dari galeri
  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  // Fungsi untuk mengupdate nama pengguna
  void _updateUsername(String newName) {
    setState(() {
      username = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')), // Menghapus AppBar
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _pickImage();
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: imageFile != null
                      ? DecorationImage(
                          image: FileImage(imageFile!),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: AssetImage('assets/profile_image.png'),
                          fit: BoxFit.cover,
                        ),
                ),
                child: imageFile != null
                    ? null
                    : Icon(Icons.add_photo_alternate, size: 60),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Edit Profile Picture',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              onChanged: (value) {
                _updateUsername(value);
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
