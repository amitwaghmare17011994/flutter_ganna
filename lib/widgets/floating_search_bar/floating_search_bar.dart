import 'package:flutter/material.dart';

class FloatingSearchBar extends StatefulWidget {
  final ValueSetter onSearchSubmited;

  const FloatingSearchBar({Key? key, required this.onSearchSubmited})
      : super(key: key);

  @override
  _FloatingSearchBarState createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<FloatingSearchBar> {
  var searchTextController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
          controller: searchTextController,
          onSubmitted: widget.onSearchSubmited,
          onChanged: widget.onSearchSubmited,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffix: GestureDetector(
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.redAccent,
                ),
                onTap: () {
                  widget.onSearchSubmited('');
                  searchTextController.text = '';
                },
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.all(10),
              border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)),
              hintText: 'Search...')),
    );
  }
}
