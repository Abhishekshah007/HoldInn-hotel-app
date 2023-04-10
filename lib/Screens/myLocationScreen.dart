import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationDetailsScreen extends StatefulWidget {
  final double latitude; // The latitude of the location
  final double longitude; // The longitude of the location

// Constructor with required parameters
  const LocationDetailsScreen(
      {Key? key, required this.latitude, required this.longitude})
      : super(key: key);

// Creates a state object for this widget
  @override
  _LocationDetailsScreenState createState() => _LocationDetailsScreenState();
}

// A state object that displays the details of a location using latitude and longitude.
class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  String? _city; // The city of the location
  String? _state; // The state of the location
  String? _country; // The country of the location

// Initializes the state of this object
  @override
  void initState() {
    super.initState();
    _getAddressFromLatLng();
  }

// Retrieves the address from the provided latitude and longitude
  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(widget.latitude, widget.longitude);
      if (placemarks.isNotEmpty) {
        Placemark currentPlace = placemarks[0];
        _city = currentPlace
            .locality; // Extracts the city from the retrieved placemark
        _state = currentPlace
            .administrativeArea; // Extracts the state from the retrieved placemark
        _country = currentPlace
            .country; // Extracts the country from the retrieved placemark
      }
    } catch (e) {
      print(e); // Prints any errors to the console
    }
    setState(() {});
  }

  // Builds and returns the widget tree for this object
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latitude: ${widget.latitude}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Longitude: ${widget.longitude}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Text(
              'City: ${_city ?? 'Loading...'}', // Displays the city or 'Loading...' if it hasn't been retrieved yet
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'State: ${_state ?? 'Loading...'}', // Displays the state or 'Loading...' if it hasn't been retrieved yet
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Country: ${_country ?? 'Loading...'}', // Displays the country or 'Loading...' if it hasn't been retrieved yet
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
