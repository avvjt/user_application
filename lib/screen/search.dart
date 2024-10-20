import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/track_order.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];
  List<dynamic> searchResults = []; // To hold search results

  Future<void> _handleSearch() async {
    final query = _searchController.text;

    if (query.isNotEmpty) {
      setState(() {
        recentSearches.add(query);
        _searchController.clear();
      });

      // Call the API for search results
      await searchVideos(query);
    }
  }

  Future<void> searchVideos(String title) async {
    // Replace the URL with your actual API endpoint
    final response = await http.get(
      Uri.parse(
          'https://bypriyan.com/userapp-api/search_videos.php?title=$title'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        searchResults = data['videos'] ?? []; // Safeguard against null
      });
    } else {
      throw Exception('Failed to load videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06), // Responsive spacing
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: screenWidth * 0.07, // Responsive icon size
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.03), // Responsive margin
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight *
                              0.015, // Responsive vertical padding
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: AppColors.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: AppColors.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: AppColors.primaryColor),
                        ),
                        prefixIcon: Icon(Icons.search,
                            size: screenWidth * 0.06), // Responsive icon
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon:
                                    Icon(Icons.clear, size: screenWidth * 0.06),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                  });
                                },
                              )
                            : null, // Clear button
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      onSubmitted: (value) => _handleSearch(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

            // Display recent searches
            if (recentSearches.isNotEmpty) ...[
              Text(
                'Recent Searches',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Expanded(
                child: ListView.builder(
                  itemCount: recentSearches.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.text = recentSearches[index];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/assets/search.png', // Replace with your asset path
                              width:
                                  screenWidth * 0.06, // Responsive image width
                              height: screenHeight *
                                  0.03, // Responsive image height
                            ),
                            SizedBox(width: 10), // Space between image and text
                            Expanded(
                              child: Text(
                                recentSearches[index],
                                style: TextStyle(fontSize: screenWidth * 0.04),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                            Image.asset(
                              'lib/assets/search_arrow.png', // Replace with your asset path
                              width:
                                  screenWidth * 0.06, // Responsive image width
                              height: screenHeight *
                                  0.03, // Responsive image height
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

            // Display search results if available
            if (searchResults.isNotEmpty) ...[
              Text(
                'Search Results',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final video = searchResults[index];
                    final title = video['title'] ?? 'No title available';
                    final imageUrl = video['image'] ?? 'default_image_url_here';

                    return GestureDetector(
                      onTap: () {
                        // Handle video item tap (e.g., navigate to video detail screen)
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            // Using Fixed width for the image
                            Image.network(
                              imageUrl,
                              width: screenWidth * 0.1, // Ensure this fits well
                              height: screenHeight * 0.05,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                                width: 10), // Space between image and title
                            // Wrap the Text in Expanded to prevent overflow
                            Expanded(
                              child: Text(
                                title,
                                style: TextStyle(fontSize: screenWidth * 0.04),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else ...[
              // Show a message if no search results are found
              Expanded(
                child: Center(
                  child: Text(
                    'No search results found',
                    style: TextStyle(
                      fontSize: screenWidth * 0.0405,
                    ),
                  ),
                ),
              ),
            ],

            // Track order button
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.024),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.056,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrackOrder(),
                        ),
                      );
                    },
                    child: Text(
                      'Track your order',
                      style: TextStyle(
                        fontSize: screenWidth * 0.036,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.012,
                        horizontal: screenWidth * 0.08,
                      ),
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
