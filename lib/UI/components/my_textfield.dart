import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    this.obscureText = true,
    required this.hintText,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        cursorColor: Colors.black54,
        obscureText: _obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
              borderRadius: BorderRadius.circular(13)
          ),

          fillColor: Colors.transparent,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[400], fontFamily: 'Poppins', fontSize: 16),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText =! _obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          )
        ),
      ),
    );
  }
}