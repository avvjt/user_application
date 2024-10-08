import 'package:flutter/material.dart';

void main() => runApp(OrderSucessful());

class OrderSucessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                child: Image.asset(
                    'lib/assets/done_right.png'), // Use the image from assets
              ),
              SizedBox(height: 20),
              Text(
                'Order Successful',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Left and right margin
                child: Center(
                  child: Text(
                    'Thank you for your order. Your order will be delivered within 1-2 days.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    textAlign:
                        TextAlign.center, // Ensure the text itself is centered
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
