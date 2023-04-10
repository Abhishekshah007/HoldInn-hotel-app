import 'package:flutter/material.dart';
import 'package:hotel_booking_app/Screens/authenticationScreen.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     title: 'Hotel App',
     home: Scaffold(
       body: AuthPageScreen()
     ),



   );
  }




}