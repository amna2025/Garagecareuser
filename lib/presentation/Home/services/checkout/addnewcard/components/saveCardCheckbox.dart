import 'package:flutter/material.dart';

class SaveCardCheckbox extends StatelessWidget {
  final bool saveCardDetails;
  final ValueChanged<bool?> onChanged;

  SaveCardCheckbox({required this.saveCardDetails, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: saveCardDetails,
          onChanged: onChanged,
        ),
        Text(
          'Save this card for future use',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
