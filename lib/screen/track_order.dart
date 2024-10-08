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
            'Track Order', // Modified title
            style: TextStyle(
              fontSize: 20, // Custom font size
              fontWeight: FontWeight.bold, // Custom font weight
              color: Colors.black, // Custom text color
            ),
          ),
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back, color: Colors.black), // Back button icon
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
          backgroundColor:
              Colors.transparent, // Modify the app bar color if needed
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Allows scrolling if content overflows
              child: Column(
                children: List.generate(
                    4, (index) => orderItem()), // Generate 4 items
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget orderItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0), // Space between items
      padding: const EdgeInsets.all(16.0),
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
            crossAxisAlignment:
                CrossAxisAlignment.center, // Align center vertically
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column of texts on the left
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 5),
                  Text('Order # 10',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey)),
                  Text('Excepted Delivery : 20 Sep 2024',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey)),
                ],
              ),

              // Button on the right side, vertically centered
              ElevatedButton(
                onPressed: () {
                  // Button press logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.primaryColor, // Button background color
                  foregroundColor: Colors.white, // Text color
                ),
                child: Text('Track Package'),
              ),
            ],
          ),


          // Border line
          Divider(thickness: 1, color: Colors.lightGreen),

          // Text below the border line
          Text('Fuji Apple 2 pieces (300-350 grams)',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),

          // Border line
          Divider(thickness: 1, color: Colors.lightGreen),
          // Additional border and text at the bottom
          Container(
            child: Text(
              '\$ 2',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
