import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BrandsSelectionSection extends StatelessWidget {
  final bool isSearchVisible;
  final String searchText;
  final Function(String) onSearchTextChanged;
  final List<Map<String, String>> filteredBrands;
  final VoidCallback onSearchToggle;

  const BrandsSelectionSection({
    required this.isSearchVisible,
    required this.searchText,
    required this.onSearchTextChanged,
    required this.filteredBrands,
    required this.onSearchToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onSearchToggle,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  height: 40,
                  width: 42,
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/car2.png"),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Select Brands',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          if (isSearchVisible) ...[
            Divider(color: Colors.grey, thickness: 1, height: 16),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/Search.png"),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: onSearchTextChanged,
                      decoration: InputDecoration(
                        hintText: "Select Brands",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset("assets/svgs/Arrow - Down 2.svg"),
                    onPressed: () {
                      onSearchTextChanged('');
                      onSearchToggle();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            if (filteredBrands.isNotEmpty) ...[
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredBrands.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            filteredBrands[index]['image']!,
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 4),
                          Text(
                            filteredBrands[index]['name']!,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ] else if (searchText.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("No brands found.", style: TextStyle(fontSize: 16)),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
