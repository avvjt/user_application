import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/product_description.dart';
import 'package:video_player/video_player.dart';

class WatchVideo extends StatefulWidget {
  @override
  _WatchVideoState createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  late VideoPlayerController _controller;
  List<int> _quantities = List.generate(3, (index) => 0);
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];

  final String _description =
      "This is a sample description that is quite long and will be shown partially until the user clicks 'Show More'.";

  bool _showFullDescription = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
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
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video player
            AspectRatio(
              aspectRatio: _controller.value.isInitialized
                  ? _controller.value.aspectRatio
                  : 16 / 9,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : Center(child: CircularProgressIndicator()),
            ),
            SizedBox(height: screenHeight * 0.02),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title Text with Padding
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Text(
                    "Vegetable salad | Healthy Diet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),

                // Username and Video Information
// Username and Video Information
Row(
  crossAxisAlignment: CrossAxisAlignment.center, // Align items vertically centered
  children: [
    Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.04),
      child: CircleAvatar(
        radius: screenWidth * 0.1, // Adjusted for responsiveness
        backgroundColor: Colors.transparent, // Set to transparent
        child: ClipOval(
          child: Image.asset(
            'lib/assets/profile_image.png',
            width: screenWidth * 0.1,
            height: screenWidth * 0.1,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    SizedBox(width: screenWidth * 0.016), // Reduced spacing by 20%
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        children: [
          Text(
            "Abhi",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: screenWidth * 0.04,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "60 k views • 2 days ago",
            style: TextStyle(
              color: AppColors.hint,
              fontSize: screenWidth * 0.035,
            ),
          ),
        ],
      ),
    ),
  ],
),




              ],
            ),

            // Description Section
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    _showFullDescription
                        ? _description
                        : (_description.length > 50
                            ? '${_description.substring(0, 50)}...'
                            : _description),
                    style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showFullDescription = !_showFullDescription;
                      });
                    },
                    child: Text(
                      _showFullDescription ? 'Show Less...' : '...See More',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),

            // Comment Section
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
                          backgroundImage: AssetImage(comment.userProfileImage),
                        ),
                        title: Text(comment.commentText),
                        subtitle: Text(
                          "${comment.postedDate.hour}:${comment.postedDate.minute} on ${comment.postedDate.day}/${comment.postedDate.month}/${comment.postedDate.year}",
                          style: TextStyle(
                              fontSize: screenWidth * 0.03, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Product List
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Text(
                'Recommended Products',
                style: TextStyle(
                    fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
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
            SizedBox(height:30),
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
    height: MediaQuery.of(context).size.width * 0.28, // Reduced height (20% less than 0.35)
    width: MediaQuery.of(context).size.width * 0.32, // Reduced width (20% less than 0.4)
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

class Comment {
  final String userProfileImage;
  final String commentText;
  final DateTime postedDate;

  Comment({
    required this.userProfileImage,
    required this.commentText,
    required this.postedDate,
  });
}
