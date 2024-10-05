import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // For video playback

class WatchVideo extends StatefulWidget {
  @override
  _WatchVideoState createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  late VideoPlayerController _controller;
  List<int> _quantities = List.generate(3, (index) => 0); // Quantity for each product

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://www.youtube.com/watch?v=3cQLwytjuBU'), // Replace with actual video URL
    )
      ..initialize().then((_) {
        setState(() {});  // Update UI after video initialization
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Video'),
      ),
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

            // Video title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sample Video Title',  // Replace with actual video title
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // User's name and publishing time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/profile_pic.png'),  // User's profile picture
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',  // Replace with actual user name
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Published 2 days ago',  // Replace with actual publishing time
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Comment Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // Comments List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CommentWidget(
                    username: 'John Doe',
                    comment: 'Great video! I learned a lot.',
                    time: '5 hours ago',
                  ),
                  Divider(),
                  CommentWidget(
                    username: 'Jane Smith',
                    comment: 'This was really helpful, thanks!',
                    time: '1 day ago',
                  ),
                  Divider(),
                  CommentWidget(
                    username: 'Chris Evans',
                    comment: 'Can you make a video on the next topic?',
                    time: '3 days ago',
                  ),
                  // Add more comments as needed
                ],
              ),
            ),

            SizedBox(height: 20),

            // Comment input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Submit comment action
                    },
                    child: Text('Post'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Product List
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommended Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Product list horizontally scrollable
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  return _buildProductCard(index);
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  // Function to build each product card
  Widget _buildProductCard(int index) {
    return Container(
      width: 150, // Width for each product card
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // Product image
          Image.asset(
            'assets/product_image.png', // Replace with your image asset
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),

          // Conditional rendering of buttons
          _quantities[index] == 0
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _quantities[index] = 1; // Start with quantity 1
                    });
                  },
                  child: Text('Add'),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_quantities[index] > 0) {
                            _quantities[index]--;
                          }
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(_quantities[index].toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _quantities[index]++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
          SizedBox(height: 10),

          // Product description or details (4 lines)
          Text(
            'Product Name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Price: \$99'),
          Text('Category: Electronics'),
          Text('Rating: 4.5/5'),
          Text('Stock: Available'),
        ],
      ),
    );
  }
}

// Comment Widget for displaying each comment
class CommentWidget extends StatelessWidget {
  final String username;
  final String comment;
  final String time;

  CommentWidget({
    required this.username,
    required this.comment,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/profile_pic.png'), // Profile picture of commenter
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(comment),
              SizedBox(height: 5),
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WatchVideo(),
  ));
}
