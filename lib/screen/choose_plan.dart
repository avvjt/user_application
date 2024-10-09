import 'package:flutter/material.dart';
import 'package:user_application/constants/colors.dart';
import 'package:user_application/screen/home.dart';

class ChoosePlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: null, // Removes the title
        elevation: 0, // Optional: removes the shadow under the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the content vertically
          children: [
            const Text(
              'Choose Plan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Centered Row with a single item
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center item horizontally
              children: [
                Container(
                  width: size.width * 0.9, // Set a responsive width (90% of screen width)
                  height: size.height * 0.5, // Set a responsive height (50% of screen height)
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to another page when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Fragment(), // Placeholder for new page
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Unlock Unlimited Recipe Videos with ',
                                  style: TextStyle(
                                    fontSize: size.width * 0.04, // Adjust font size based on width
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Premium',
                                  style: TextStyle(
                                    fontSize: size.width * 0.04, // Adjust font size based on width
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$5',
                                  style: TextStyle(
                                    fontSize: size.width * 0.06, // Adjust font size based on width
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '/month',
                                  style: TextStyle(
                                    fontSize: size.width * 0.04, // Adjust font size based on width
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(3, (index) {
                                  final featureTexts = [
                                    'Unlimited recipe videos access',
                                    'Exclusive offers on Grocery Products',
                                    'Unlimited Discounts',
                                  ];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'lib/assets/green_tick.png',
                                          width: size.width * 0.06, // Adjust width based on screen size
                                          height: size.width * 0.06, // Adjust height based on screen size
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: size.width - 70,
                                            ),
                                            child: Text(
                                              featureTexts[index],
                                              style: TextStyle(fontSize: size.width * 0.035), // Adjust font size based on width
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your button action here
                                      // Navigate to another page when tapped
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Fragment(), // Placeholder for new page
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 20),
                                    ),
                                    child: Text(
                                      'Choose Premium',
                                      style: TextStyle(fontSize: size.width * 0.035), // Adjust font size based on width
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Spacing below the row
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChoosePlan(),
  ));
}
