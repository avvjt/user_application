import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/order.dart';

void main() => runApp(DeliveryLocation());

class DeliveryLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Delivery Location',
          style: TextStyle(
            fontSize: screenWidth * 0.05, // Responsive font size
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
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03), // Responsive spacing

              // Responsive TextField for Name
              _buildResponsiveTextField(
                  'Name', screenWidth, screenHeight, AppColors.primaryColor),

              SizedBox(height: screenHeight * 0.02), // Responsive spacing

              // Responsive TextField for Phone Number
              _buildResponsiveTextField('Phone Number', screenWidth,
                  screenHeight, AppColors.primaryColor,
                  keyboardType: TextInputType.phone),

              SizedBox(height: screenHeight * 0.02),

              // Responsive TextField for Street Address
              _buildResponsiveTextField('Street Address', screenWidth,
                  screenHeight, AppColors.primaryColor),

              SizedBox(height: screenHeight * 0.02),

              // Responsive TextField for Landmark
              _buildResponsiveTextField('Landmark', screenWidth, screenHeight,
                  AppColors.primaryColor),

              SizedBox(height: screenHeight * 0.02),

              // Responsive TextField for Pin Code
              _buildResponsiveTextField(
                  'Pin Code', screenWidth, screenHeight, AppColors.primaryColor,
                  keyboardType: TextInputType.number),

              SizedBox(height: screenHeight * 0.02),

              // Responsive TextField for City
              _buildResponsiveTextField(
                  'City', screenWidth, screenHeight, AppColors.primaryColor),

              SizedBox(height: screenHeight * 0.02),

              // Responsive TextField for State
              _buildResponsiveTextField(
                  'State', screenWidth, screenHeight, AppColors.primaryColor),

              SizedBox(
                  height: screenHeight * 0.06), // Larger spacing for button

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Order()),
                  );
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: screenWidth * 0.0405, // Reduced text size by 10%
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth * 0.18, // Reduced button width by 10%
                    vertical:
                        screenHeight * 0.0135, // Reduced button height by 10%
                  ),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        22.5), // Slightly reduced border radius
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create responsive text fields with dynamic content padding
  Widget _buildResponsiveTextField(
      String label, double screenWidth, double screenHeight, Color primaryColor,
      {TextInputType keyboardType = TextInputType.text}) {
    return SizedBox(
      height: screenHeight * 0.07, // Responsive height for text field
      child: TextField(
        keyboardType: keyboardType,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.04, // Responsive label size
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015, // Responsive vertical padding
            horizontal: screenWidth * 0.04, // Responsive horizontal padding
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
