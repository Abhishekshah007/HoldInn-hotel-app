import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hotel_booking_app/Screens/filteredHotelListScreen.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomSearchBarWidget.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomTextWidget.dart';

import 'myLocationScreen.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  Position? _currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText('Search',
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
// The custom search bar widget.
              const CustomSearchBar(),
              const SizedBox(
                height: 20,
              ),
// A row containing an icon and text to search for properties near the user's current location.
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationDetailsScreen(
                        latitude: _currentPosition?.latitude ?? 0.0,
                        longitude: _currentPosition?.longitude ?? 0.0,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.location_searching_outlined, size: 26),
                    CustomText(
                      ' Property Near Me',
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(color: Colors.grey, height: 10, thickness: 0.5),
              const SizedBox(
                height: 5,
              ),
// A list tile to filter by a specific location.
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const FilteredHotel();
                    },
                  ));
                },
                child: const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Ahmedabad'),
                ),
              ),
              const Divider(color: Colors.grey, height: 5, thickness: 0.5),
// A commented-out list tile and button to get the user's current location.
// These are not currently being used, but could be implemented in the future.
// const ListTile(
// leading: Icon(Icons.location_on),
// title: Text('Maharashtra'),
// ),
//
// const Divider(color: Colors.grey,height: 5,thickness: 0.5),
//
// const ListTile(
// leading: Icon(Icons.location_on),
// title: Text('Chhattisgarh'),
// ),
// const Divider(color: Colors.grey,height: 5,thickness: 0.5),
//
// ElevatedButton(
// child: const Text('Get Location'),
// onPressed: () async {
// final position = await Geolocator.getCurrentPosition(
// desiredAccuracy: LocationAccuracy.high,
// );
// setState(() {
// _currentPosition = position;
// });
// },
// ),
// if (_currentPosition != null)
// Text(
// 'Lat: ${_currentPosition!.latitude}, Long: ${_currentPosition!.longitude}'),
            ],
          ),
        ),
      ),
    );
  }
}
