import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/order.dart';

void main() => runApp(Cart());

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenWidth =
        MediaQuery.of(context).size.width * 0.9; // Decrease width by 10%
    double screenHeight =
        MediaQuery.of(context).size.height * 0.9; // Decrease height by 10%

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              screenHeight * 0.09), // Responsive height for AppBar
          child: AppBar(
            title: Text(
              'My Cart',
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
        body: Padding(
          padding: EdgeInsets.all(
              screenWidth * 0.035), // Adjusted responsive padding for the body
          child: Column(
            children: [
              // Search bar container
              Container(
                margin: EdgeInsets.only(
                    bottom: screenHeight *
                        0.012), // Reduced margin below search bar
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth *
                        0.035), // Responsive padding inside search bar
                // Increase the height of the search bar by 10%
                height: screenHeight *
                    0.055, // Original height was 0.05, now increased by 10%

                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search products',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            fontSize: screenWidth *
                                0.04), // Responsive font size for text input
                      ),
                    ),
                    Icon(Icons.search,
                        size: screenWidth * 0.05), // Responsive icon size
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: ProductItemList(), // Your product list goes here
                ),
              ),

              SizedBox(
                  height:
                      screenHeight * 0.025), // Adjusted space before the button
              Container(
  margin: EdgeInsets.only(bottom: screenHeight * 0.03), // Increased bottom margin by 20%
  child: SizedBox(
    width: screenWidth * 0.45, // Decreased width by 50%
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Order(), // Your order screen
          ),
        );
      },
      child: Text(
        'Continue',
        style: TextStyle(
          fontSize: screenWidth * 0.04, // Responsive button text size
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08,
          vertical: screenHeight * 0.0162, // Decreased height by 10% from 0.018
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // Keep this fixed
        ),
      ),
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

class ProductItemList extends StatefulWidget {
  @override
  _ProductItemListState createState() => _ProductItemListState();
}

class _ProductItemListState extends State<ProductItemList> {
  int totalQuantity = 0;
  double totalPrice = 0.0;

  final double productPrice = 20.00;

  void updateTotals(int quantity) {
    setState(() {
      totalQuantity += quantity;
      totalPrice = totalQuantity * productPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width * 0.9; // Adjusted for 10% decrease

    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          ProductItem(
            updateTotals: updateTotals,
            productPrice: productPrice,
          ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatefulWidget {
  final Function(int) updateTotals;
  final double productPrice;

  ProductItem({required this.updateTotals, required this.productPrice});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    widget.updateTotals(1);
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
      widget.updateTotals(-1);
    }
  }

 @override
Widget build(BuildContext context) {
  double screenWidth =
      MediaQuery.of(context).size.width * 0.9; // Adjusted for 10% decrease
  double screenHeight =
      MediaQuery.of(context).size.height * 0.9; // Adjusted for 10% decrease

  return Container(
    margin: EdgeInsets.symmetric(vertical: screenHeight * 0.012), // Decreased vertical margin by 20%
    padding: EdgeInsets.fromLTRB(
      8, // Left padding
      0, // Top padding
      8, // Right padding
      0, // Bottom padding removed
    ),
    child: Row(
      children: [
        // Product Image
        Image.asset(
          'lib/assets/cart_image.png',
          width: screenWidth * 0.225, // Adjusted width for image
          height: screenWidth * 0.225, // Adjusted height for image
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        // Texts vertically
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Carrot',
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Crisp and hydrating',
              style: TextStyle(
                color: AppColors.yellow,
                fontWeight: FontWeight.normal,
                fontSize: screenWidth * 0.04,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$${widget.productPrice.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        Spacer(),
        // Quantity buttons
        Column(
          children: [
            // Plus Button
            IconButton(
              icon: Icon(Icons.add,
                  size: screenWidth * 0.07), // Responsive icon size
              onPressed: incrementQuantity,
            ),
            // Quantity Display
            Text(
              '$quantity',
              style: TextStyle(
                fontSize: screenWidth * 0.045, // Responsive font size for quantity display
                fontWeight: FontWeight.bold, // Optional: Make the quantity bold
              ),
            ),
            // Minus Button
            IconButton(
              icon: Icon(Icons.remove,
                  size: screenWidth * 0.07), // Responsive icon size
              onPressed: decrementQuantity,
            ),
          ],
        ),
      ],
    ),
  );
}




}
