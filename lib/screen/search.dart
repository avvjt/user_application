import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/track_order.dart';

void main() {
  runApp(SearchScreen());
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = [];

  void _handleSearch() {
    final query = _searchController.text;

    if (query.isNotEmpty) {
      setState(() {
        recentSearches.add(query);
        _searchController.clear();
      });
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
                            : null, // Cross button
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
                    return ListTile(
                      title: Text(
                        recentSearches[index],
                        style: TextStyle(
                            fontSize:
                                screenWidth * 0.04), // Responsive font size
                      ),
                      leading: Image.asset(
                        'lib/assets/search.png', // Replace with your asset path
                        width: screenWidth * 0.06, // Responsive image width
                        height: screenHeight * 0.03, // Responsive image height
                      ),
                      trailing: Image.asset(
                        'lib/assets/search_arrow.png', // Replace with your asset path
                        width: screenWidth * 0.06, // Responsive image width
                        height: screenHeight * 0.03, // Responsive image height
                      ),
                      onTap: () {
                        setState(() {
                          _searchController.text = recentSearches[index];
                        });
                      },
                    );
                  },
                ),
              ),
            ] else ...[
              Expanded(
                child: Center(
                  child: Text(
                    'No recent searches available',
                    style: TextStyle(
                      fontSize:
                          screenWidth * 0.0405, // Reduced by 10% (0.045 * 0.9)
                    ),
                  ),
                ),
              ),
            ],
            Padding(
              padding: EdgeInsets.only(
                  bottom: screenHeight * 0.024), // Increased padding by 20%
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity, // Full-width button
                  height:
                      screenHeight * 0.056, // Decreased button height by 20%
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
                        fontSize:
                            screenWidth * 0.036, // Decreased text size by 20%
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight *
                            0.012, // Decreased vertical padding by 20%
                        horizontal: screenWidth *
                            0.08, // Decreased horizontal padding by 20%
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
            )
          ],
        ),
      ),
    );
  }
}
