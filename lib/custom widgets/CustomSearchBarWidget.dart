import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final bool value;

  const CustomSearchBar({Key? key, this.value = true}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xffE6E6E6),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search_sharp, size: 40, color: Colors.orange),
          ),
          Expanded(
            child: TextField(
              enabled: widget.value,
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search by city,landmark,or hotel',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
