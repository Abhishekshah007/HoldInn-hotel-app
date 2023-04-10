import 'package:flutter/material.dart';

class MyRowWidget extends StatefulWidget {
  final String title;
  final String subTitle;

  const MyRowWidget({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  _MyRowWidgetState createState() => _MyRowWidgetState();
}

class _MyRowWidgetState extends State<MyRowWidget> {
  int _number = 0;

  void _incrementNumber() {
    setState(() {
      _number++;
    });
  }

  void _decrementNumber() {
    if (_number > 0) {
      setState(() {
        _number--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(widget.subTitle, style: const TextStyle(fontSize: 14)),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: _decrementNumber,
              icon: const Icon(Icons.remove_circle_outline_rounded,
                  color: Colors.blueGrey),
            ),
            Text(_number.toString(), style: const TextStyle(fontSize: 16)),
            IconButton(
              onPressed: _incrementNumber,
              icon: const Icon(Icons.add_circle_outline_rounded, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
