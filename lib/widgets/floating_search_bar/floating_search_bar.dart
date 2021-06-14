import 'package:flutter/material.dart';

class FloatingSearchBar extends StatefulWidget {
  const FloatingSearchBar({Key? key}) : super(key: key);

  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<FloatingSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffix: Icon(Icons.close_rounded),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.all(10),
            border:
                new OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: 'Search...'));
  }
}
