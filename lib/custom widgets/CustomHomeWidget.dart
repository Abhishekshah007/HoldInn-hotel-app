import 'package:flutter/material.dart';
import 'package:hotel_booking_app/Screens/bookingCalenderScreen.dart';
import 'package:hotel_booking_app/Screens/searchScreen.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomSearchBarWidget.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomTextWidget.dart';
import 'package:hotel_booking_app/JsonFilesHandleing/HotelList.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: const CustomSearchBar(value: false),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchTab();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    'Top Deals',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BookingDate();
                    }));
                  },
                  child: const HotelListItem()),
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    'Recent Booking',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 10,
              ),
              const HotelListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
