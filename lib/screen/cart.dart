import 'package:flutter/material.dart';

void main() => runApp(Cart());

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Product Item List')),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Price:', style: TextStyle(fontWeight: FontWeight.bold)), // Left label
            Text('\$${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)), // Right total price
          ],
        ),
        SizedBox(height: 20), // Space before button
        ElevatedButton(
          onPressed: () {
            // Add your continue logic here
          },
          child: Text('Continue'),
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Product Image
          Image.asset(
            'assets/product_image.png', // Replace with your image asset path
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),

          // Texts vertically
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('Product Description'),
              SizedBox(height: 5),
              Text('\$${widget.productPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)), // Use the passed product price
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
