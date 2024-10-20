import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/cart.dart';
import 'package:user_application/screen/watch_video.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> videos = [];

  @override
  void initState() {
    super.initState();
    fetchVideos(); // Fetch video data when the screen initializes
  }

  void fetchVideos() async {
    // Replace with your API endpoint
    var response = await http
        .get(Uri.parse('https://bypriyan.com/userapp-api/fetchvideo.php'));

    if (response.statusCode == 200) {
      setState(() {
        videos = json.decode(response.body)[
            'videos']; // Assuming 'videos' is a list in the API response
      });
    } else {
      print('Failed to load videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          // Row with Icon and Text
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo from assets
                Image.asset(
                  'lib/assets/home_logo.png',
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'As an Italian Cook',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/search.png',
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cart()),
                        );
                      },
                      child: Image.asset(
                        'lib/assets/cart.png',
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),

          // Dynamic video list
          Expanded(
            child: ListView.builder(
              itemCount: videos.length, // Use the length of the videos list
              itemBuilder: (context, index) {
                return VideoTile(
                  screenWidth: screenWidth,
                  videoUrl: videos[index]
                      ['video_url'], // Fetch video URL dynamically
                  title: videos[index]['title'], // Fetch title dynamically
                  description: videos[index]
                      ['description'], // Fetch description dynamically
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoTile extends StatefulWidget {
  final double screenWidth;
  final String videoUrl;
  final String title;
  final String description;

  const VideoTile({
    Key? key,
    required this.screenWidth,
    required this.videoUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {}); // Update the UI once the video is initialized
        // _controller.play(); // Start playing the video immediately
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video player widget
          Container(
            height: widget.screenWidth * 0.5,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(
                    child:
                        CircularProgressIndicator()), // Show loading indicator while initializing
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video title
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  widget.title, // Display dynamic video title
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: widget.screenWidth * 0.045,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/profile_image.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abhi", // Static username (can be dynamic)
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: widget.screenWidth * 0.04,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.description, // Dynamic video description
                          style: TextStyle(
                            color: AppColors.hint,
                            fontSize: widget.screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
