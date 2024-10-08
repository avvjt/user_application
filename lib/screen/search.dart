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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back), // Back button icon
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12.0), // Right-side margin
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0), // Reduce height
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
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                  });
                                },
                              )
                            : null, // Cross button
                      ),
                      onChanged: (value) {
                        setState(() {}); // Trigger suffix icon update
                      },
                      onSubmitted: (value) => _handleSearch(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (recentSearches.isNotEmpty) ...[
              Text(
                'Recent Searches',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: recentSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(recentSearches[index]),
                      leading: Image.asset(
                        'lib/assets/search.png', // Replace with your asset path
                        width: 24, // Adjust width as needed
                        height: 24, // Adjust height as needed
                      ),
                      trailing: Image.asset(
                        'lib/assets/search_arrow.png', // Replace with your asset path
                        width: 24, // Adjust width as needed
                        height: 24, // Adjust height as needed
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
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrackOrder(),
                        ),
                      );
                    },
                    child: Text('Track your order'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      minimumSize: const Size(330, 50),
                      elevation: 5.0,
                    ).copyWith(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
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
