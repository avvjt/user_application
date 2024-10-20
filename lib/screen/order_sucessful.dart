import 'package:flutter/material.dart';

void main() => runApp(OrderSuccessful());

class OrderSuccessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              screenHeight * 0.09), // Responsive height for AppBar
          child: AppBar(
            title: Text(
              'Order Successful',
              style: TextStyle(
                fontSize:
                    screenWidth * 0.045, // Responsive font size for the title
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.black,
                  size: screenWidth * 0.06), // Responsive icon size
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove shadow
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.5, // Responsive width
                height: screenHeight * 0.3, // Responsive height
                child: Image.asset(
                  'lib/assets/done_right.png',
                  fit: BoxFit.contain, // Maintain aspect ratio
                ),
              ),
              SizedBox(height: screenHeight * 0.025), // Responsive spacing
              Text(
                'Order Successful',
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.015), // Responsive spacing
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.05), // Responsive horizontal padding
                child: Center(
                  child: Text(
                    'Thank you for your order. Your order will be delivered within 1-2 days.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center, // Centered text
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
