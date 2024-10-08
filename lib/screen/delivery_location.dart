import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/order.dart';

void main() => runApp(DeliveryLocation());

class DeliveryLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Delivery Location', // Modified title
          style: TextStyle(
            fontSize: 20, // Custom font size
            fontWeight: FontWeight.bold, // Custom font weight
            color: Colors.black, // Custom text color
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor:
            Colors.transparent, // Modify the app bar color if needed
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              // TextField for Name
              TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 15),

              // TextField for Phone Number
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2), // Thicker green border when focused
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),

              // TextField for Street Address
              TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Street Address',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 15),

              // TextField for Landmark
              TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Landmark',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 15),

              // TextField for Pin Code
              TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Pin Code',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2), // Thicker green border when focused
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              // TextField for City
              TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 15),

              // TextField for State
              TextField(
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.green), // Green border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2), // Thicker green border when focused
                  ),
                ),
              ),
              SizedBox(height: 50),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  // Add your continue logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Order()), // Replace with your destination page
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18, // Increase text size
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 12), // Increase button size
                  backgroundColor:
                      AppColors.primaryColor, // Change button background color
                  foregroundColor: Colors.white, // Change text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        25), // Optional: Button corner radius
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
