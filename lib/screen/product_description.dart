import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/cart.dart';

class ProductDescription extends StatefulWidget {
  final int index;

  // Constructor to accept index
  ProductDescription({Key? key, required this.index}) : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Single Image that is attached to the top, left, and right
              Container(
                height: 350, // Adjust height as necessary
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/product_description.png'), // Replace with your image path
                    fit: BoxFit.cover, // Adjust the fit
                  ),
                ),
              ),
              // Container for the yellow background text
              Container(
                height: 40, // Set the height for the container
                width:
                    double.infinity, // Make the container span the full width
                color: Colors.yellow, // Background color
                alignment: Alignment.centerLeft, // Align text to the left
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Add horizontal padding for spacing
                  child: Text(
                    'Fresh Fruits',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    textAlign:
                        TextAlign.start, // Align text to the start (left)
                  ),
                ),
              ),
              SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Adjust horizontal padding as needed
                child: Text(
                  'Fuji Apple',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('2 pieces (300 - 350 g)'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent, // Text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 5), // Button size
                      textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold), // Text size and style
                      elevation: 0, // No shadow
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('3 pieces (350 - 400 g)'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      textStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      elevation: 0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('4 pieces (500 g)'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      textStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      elevation: 0,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Same horizontal padding for price
                child: Text(
                  '\$99.99', // Replace with actual price
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Center the "Add to Cart" button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add to Cart action
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Cart()), // Replace with your actual page
                        );
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    backgroundColor:
                        AppColors.primaryColor, // Button background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust this value to reduce the curve
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // First text: "Description" with padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  String descriptionText =
                      'This is the detailed description of the product. '
                      'It can be very long, and the user can choose to see more if the text is too long to display. '
                      'This description explains everything about the product in detail.';

                  // Check if text exceeds 2 lines (around 80 characters here)
                  final textWidget = Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Add padding here too
                    child: Text(
                      descriptionText,
                      maxLines: isExpanded ? null : 2,
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16, // Modify text size
                        color: Colors.black, // Modify text color
                      ),
                    ),
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
                            child: Text(
                              'See More',
                              style: TextStyle(
                                fontSize: 18, // Modify "See More" text size
                                color: Colors
                                    .black, // Modify "See More" text color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),

              SizedBox(height: 20),

              // "Features Product" section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Features Product',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                height: 200, // Adjusted height to accommodate image and button
                padding: const EdgeInsets.symmetric(
                    horizontal: 16), // Padding for the list
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Enables horizontal scrolling
                  itemCount: 5, // Number of product items
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 20), // Space between products
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                12), // Small curve on the image
                            child: Image.asset(
                              'lib/assets/product_description.png', // Replace with your product image path
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Space between image and button
                          ElevatedButton(
                            onPressed: () {
                              // Add to Cart action
                            },
                            child: Text('Add'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .white, // White background for the button
                              foregroundColor: Colors.black, // Text color
                              side: BorderSide(
                                  color: Colors.yellow,
                                  width: 2), // Yellow border
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Rounded corners for the button
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
