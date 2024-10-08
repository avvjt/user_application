import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/order.dart';

void main() => runApp(Cart());

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart', // Modified title
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProductItemList(),
        ),
      ),
    );
  }
}

class ProductItemList extends StatefulWidget {
  @override
  _ProductItemListState createState() => _ProductItemListState();
}

class _ProductItemListState extends State<ProductItemList> {
  int totalQuantity = 0; // Total quantity of products
  double totalPrice = 0.0; // Total price of products

  // Dummy values for product price
  final double productPrice = 20.00;

  void updateTotals(int quantity) {
    setState(() {
      totalQuantity += quantity;
      totalPrice = totalQuantity * productPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 4; i++) // Create 4 product items
          ProductItem(
            updateTotals: updateTotals,
            productPrice: productPrice, // Pass the product price
          ),
        SizedBox(height: 20), // Space between items and totals
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Left and right margin
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ), // Left label
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ), // Right total price
            ],
          ),
        ),

        SizedBox(height: 50), // Space before button
        ElevatedButton(
          onPressed: () {
            // Add your continue logic here
            // Navigate to another page when tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Order(), // Placeholder for new page
              ),
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
              borderRadius:
                  BorderRadius.circular(25), // Optional: Button corner radius
            ),
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatefulWidget {
  final Function(int) updateTotals;
  final double productPrice; // Add this line to accept productPrice

  ProductItem({required this.updateTotals, required this.productPrice});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 1; // Initial quantity

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    widget.updateTotals(1); // Update total quantity when incrementing
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.updateTotals(-1); // Update total quantity when decrementing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          // Product Image
          Image.asset(
            'lib/assets/cart_image.png', // Replace with your image asset path
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),

          // Texts vertically
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Carrot',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(
                'Crisp and hydrating',
                style: TextStyle(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              SizedBox(height: 5),
              Text('\$${widget.productPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.black)), // Use the passed product price
            ],
          ),
          Spacer(),

          // Quantity buttons
          Column(
            children: [
              // Plus Button
              IconButton(
                icon: Icon(Icons.add),
                onPressed: incrementQuantity,
              ),
              // Quantity Display
              Text('$quantity', style: TextStyle(fontSize: 16)),
              // Minus Button
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: decrementQuantity,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
