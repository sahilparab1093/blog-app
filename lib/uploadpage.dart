import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blog_app/homepage.dart';
import 'package:blog_app/profilepage.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        // Handle the case where no image is picked
      }
    });
  }

  void _showSnackBar(BuildContext context, String message, {Color color = Colors.black}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleUpload() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (_image != null && title.isNotEmpty && description.isNotEmpty) {
      // Show success SnackBar
      _showSnackBar(context, 'Successfully uploaded', color: Colors.green);
    } else {
      // Show error SnackBar
      _showSnackBar(context, 'Not completed. Please select an image, and enter title and description.', color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: const Icon(Icons.arrow_back_outlined, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 130),
              InkWell(
                onTap: () {
                  getImageFromGallery();
                },
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: _image != null
                      ? Image.file(_image!.absolute, fit: BoxFit.cover)
                      : const Center(
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child:TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: 'Select Date',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _handleUpload,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  decoration: BoxDecoration(
                    color: Colors.yellow[900],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
