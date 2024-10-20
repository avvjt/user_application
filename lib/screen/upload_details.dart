import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:user_application/screen/product_list.dart';

class UploadDetails extends StatefulWidget {
  final File videoFile; // Pass the video file to this screen

  UploadDetails({required this.videoFile});

  @override
  _UploadDetailsState createState() => _UploadDetailsState();
}

class _UploadDetailsState extends State<UploadDetails> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    super.dispose();
  }

  Future<void> _uploadVideo() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String ingredients = _ingredientsController.text;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://bypriyan.com/userapp-api/uploadvideo.php'), // Replace with your PHP upload script URL
    );
    // Add video file
    request.files
        .add(await http.MultipartFile.fromPath('video', widget.videoFile.path));

    // Add other details
    request.fields['video_title'] = title;
    request.fields['video_description'] = description;
    request.fields['ingredients'] = ingredients;

    // Send the request
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Video uploaded successfully!');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Video uploaded successfully")),
      );
      Navigator.pop(context); // Go back after upload
    } else {
      print('Error uploading video: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading video")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Title',
                style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.01),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text('Description',
                style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.01),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text('Ingredients',
                style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.01),
            TextField(
              controller: _ingredientsController,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  borderSide: BorderSide(color: Colors.green, width: 1.5),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductList()),
                );
              },
              child: Text(
                'Add Product',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                ),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryColor,
                side: BorderSide(color: AppColors.primaryColor, width: 2.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: _uploadVideo,
              child: Text('Upload Video',
                  style: TextStyle(fontSize: screenWidth * 0.04)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.1),
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.06),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}
