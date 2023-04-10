import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking_app/custom%20widgets/CustomTextWidget.dart';

class HotelFields {
  late final String name;
  late final String image;
  late final String location;
  late final String price;

  HotelFields({
    required this.name,
    required this.image,
    required this.location,
    required this.price,
  });

  factory HotelFields.fromJson(Map<String, dynamic> json) {
    return HotelFields(
      name: json['name'],
      image: json['image'],
      location: json['location'],
      price: json['price'],
    );
  }
}

class HotelListItem extends StatefulWidget {
  const HotelListItem({Key? key}) : super(key: key);

  @override
  _HotelListItemState createState() => _HotelListItemState();
}

class _HotelListItemState extends State<HotelListItem> {
  List<HotelFields> _list = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/assets/files/hotelList.json');
    final data = await json.decode(response);
    List<HotelFields> hotels =
        (data['hotels'] as List).map((e) => HotelFields.fromJson(e)).toList();

    setState(() {
      _list = hotels;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            final hotel = _list[index];

            return SizedBox(
              width: 250, // set a fixed width for the card
              child: Stack(
                children: [
                  Card(
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: const Color(0xffE6E6E6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            hotel.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(hotel.name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CustomText(
                              'SR ${hotel.price}',
                              style: const TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.access_time_outlined,
                              color: Colors.greenAccent, size: 15),
                          CustomText(
                            ' Start in 02:02:53',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
    );
  }
}
