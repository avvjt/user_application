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
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              // Single Image that is attached to the top, left, and right
              Container(
                height: screenHeight * 0.4, // Make height responsive
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/product_description.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container for the yellow background text
              Container(
                height: screenHeight * 0.05,
                width: screenWidth,
                color: Colors.yellow,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04, // Responsive padding
                  ),
                  child: Text(
                    'Fresh Fruits',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Text(
                  'Fuji Apple',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('2 pieces (300 - 350 g)'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('3 pieces (350 - 400 g)'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('4 pieces (500 g)'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Text(
                  '\$99.99', // Replace with actual price
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Center the "Add to Cart" button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add to Cart action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(),
                      ),
                    );
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.015,
                    ),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // "Description" section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
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

                  final textWidget = Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04),
                    child: Text(
                      descriptionText,
                      maxLines: isExpanded ? null : 2,
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
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
                                fontSize: screenWidth * 0.045,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.02),

              // "Features Product" section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Text(
                  'Features Product',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Container(
                height: screenHeight * 0.25, // Adjusted height for responsiveness
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'lib/assets/product_description.png',
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ElevatedButton(
  onPressed: () {
    // Add to Cart action
  },
  child: Text(
    'Add',
    style: TextStyle(
      fontSize: screenWidth * 0.04, // Responsive text size
    ),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: EdgeInsets.symmetric(
      vertical: screenHeight * 0.015, // Responsive vertical padding
      horizontal: screenWidth * 0.05, // Responsive horizontal padding
    ),
    side: BorderSide(
      color: Colors.yellow,
      width: screenWidth * 0.005, // Responsive border width
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive border radius
    ),
  ),
),

                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
