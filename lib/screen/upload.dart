import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:user_application/constants/colors.dart';
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
    var status = await Permission.storage.status;

    if (!status.isGranted) {
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
    // Navigate to another page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadDetails(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChooseVideoButton(),
                SizedBox(height: 20),
                if (_videoFile != null) ...[
                  _buildVideoInfo(),
                  SizedBox(height: 20),
                  if (_isUploading) _buildUploadProgress(),
                ],
                SizedBox(height: 20),
                _buildUploadButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChooseVideoButton() {
    return ElevatedButton(
      onPressed: _chooseVideo,
      child: Text('Choose from Gallery'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 2.0,
        ),
        minimumSize: Size(double.infinity, 50), // Full width button
      ),
    );
  }

  Widget _buildVideoInfo() {
    return Column(
      children: [
        Text(
          'File Uploaded: ${_videoFile!.path.split('/').last}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildUploadProgress() {
    return Column(
      children: [
        LinearProgressIndicator(value: _uploadProgress / 100),
        SizedBox(height: 10),
        Text('${_uploadProgress.toInt()}%', style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildUploadButton() {
    return ElevatedButton(
      onPressed: _isUploading ? null : _continue,
      child: Text('Upload Video'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        minimumSize: const Size(330, 50),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class UploadDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Details'),
      ),
      body: Center(
        child: Text('You have navigated to Upload Details!'),
      ),
    );
  }
}
