import 'dart:convert'; // import JSON decoder library
import 'package:flutter/cupertino.dart'; // import Cupertino style widgets
import 'package:flutter/material.dart'; // import Material style widgets
import 'package:flutter/services.dart'; // import platform services
import '../JsonFilesHandleing/HotelList.dart'; // import custom HotelList data model

class FilteredHotel extends StatefulWidget {
  const FilteredHotel({
    Key? key,
    this.rooms = 1, // default value for rooms
    this.adults = 1, // default value for adults
    this.children = 0, // default value for children
    this.infants = 0, // default value for infants
  }) : super(key: key);

  final int rooms;
  final int adults;
  final int children;
  final int infants;

  int get totalGuests =>
      adults + children + infants; // calculate total number of guests

  @override
  _FilteredHotelState createState() => _FilteredHotelState();
}

class _FilteredHotelState extends State<FilteredHotel> {
  int _selectedIndex = 0; // current selected bottom navigation bar item index

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Sort',
    ), // first bottom navigation bar item
    Text(
      'Filter',
    ), // second bottom navigation bar item
    Text(
      'Map',
    ), // third bottom navigation bar item
  ];

  void _onItemTapped(int index) {
    // handle bottom navigation bar item tap
    setState(() {
      _selectedIndex = index;
    });
  }

  List<HotelFields> _list = []; // list of HotelFields objects

  @override
  void initState() {
    super.initState();
    readJson(); // load JSON data
  }

  // Read the JSON file and decode it
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(
        'lib/assets/files/hotelList.json'); // load JSON file from assets folder
    final data = await json.decode(response); // decode JSON data

    // Map the decoded data to a list of HotelFields objects
    List<HotelFields> hotels =
        (data['hotels'] as List).map((e) => HotelFields.fromJson(e)).toList();

    setState(() {
      _list = hotels; // update the list of hotels with the decoded data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF232F3F), // set app bar background color
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop(); // go back to previous screen
        }),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Riyadh, Riyadh, Saudi Arabia',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text('26 Nov - 27 Nov  ',
                        style: TextStyle(fontSize: 14)),
                    const Icon(Icons.account_circle_outlined),
                    Text(' ${widget.totalGuests.toString()} '),
                    const Icon(Icons.key_outlined),
                    Text(' ${widget.rooms.toString()} '),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20), // adds horizontal and vertical padding to the widget
        child: ListView.builder(
          itemCount: _list.length, // number of items in the list
          itemBuilder: (BuildContext context, int index) {
            // builds each item of the list
            final hotel = _list[index]; // gets the hotel at the current index
            return SizedBox(
              // wraps the hotel card in a SizedBox for spacing
              child: Stack(
                children: [
                  Card(
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(5)), // gives the card rounded edges
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          hotel.image, // displays the hotel image
                          fit: BoxFit
                              .fill, // scales the image to fill the available space
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical:
                                    20), // adds horizontal and vertical padding to the widget
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                    height: 8), // adds vertical spacing
                                Text(
                                  hotel.name, // displays the hotel name
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight
                                          .bold), // sets the text style
                                ),
                                const SizedBox(
                                    height: 8), // adds vertical spacing
                                Text(
                                  hotel.location, // displays the hotel location
                                  style: const TextStyle(
                                      fontSize: 14), // sets the text style
                                ),
                                const SizedBox(
                                    height: 8), // adds vertical spacing
                                Text(
                                  '1 night Stay: SR ${hotel.price}', // displays the hotel price
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ), // sets the text style
                                ),
                                const SizedBox(
                                    height: 8), // adds vertical spacing
                                const Text(
                                  '+ SR 19.84 taxes and charges',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey, // sets the text color
                                    fontWeight:
                                        FontWeight.w600, // sets the text weight
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    // positions the favorite icon on the top right corner of the card
                    top: 20,
                    left: 320,
                    child: Container(
                      padding: const EdgeInsets.all(
                          4), // adds padding to the container
                      decoration: BoxDecoration(
                        color:
                            null, // sets the background color of the container
                        borderRadius: BorderRadius.circular(
                            5), // gives the container rounded edges
                      ),
                      child: Row(
                        children: const [
                          Icon(CupertinoIcons.heart, // displays a heart icon
                              color: Colors.white, // sets the icon color
                              size: 32), // sets the icon size
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        selectedIconTheme:
            const IconThemeData(color: Colors.amberAccent, size: 30),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sort_by_alpha_sharp),
            label: 'Sort',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1_sharp),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
