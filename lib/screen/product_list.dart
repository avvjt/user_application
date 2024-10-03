import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adding padding around the content
        child: Column(
          children: [
            // Search View (TextField)
            TextField(
              onChanged: (value) {
                _handleSearch(value); // Handle the search input
              },
              decoration: InputDecoration(
                labelText: 'Search', // Placeholder text
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search), // Add a search icon
              ),
            ),
            SizedBox(height: 20), // Spacing between search bar and product

            // Product Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  childAspectRatio: 0.75, // Adjust to control the height of the items
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6, // Number of products (you can update this as per your data)
                itemBuilder: (context, index) {
                  return _buildProductItem(); // Build each product item
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the product item
  Widget _buildProductItem() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product Image
            Image.network(
              'https://via.placeholder.com/150', // Example image URL
              height: 80,
              width: 80,
            ),
            SizedBox(height: 10),

            // Add Button
            ElevatedButton(
              onPressed: () {
                print('Add button pressed');
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              ),
            ),
            SizedBox(height: 10),

            // Quantity Text
            Text(
              'Quantity: 2',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),

            // Product Name
            Text(
              'Product Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),

            // Time Text
            Text(
              'Time: 2 hours ago',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),

            // Price Text
            Text(
              '\$29.99',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductList(),
  ));
}
