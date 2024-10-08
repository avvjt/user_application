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
  List<int> _quantities = List.generate(3, (index) => 0); // Quantity for each product
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];

  // Static description text
  final String _description =
      "This is a sample description that is quite long and will be shown partially until the user clicks 'Show More'.";

  bool _showFullDescription = false; // Control the visibility of the full description

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
            SizedBox(height: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Title Text with Padding
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Vegetable salad | Healthy Diet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8),

                // Username and Video Information
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
                            "Abhi",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "60 k views • 2 days ago",
                            style: TextStyle(
                              color: AppColors.hint,
                              fontSize: 13,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _showFullDescription
                        ? _description
                        : (_description.length > 50
                            ? '${_description.substring(0, 50)}...'
                            : _description),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                  SizedBox(height: 8),
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
                        fontSize: 16,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
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
                        contentPadding: EdgeInsets.all(16),
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
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Product List
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommended Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            builder: (context) => ProductDescription(index: index)),
                      );
                    },
                    child: _buildProductCard(index), // Your product card
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each product card
  Widget _buildProductCard(int index) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 2),
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
                  height: 140,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              // Overlapping Add button
              Positioned(
                bottom: 0,
                child: _quantities[index] == 0
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _quantities[index] = 1; // Start with quantity 1
                          });
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_quantities[index] > 0) {
                                  _quantities[index]--;
                                }
                              });
                            },
                          ),
                          Text(
                            '${_quantities[index]}',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                _quantities[index]++;
                              });
                            },
                          ),
                        ],
                      ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Product Name',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            '\$10.99',
            style: TextStyle(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
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
