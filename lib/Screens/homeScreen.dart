import 'package:flutter/material.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomHomeWidget.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomSignOutFunction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); // constructor

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // creates a state object of MyHomePage
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // current selected index of BottomNavigationBar
  static const List<Widget> _widgetOptions = <Widget>[
    // list of widgets to be shown in the body
    DefaultWidget(),
    LogOutAction(),
    Text(
      'Booking',
    ),
    Text(
      'Inbox',
    ),
    Text(
      'Share',
    ),
  ];

  void _onItemTapped(int index) {
    // function called when an item of the BottomNavigationBar is tapped
    setState(() {
      _selectedIndex = index; // sets the new selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232F3F),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF232F3F),
        title: Image.asset(
          "lib/assets/logo.png",
          height: 55,
        ),
      ),
      body: Container(
        child: _widgetOptions.elementAt(
            _selectedIndex), // shows the widget selected in the list of widgets based on the selected index
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedIconTheme:
            const IconThemeData(color: Colors.amberAccent, size: 35),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType
            .fixed, // fixes the appearance of BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Logout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
        ],
        currentIndex:
            _selectedIndex, // sets the current index to highlight the selected item in BottomNavigationBar
        onTap:
            _onItemTapped, // calls _onItemTapped function when an item is tapped
      ),
    );
  }
}
