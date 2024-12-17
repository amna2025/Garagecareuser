import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class ProfileEditDialog extends StatefulWidget {
  @override
  _ProfileEditDialogState createState() => _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  bool _isEditVisible = true;
  String selectedCountryCode = '+92';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return _isEditVisible
        ? BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isEditVisible = false;
          });
        },
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Container(
              // Responsive size for the dialog
              height: screenSize.height < 600 ? screenSize.height * 0.5 : screenSize.height * 0.7,
              width: screenSize.width < 400 ? screenSize.width * 0.9 : screenSize.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05, // Responsive padding
                  vertical: screenSize.height * 0.03,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _isEditVisible = false;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Edit your profile info',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: screenSize.height * 0.05,
                          backgroundImage: AssetImage("assets/images/image.png"),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            // Action for uploading photo
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize.height * 0.07,
                              width: screenSize.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svgs/export1.svg',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      'Upload photo',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 1),
                    Text('Email', style: TextStyle(fontWeight: FontWeight.w500)),
                    _buildTextField(
                      'Email',
                      "assets/svgs/Message.svg",
                      'dummyName0666@gmail.com',
                      TextInputType.emailAddress,
                    ),
                    SizedBox(height: 1),
                    Text('First Name', style: TextStyle(fontWeight: FontWeight.w500)),
                    _buildTextField(
                      'First Name',
                      "assets/svgs/Profile.svg",
                      'dummy',
                      TextInputType.text,
                    ),
                    SizedBox(height: 1),
                    Text('Last Name', style: TextStyle(fontWeight: FontWeight.w500)),
                    _buildTextField(
                      'Last Name',
                      "assets/svgs/Profile.svg",
                      'Name',
                      TextInputType.text,
                    ),
                    SizedBox(height: 1),
                    Text('Phone Number', style: TextStyle(fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        Container(
                          width: screenSize.width * 0.3,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCountryCode,
                            items: <String>[
                              '+92',
                              '+1',
                              '+44',
                              '+91',
                              '+61',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCountryCode = value!;
                              });
                            },
                            underline: SizedBox(),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField(
                            'Phone Number',
                            null,
                            '0300 1234567',
                            TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Center(
                      child: Container(
                        width: screenSize.width * 0.8, // Responsive width for container
                        height: 50, // Fixed height for button container
                        child: ElevatedButton(
                          onPressed: () {
                            // Action on save
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Save', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Container();
  }

  Widget _buildTextField(String label, String? svgAssetPath, String hint,
      [TextInputType keyboardType = TextInputType.text]) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: svgAssetPath != null
              ? Container(
            padding: const EdgeInsets.all(11.0), // Adjust padding as needed
            child: SvgPicture.asset(
              svgAssetPath, // Path to your SVG image
              height: 15,   // Set the height of the SVG image
              width: 15,    // Set the width of the SVG image
              color: Colors.black, // Optional: set color if needed
            ),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
