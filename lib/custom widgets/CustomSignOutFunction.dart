import 'package:flutter/material.dart';
import 'package:hotel_booking_app/Screens/authenticationScreen.dart';

import 'CustomTextWidget.dart';

class LogOutAction extends StatelessWidget {
  const LogOutAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AuthPageScreen();
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text('Successfully Logout'),
                      ),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        );
      },
      child: const Center(child: CustomText("Click to Anywhere to Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),
    );
  }
}
