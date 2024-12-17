import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon; // Widget type for prefixIcon to accept both Icon and SvgPicture
  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Color textColor;
  final Color hintColor;
  final Color iconColor;
  final Color cursorColor;
  final bool obscureText;
  final VoidCallback? onTap; // Optional onTap parameter
  final Function(String)? onChanged; // New onChanged parameter
  final bool hasError; // Parameter to indicate error state

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderRadius = 10.0,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.iconColor = Colors.black,
    this.cursorColor = Colors.blue,
    this.obscureText = false,
    this.onTap, // Include the onTap parameter in the constructor
    this.onChanged, // Include the onChanged parameter
    this.hasError = false, // Default value for hasError
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    Color effectiveBorderColor = widget.hasError ? Colors.red : widget.borderColor;

    return SizedBox(
      width: 389, // You can adjust this based on screen size for better responsiveness
      height: 52,
      child: GestureDetector(
        onTap: widget.onTap,
        child: TextFormField(
          controller: widget.controller,
          obscureText: _isObscured,
          cursorColor: widget.cursorColor,
          style: TextStyle(color: widget.textColor),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.hintColor),
            filled: true,
            fillColor: widget.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: effectiveBorderColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: effectiveBorderColor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(color: effectiveBorderColor, width: 2.0),
            ),
            prefixIcon: widget.prefixIcon is String // Check if the prefixIcon is a String (SVG asset path)
                ? Container(
              width: 24.0, // Set width for the SVG icon
              height: 24.0, // Set height for the SVG icon
              child: SvgPicture.asset(
                widget.prefixIcon as String,
                fit: BoxFit.contain, // Make sure the SVG fits the container
              ),
            )
                : widget.prefixIcon, // Use widget.prefixIcon directly if it's a widget
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: Colors.grey, // Change icon color to black
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            )
                : null,
          ),
          onChanged: widget.onChanged, // Set onChanged callback
        ),
      ),
    );
  }
}
