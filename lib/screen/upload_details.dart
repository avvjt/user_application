import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/order_sucessful.dart';
import 'package:user_application/screen/product_list.dart';

class UploadDetails extends StatefulWidget {
  @override
  _UploadDetailsState createState() => _UploadDetailsState();
}

class _UploadDetailsState extends State<UploadDetails> {
  // Controllers to retrieve the input values
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _titleController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    super.dispose();
  }

  // Function to handle adding a product
  void _addProduct() {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String ingredients = _ingredientsController.text;

    // You can handle your logic here, like submitting the data to a backend
    print('Title: $title');
    print('Description: $description');
    print('Ingredients: $ingredients');
  }

  // Function to handle video upload
  void _uploadVideo() {
    // Here you can open the file picker for video selection
    print('Video upload button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Details', // Modified title
          style: TextStyle(
            fontSize: 20, // Custom font size
            fontWeight: FontWeight.bold, // Custom font weight
            color: Colors.black, // Custom text color
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Adding padding around the form
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch to take full width
          children: [
// Title TextView and Curved TextField
            Text(
              'Title',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold), // Customize the style as needed
            ),
            SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // More curved edges
                  borderSide: BorderSide(
                    color: Colors.green, // Green border color
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Curved edges when focused
                  borderSide: BorderSide(
                    color: Colors.green, // Green border when focused
                    width: 1.0, // Make the border thicker when focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 18), // Add space between fields

// Description TextView and Curved TextField
            Text(
              'Description',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // More curved edges
                  borderSide: BorderSide(
                    color: Colors.green, // Green border color
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Curved edges when focused
                  borderSide: BorderSide(
                    color: Colors.green, // Green border when focused
                    width: 1.0, // Thicker border when focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),

// Ingredients TextView and Curved TextField
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _ingredientsController,
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // More curved edges
                  borderSide: BorderSide(
                    color: Colors.green, // Green border color
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Curved edges when focused
                  borderSide: BorderSide(
                    color: Colors.green, // Green border when focused
                    width: 1.0, // Thicker border when focused
                  ),
                ),
              ),
            ),

            Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductList()),
                );
              },
              child: Text('Add Product'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16), // Larger button
                backgroundColor: Colors
                    .white, // Change this to your desired background color
                foregroundColor: AppColors
                    .primaryColor, // Change this to your desired text color
                side: BorderSide(
                  color: AppColors
                      .primaryColor, // Change this to your desired border color
                  width: 2.0, // Border width
                ),
              ),
            ),

            SizedBox(height: 20), // Space between buttons

            // Upload Video Button
            Container(
              width: double.infinity, // Makes the button full width
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Payment Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderSucessful()),
                  );
                },
                child: Text('Upload Video'),
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
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
