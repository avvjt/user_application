import 'package:flutter/material.dart';
import 'package:user_application/screen/order_sucessful.dart';

void main() {
  runApp(Order());
}

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4, // Adds shadow to give elevation effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0), // Reduced padding inside the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Minimize height of the column
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Details',
                            style: TextStyle(fontSize: 16), // Slightly smaller text
                          ),
                          Icon(Icons.shopping_cart, size: 20), // Smaller icon
                        ],
                      ),
                      SizedBox(height: 8), // Reduced spacing between elements
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(height: 8), // Reduced spacing after the divider
                      
                      // Icon and text row after the divider
                      Row(
                        children: [
                          Icon(Icons.check_circle, size: 20), // Smaller icon
                          SizedBox(width: 6), // Reduced space between icon and text
                          Text(
                            'Order Confirmed',
                            style: TextStyle(fontSize: 14), // Slightly smaller text
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16), // Spacing between the card and the "Order Summary" text
              
              // Text for Order Summary
              Text(
                'Order Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Bold and larger text
              ),
              SizedBox(height: 16), // Spacing before the summary box

              // Single box for order item
              Container(
                margin: EdgeInsets.only(top: 8), // Space above the box
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // First instance of left and right aligned text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Left Aligned Text 1',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Right Aligned Text 1',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Spacing between rows
                    // Second instance of left and right aligned text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Left Aligned Text 2',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Right Aligned Text 2',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Spacing between rows
                    // Third instance of left and right aligned text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Left Aligned Text 3',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Right Aligned Text 3',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Spacing before the divider
                    Divider( // Horizontal border
                      color: Colors.black,
                      thickness: 1,
                    ),
                    SizedBox(height: 8), // Spacing after the divider

                    // Additional instance of left and right aligned text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Left Aligned Text 4',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Right Aligned Text 4',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(), // Pushes the button to the bottom
              // Pay Now Button
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
                  child: Text('Pay Now'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners for button
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

