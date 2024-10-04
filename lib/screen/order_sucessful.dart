import 'package:flutter/material.dart';

void main() => runApp(OrderSucessful());

class OrderSucessful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image and Texts')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.asset('lib/assets/done_right.png'), // Use the image from assets
              ),
              SizedBox(height: 20),
              Text('Order Sucessful', style: TextStyle(fontSize: 24)),
              Text('Thank you for your order. Your order will be delivered within 1-2 days ', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
