import 'package:flutter/material.dart';

void main() => runApp(TrackOrder());

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Track Order')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(  // Allows scrolling if content overflows
              child: Column(
                children: List.generate(4, (index) => orderItem()), // Generate 4 items
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget orderItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0), // Space between items
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row containing texts on the left and button on the right
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Align center vertically
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column of texts on the left
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID: ${12345}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Status: Shipped', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Estimated Delivery: 5th Oct', style: TextStyle(fontSize: 16)),
                ],
              ),
              
              // Button on the right side, vertically centered
              ElevatedButton(
                onPressed: () {
                  // Button press logic here
                },
                child: Text('Track Package'),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Border line
          Divider(thickness: 1, color: Colors.grey),

          // Text below the border line
          Text('Track the progress of your order.', style: TextStyle(fontSize: 16)),
          
          SizedBox(height: 10),

          // Additional border and text at the bottom
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0), // Padding for the new section
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey), // Top border
              ),
            ),
            child: Text('For further assistance, contact support.', 
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
