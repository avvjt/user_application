import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart'; // Constants for colors
import 'package:user_application/screen/product_description.dart';
import 'package:video_player/video_player.dart'; // Importing video player package

// Stateful widget to watch a video
class WatchVideo extends StatefulWidget {
  final String videoUrl; // Video URL
  final String title; // Video title
  final String description; // Video description

  WatchVideo({
    required this.videoUrl,
    required this.title,
    required this.description,
  });

  @override
  _WatchVideoState createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  late VideoPlayerController _controller; // Controller for video player
  bool _isLoading = true; // To track loading state
  bool _showFullDescription = false; // To toggle description visibility
  TextEditingController _commentController =
      TextEditingController(); // Controller for comment input
  List<Comment> _comments = []; // List to store comments

  @override
  void initState() {
    super.initState();
    // Initialize the video player with the video URL passed from the home screen
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isLoading = false; // Video initialized, loading complete
        });
        _controller.play(); // Start playing the video automatically
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free resources
    _commentController.dispose(); // Dispose comment controller
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add(Comment(
          userProfileImage: 'lib/assets/profile_image.png',
          commentText: _commentController.text,
          postedDate: DateTime.now(),
        ));
        _commentController.clear(); // Clear the input after adding a comment
      });
    }
  }

  // Toggle play/pause state of the video
  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width
    final screenHeight =
        MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(screenHeight * 0.09), // Custom app bar height
        child: AppBar(
          title: Text(
            widget.title, // Display the video title
            style: TextStyle(
              fontSize: screenWidth * 0.045, // Adjust title size
              fontWeight: FontWeight.bold, // Bold title
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.black, size: screenWidth * 0.06), // Back icon
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          backgroundColor: Colors.transparent, // Transparent app bar
          elevation: 0, // No shadow
        ),
      ),
      body: _isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while video is loading
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Video player
                  AspectRatio(
                    aspectRatio: _controller.value.isInitialized
                        ? _controller.value
                            .aspectRatio // Use the video's aspect ratio if initialized
                        : 16 / 9, // Default aspect ratio for video
                    child: Stack(
                      children: [
                        _controller.value.isInitialized
                            ? VideoPlayer(
                                _controller) // Display the video player if initialized
                            : Center(
                                child:
                                    CircularProgressIndicator()), // Show loading indicator
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: _togglePlayPause, // Toggle play/pause on tap
                            child: Container(
                              color:
                                  Colors.transparent, // To capture tap events
                              child: Center(
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 64,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Spacing

                  // Video Title
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.05), // Padding for title
                    child: Text(
                      widget.title, // Use the passed title
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: screenWidth * 0.045,
                      ),
                      maxLines: 1, // Limit title to one line
                      overflow:
                          TextOverflow.ellipsis, // Ellipsis for long titles
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // Spacing

                  // Description Section
                  Padding(
                    padding: EdgeInsets.all(
                        screenWidth * 0.04), // Padding for description
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: screenWidth *
                                  0.045, // Set description label size
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Spacing

                        // Show either full description or a truncated version
                        Text(
                          _showFullDescription
                              ? widget
                                  .description // Show full description if expanded
                              : (widget.description.length >
                                      50 // Check if description is long
                                  ? '${widget.description.substring(0, 50)}...' // Truncate description if long
                                  : widget.description), // Show full if short
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Spacing

                        // Button to toggle description visibility
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _showFullDescription =
                                  !_showFullDescription; // Toggle state
                            });
                          },
                          child: Text(
                            _showFullDescription
                                ? 'Show Less...' // Show less text if expanded
                                : '...See More', // Show more text if collapsed
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // No background for button
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        // Comment Input Field
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 255, 244),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.primaryColor),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Add a comment...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: screenHeight *
                                    0.02, // Responsive vertical padding
                                horizontal: screenWidth *
                                    0.04, // Responsive horizontal padding
                              ),
                            ),
                            onSubmitted: (value) {
                              _addComment();
                            },
                          ),
                        ),

                        // Comment List
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _comments.length,
                          itemBuilder: (context, index) {
                            final comment = _comments[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(comment.userProfileImage),
                              ),
                              title: Text(comment.commentText),
                              subtitle: Text(
                                "${comment.postedDate.hour}:${comment.postedDate.minute} on ${comment.postedDate.day}/${comment.postedDate.month}/${comment.postedDate.year}",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Text(
                      'Recommended Products',
                      style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Product list horizontally scrollable
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to another page when the product card is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDescription(index: index)),
                            );
                          },
                          child: _buildProductCard(index), // Your product card
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
    );
  }

  Widget _buildProductCard(int index) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.4, // Responsive width based on screen size
      margin: EdgeInsets.symmetric(horizontal: 5), // Adjusted margin
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Rounded Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'lib/assets/product_description.png',
                  height: MediaQuery.of(context).size.width *
                      0.28, // Reduced height (20% less than 0.35)
                  width: MediaQuery.of(context).size.width *
                      0.32, // Reduced width (20% less than 0.4)
                  fit: BoxFit.cover,
                ),
              ),

              // Overlapping Add button
              Positioned(
                bottom: 0, // Aligns to the bottom of the image
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.4, // Match the image width
                  height: 40, // Fixed height for the button
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    border: Border.all(color: Colors.yellow),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Add product to cart or handle add logic
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Product Info
          SizedBox(height: 8),
          Text(
            'Product Title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text('Description here'),
        ],
      ),
    );
  }
}

// Comment class to represent each comment
class Comment {
  final String userProfileImage; // User profile image
  final String commentText; // Comment text
  final DateTime postedDate; // Date of the comment

  Comment({
    required this.userProfileImage,
    required this.commentText,
    required this.postedDate,
  });
}
