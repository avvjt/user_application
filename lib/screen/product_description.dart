import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Description'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/your_image.png', // Replace with your image path
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'This is a text below the image',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Variant 1')),
                  ElevatedButton(onPressed: () {}, child: Text('Variant 2')),
                  ElevatedButton(onPressed: () {}, child: Text('Variant 3')),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '\$99.99', // Replace with actual price
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add to Cart action
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.orange,  // Replaces 'primary'
                  foregroundColor: Colors.white,    // Replaces 'onPrimary'
                ),
              ),
              SizedBox(height: 30),

              // First text: "Description"
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Second text with "See More" functionality
              LayoutBuilder(
                builder: (context, constraints) {
                  String descriptionText = 'This is the detailed description of the product. '
                      'It can be very long, and the user can choose to see more if the text is too long to display. '
                      'This description explains everything about the product in detail.';
                  
                  // Check if text exceeds 2 lines (around 80 characters here)
                  final textWidget = Text(
                    descriptionText,
                    maxLines: isExpanded ? null : 2,
                    overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  );
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget,
                      if (!isExpanded)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = true;
                              });
                            },
                            child: Text('See More'),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),

              // "Features Product" section
              Text(
                'Features Product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // Horizontal scrollable list of products (5 products with image and add button)
              Container(
                height: 180, // Fixed height to ensure all items fit
                child: ListView(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                  children: [
                    // Product 1
                    Column(
                      children: [
                        Image.asset(
                          'assets/product1.png', // Replace with your product image path
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add to Cart action for Product 1
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Space between products

                    // Product 2
                    Column(
                      children: [
                        Image.asset(
                          'assets/product2.png', // Replace with your product image path
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add to Cart action for Product 2
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Space between products

                    // Product 3
                    Column(
                      children: [
                        Image.asset(
                          'assets/product3.png', // Replace with your product image path
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add to Cart action for Product 3
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Space between products

                    // Product 4
                    Column(
                      children: [
                        Image.asset(
                          'assets/product4.png', // Replace with your product image path
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add to Cart action for Product 4
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Space between products

                    // Product 5
                    Column(
                      children: [
                        Image.asset(
                          'assets/product5.png', // Replace with your product image path
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add to Cart action for Product 5
                          },
                          child: Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
