import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search products',
              hintStyle: TextStyle(fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: const Icon(
                EvaIcons.searchOutline,
                color: Color(0xFF818181),
                size: 23,
              ),
              fillColor: Color(0xFFF5F5F5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}