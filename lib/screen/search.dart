import 'package:flutter/material.dart';
import 'package:user_application/screen/delivery_location.dart';
import 'package:user_application/screen/home.dart';
import 'package:user_application/screen/track_order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
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
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search here...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) => _handleSearch(),
            ),
            SizedBox(height: 20),

            if (recentSearches.isNotEmpty) ...[
              Text(
                'Recent Searches',
                style: TextStyle(
                  fontSize: 18,
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
                      leading: Icon(Icons.history),
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

             // Search Button
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for search
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackOrder(), // Navigate to LoginScreen
                  ),
                );
                    },
                    child: Text('Track your order'),
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
