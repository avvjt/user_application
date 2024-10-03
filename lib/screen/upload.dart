import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:user_application/screen/upload_details.dart'; // Import to use File

class UploadVideoScreen extends StatefulWidget {
  @override
  _UploadVideoScreenState createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  File? _videoFile; // To store the selected video file
  double _uploadProgress = 0; // To track upload progress
  bool _isUploading = false; // To check if uploading

  final ImagePicker _picker = ImagePicker();

  Future<void> _requestPermissions() async {
    // Request storage permission
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      // If the permission is not granted, request it
      await Permission.storage.request();
    }
  }

  Future<void> _chooseVideo() async {
    await _requestPermissions(); // Ensure permissions are granted

    // Open the file manager to choose a video
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
      _uploadVideo(); // Start uploading the video after selection
    }
  }

  Future<void> _uploadVideo() async {
    setState(() {
      _isUploading = true;
      _uploadProgress = 0; // Reset progress
    });

    // Simulating upload process
    for (int i = 0; i <= 100; i += 10) {
      await Future.delayed(Duration(milliseconds: 500)); // Simulate delay
      setState(() {
        _uploadProgress = i.toDouble();
      });
    }

    setState(() {
      _isUploading = false; // Upload complete
    });
  }

  void _continue() {
    // Navigate to another page (you can define your destination)
     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadDetails(), // Navigate to LoginScreen
                  ),
                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _chooseVideo,
              child: Text('Choose from Gallery'),
            ),
            SizedBox(height: 20),
            if (_videoFile != null) ...[
              Text('File Uploaded: ${_videoFile!.path.split('/').last}'),
              SizedBox(height: 20),
              if (_isUploading) ...[
                LinearProgressIndicator(value: _uploadProgress / 100),
                SizedBox(height: 10),
                Text('${_uploadProgress.toInt()}%'),
              ]
            ],
            Spacer(),
            ElevatedButton(
              onPressed: _isUploading ? null : _continue,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('You have navigated to another page!'),
      ),
    );
  }
}
