import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:user_application/constants/colors.dart';
import 'dart:io';
import 'package:user_application/screen/upload_details.dart';

class UploadVideoScreen extends StatefulWidget {
  @override
  _UploadVideoScreenState createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  File? _videoFile;
  double _uploadProgress = 0;
  bool _isUploading = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _requestPermissions() async {
    var status = await Permission.storage.status;

    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> _chooseVideo() async {
    await _requestPermissions();

    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  void _continue() {
    if (_videoFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadDetails(videoFile: _videoFile!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
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
        minimumSize: Size(double.infinity, 50),
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

  Widget _buildUploadButton() {
    return ElevatedButton(
      onPressed: _continue,
      child: Text('Continue to Upload Details'),
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
