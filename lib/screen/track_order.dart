import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';

void main() => runApp(TrackOrder());

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Track Order',
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).size.width * 0.045, // Reduced by 10%
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.04), // Responsive padding
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(4,
                  (index) => orderItem(context)), // Generate 4 responsive items
            ),
          ),
        ),
      ),
    );
  }

  Widget orderItem(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02), // Responsive margin
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row containing texts on the left and button on the right
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column of texts on the left
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: screenWidth * 0.0405, // Reduced by 10%
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01), // Responsive spacing
                    Text(
                      'Order # 10',
                      style: TextStyle(
                        fontSize: screenWidth * 0.036, // Reduced by 10%
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Expected Delivery: 20 Sep 2024',
                      style: TextStyle(
                        fontSize: screenWidth * 0.036, // Reduced by 10%
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // Responsive Button on the right side with padding and margin
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.02), // Space between button and texts
                child: ElevatedButton(
                  onPressed: () {
                    // Button press logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical:
                          screenHeight * 0.015, // Responsive button padding
                      horizontal: screenWidth * 0.04,
                    ),
                    minimumSize: Size(screenWidth * 0.3,
                        screenHeight * 0.05), // Responsive button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded button
                    ),
                  ),
                  child: Text(
                    'Track Package',
                    style: TextStyle(
                        fontSize: screenWidth * 0.036), // Reduced by 10%
                  ),
                ),
              ),
            ],
          ),

          // Divider line
          Divider(thickness: 1, color: Colors.lightGreen),

          // Row for icon and text below the border line
          Row(
            children: [
              Image.asset(
                'lib/assets/track_order.png', // Update with your icon path
                width: MediaQuery.of(context).size.width *
                    0.06, // Responsive width
                height: MediaQuery.of(context).size.width *
                    0.06, // Responsive height
              ),
              SizedBox(width: 8), // Space between icon and text
              Text(
                'Fuji Apple 2 pieces (300-350 grams)',
                style: TextStyle(
                  fontSize: screenWidth * 0.0378, // Responsive font size
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          // Another divider line
          Divider(thickness: 1, color: Colors.lightGreen),

          // Align price text to the left
          Align(
            alignment: Alignment.centerLeft, // Aligns the text to the left
            child: Text(
              '\$ 2',
              style: TextStyle(
                fontSize: screenWidth * 0.0405, // Reduced by 10%
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
