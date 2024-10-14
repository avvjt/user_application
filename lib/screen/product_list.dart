import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<int> _quantities =
      List.generate(10, (index) => 0); // Quantity for each product
  String searchQuery = '';

  // Function to handle search
  void _handleSearch(String query) {
    setState(() {
      searchQuery = query;
    });
    print('Search query: $query'); // You can use this query to search products
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'), // Title for the AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor:
            Colors.transparent, // Modify the app bar color if needed
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView for scrolling
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Adding padding around the content
          child: Column(
            children: [
              Material(
                elevation: 4, // Change this value for more or less elevation
                borderRadius: BorderRadius.circular(
                    10.0), // Match with TextField border radius for consistency
                shadowColor: Colors.black.withOpacity(
                    0.2), // Adjust shadow color and opacity if needed
                child: SizedBox(
                  height:
                      48, // Adjust the height (10% smaller than a standard TextField)
                  child: TextField(
                    onChanged: (value) {
                      _handleSearch(value); // Handle the search input
                    },
                    decoration: InputDecoration(
                      labelText: 'Search', // Placeholder text
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Slightly curved edges
                        borderSide: BorderSide(
                          color: Colors
                              .green, // Change this to your desired border color
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Keep the same curve when focused
                        borderSide: BorderSide(
                          color: Colors
                              .green, // Change this to your desired border color when focused
                          width: 2.0, // Make the border thicker when focused
                        ),
                      ),
                      prefixIcon: Icon(Icons.search), // Add a search icon
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Spacing between search bar and product

              // Product Grid
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  childAspectRatio:
                      0.75, // Adjust to control the height of the items
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount:
                    6, // Number of products (you can update this as per your data)
                shrinkWrap:
                    true, // Allow the GridView to take the height it needs
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView's own scroll
                itemBuilder: (context, index) {
                  return _buildProductCard(index); // Build each product item
                },
              ),
            ],
          ),
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
                          Navigator.pop(context);
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
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
                          Text('${_quantities[index]}'),
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
          // Texts below each product
          Text("Fuji Apple",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor)),
          Text("10 min",
              style: TextStyle(fontSize: 14, color: AppColors.primaryColor)),
          Text("30% OFF", style: TextStyle(fontSize: 14, color: Colors.black)),
          Text("\$2", style: TextStyle(fontSize: 15, color: Colors.black)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductList(),
  ));
}
