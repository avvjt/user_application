import 'package:flutter/material.dart';

void main() => runApp(DeliveryLocation());

class DeliveryLocation extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TextField for Name
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 10),
              
              // TextField for Phone Number
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),

              // TextField for Street Address
              TextField(
                decoration: InputDecoration(
                  labelText: 'Street Address',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 10),

              // TextField for Landmark
              TextField(
                decoration: InputDecoration(
                  labelText: 'Landmark',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 10),

              // TextField for Pin Code
              TextField(
                decoration: InputDecoration(
                  labelText: 'Pin Code',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // TextField for City
              TextField(
                decoration: InputDecoration(
                  labelText: 'City',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 10),

              // TextField for State
              TextField(
                decoration: InputDecoration(
                  labelText: 'State',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  // Logic to handle the continue action
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
