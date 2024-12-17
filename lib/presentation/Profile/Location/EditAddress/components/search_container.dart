import 'package:flutter/material.dart';


class SearchContainerEdit extends StatelessWidget {
  final Size size;

  const SearchContainerEdit({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: 23,
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.065,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset("assets/images/Search.png"),
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Address',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
