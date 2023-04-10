import 'package:flutter/material.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomCalenderWidget.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomTextWidget.dart';
class BookingDate extends StatelessWidget {
  const BookingDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232F3F),
      appBar: AppBar(
        title: const Text(''),
        leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            }),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF232F3F),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const CustomText('When you will be there?',
                  style: TextStyle(

                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              const SizedBox(height: 10,),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const CalenderSheet(),


              ),

            ],
          ),
        ),
      ),
    );
  }
}
