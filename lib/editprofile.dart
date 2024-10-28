import 'package:blog_app/profilepage.dart';
import 'package:blog_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Profile Picture
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  _image != null
                      ? CircleAvatar(
                    radius: 80,
                    backgroundImage: MemoryImage(_image!),
                  )
                      : const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo, size: 30, color: Colors.black),
                      color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Input Fields
              _buildTextField('First Name'),
              const SizedBox(height: 16),
              _buildTextField('Last Name'),
              const SizedBox(height: 16),
              _buildTextField('Username'),
              const SizedBox(height: 16),
              _buildTextField('Email', keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 40),
              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.yellow.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(_getIconForHint(hintText)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      keyboardType: keyboardType,
    );
  }

  IconData _getIconForHint(String hintText) {
    switch (hintText) {
      case 'Email':
        return Icons.email;
      case 'Username':
        return Icons.person;
      case 'Last Name':
      case 'First Name':
        return Icons.person_outline;
      default:
        return Icons.text_fields;
    }
  }
}
