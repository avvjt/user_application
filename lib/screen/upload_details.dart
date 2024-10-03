import 'package:flutter/material.dart';
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
        title: Text('Upload Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adding padding around the form
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch to take full width
          children: [
            // Title TextField
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16), // Add space between fields

            // Description TextField
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Ingredients TextField
            TextField(
              controller: _ingredientsController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Ingredients',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32), // Add more space before buttons

            // Add Product Button
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
              ),
            ),

            SizedBox(height: 16), // Space between buttons

            // Upload Video Button
            ElevatedButton(
              onPressed: _uploadVideo,
              child: Text('Upload Video'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16), // Larger button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
