import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/delivery_location.dart';
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
          title: Text(
            'Payment', // Modified title
            style: TextStyle(
              fontSize: 20, // Modify title size
              fontWeight: FontWeight.bold, // Modify title weight
              color: Colors.black, // Modify title color
            ),
          ),
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back, color: Colors.black), // Back button icon
            onPressed: () {
              Navigator.pop(
                  context); // Action to go back to the previous screen
            },
          ),
          backgroundColor: Colors.white, // Customize the AppBar color
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity, // Set width to match parent
                height: 130, // Set your desired height
                child: Card(
                  elevation: 4, // Adds shadow to give elevation effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        12.0), // Reduced padding inside the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:
                          MainAxisSize.min, // Minimize height of the column
                      children: [
                        // Your Row wrapped in GestureDetector for navigation
                        GestureDetector(
                          onTap: () {
                            // Navigate to another page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DeliveryLocation()), // Replace with your destination page
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Location',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width:
                                    40, // Container size (should be larger than the icon)
                                height: 40, // Height of the container
                                decoration: BoxDecoration(
                                  color: Colors.yellow, // Yellow background
                                  shape: BoxShape.circle, // Circular shape
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'lib/assets/location.png', // Path to your asset icon
                                    width: 20, // Icon width
                                    height: 20, // Icon height
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8), // Reduced spacing between elements
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        SizedBox(
                            height: 8), // Reduced spacing after the divider

                        // Icon and text row after the divider
                        Row(
                          children: [
                            Image.asset(
                              'lib/assets/location_history.png', // Path to your asset icon
                              width: 20, // Set width
                              height: 20, // Set height
                            ),
                            SizedBox(
                                width:
                                    6), // Reduced space between icon and text
                            Text(
                              'Kalyani, west bengal',
                              style: TextStyle(
                                  fontSize: 14), // Slightly smaller text
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                  height:
                      25), // Spacing between the card and the "Order Summary" text

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Left and right margin
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Bold and larger text
                  ),
                ),
              ),

              SizedBox(height: 5), // Spacing before the summary box

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
                          'Sub Total Price',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$ 9.2',
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
                          'Coupon',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'None',
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
                          'Delivery Charges',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$ 10',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // Spacing before the divider
                    Divider(
                      // Horizontal border
                      color: Colors.black,
                      thickness: 1,
                    ),
                    SizedBox(height: 8), // Spacing after the divider

                    // Additional instance of left and right aligned text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          '\$19.2',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    minimumSize: const Size(330, 50),
                    elevation: 5.0,
                  ).copyWith(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
