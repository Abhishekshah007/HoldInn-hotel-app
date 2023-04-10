import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/Screens/homeScreen.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomAppbarWidget.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomTextWidget.dart';

import '../JsonFilesHandleing/PhoneCode.dart';

class AuthPageScreen extends StatefulWidget {
  const AuthPageScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthPageScreenState();
  }
}

class _AuthPageScreenState extends State<AuthPageScreen> {
  // Use a TextEditingController to capture user input
  final TextEditingController _controller = TextEditingController();

  // Use a boolean variable to track whether the "Show more options" button is tapped
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a custom app bar widget
        appBar: const MyAppBar(title: "Login and Signup"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Use an image widget to display an image
                Image.asset(
                  "lib/assets/miniIcon.png",
                  width: 100,
                  height: 100.0,
                ),
                const SizedBox(height: 10),
                const CustomText(
                  'Welcome to HoldInn',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                const PhoneCodeDropDown(hintText: "Country/region"),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Align(
                            alignment: Alignment.centerRight,
                            // Use a custom text widget to style text
                            child: CustomText("Forgot Password?",
                                style: TextStyle(color: Colors.blueAccent))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isTapped =
                            !isTapped; // Update the boolean variable to its opposite value
                          });
                        },
                        child: isTapped
                            ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.email_outlined),
                                SizedBox(width: 16),
                                Icon(Icons.facebook_outlined),
                              ],
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isTapped = false;
                                });
                              },
                              child: const CustomText(
                                "Less options",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        )
                            : const CustomText(
                          "Show more options",
                          style: TextStyle(
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
