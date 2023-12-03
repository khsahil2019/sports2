import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/Services/apiService.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _image; // Variable to store the selected image
  ApiService _apiService = ApiService();

  Future<void> _getImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      _image = pickedImage;
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      print('Please select an image');
      return;
    }

    try {
      File imageFile = File(_image!.path);
      await _apiService.uploadImage(imageFile);
      print('Image uploaded successfully');
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
                    File(_image!.path),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  )
                : Placeholder(
                    fallbackHeight: 150,
                    fallbackWidth: 150,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.gallery),
              child: Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera),
              child: Text('Take Picture'),
            ),
            ElevatedButton(
              onPressed: () {
                _uploadImage();
                log("message");
              },
              child: Text('Upload Picture'),
            ),
            // ElevatedButton(
            //   onPressed: () => _uploadImage(),
            //   child: Text('Upload Picture'),
            // ),
          ],
        ),
      ),
    );
  }
}
