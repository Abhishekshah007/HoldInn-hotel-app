import 'package:flutter/material.dart';
import 'package:hotel_booking_app/Screens/filteredHotelListScreen.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomRowWidget.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomTextWidget.dart';

class SelectRooms extends StatefulWidget {
  const SelectRooms({super.key});

  @override
  State<SelectRooms> createState() => _SelectRoomsState();
}

class _SelectRoomsState extends State<SelectRooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232F3F),
      appBar: AppBar(
        title: const Text(''),
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop();
        }),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF232F3F),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
// Title text with custom font and size
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: CustomText(
                'Add the number of guests',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
// Container with a gray background and rounded top corners
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFE6E6E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
// Location and dates text with custom font and size
                const Align(
                  child: CustomText(
                    "Riyadh, Riyadh, Saudi Arabia",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Align(
                  child: CustomText(
                    "26 Nov - 27 Nov",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
// Rows with custom widgets for adding number of guests
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: const [
                      MyRowWidget(title: 'Rooms', subTitle: 'Total room'),
                      MyRowWidget(
                          title: 'Adults', subTitle: 'Age 13yr and above'),
                      MyRowWidget(title: 'Children', subTitle: 'Age 2-12yr'),
                      MyRowWidget(title: 'Infants', subTitle: 'Under 2'),
                    ],
                  ),
                ),
// Container for search button
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    child: Column(
                      children: [
// Empty space for visual separation
                        const SizedBox(
                          height: 170,
                        ),
// Search button with custom text and styling
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: const Color(0xFF232F3F),
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            animationDuration: const Duration(seconds: 3),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const FilteredHotel(
                                    rooms: 1,
                                    adults: 3,
                                    children: 2,
                                    infants: 1);
                              },
                            ));
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: CustomText(
                                'Search',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
