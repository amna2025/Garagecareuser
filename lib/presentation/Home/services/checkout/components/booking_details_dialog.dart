import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/presentation/Home/services/bookinginfo/bookinginfoScreen.dart';

class BookingDetailsDialog extends StatefulWidget {
  final TextEditingController hourController;
  final TextEditingController minuteController;

  BookingDetailsDialog({
    required this.hourController,
    required this.minuteController,
  });

  @override
  _BookingDetailsDialogState createState() => _BookingDetailsDialogState();
}

class _BookingDetailsDialogState extends State<BookingDetailsDialog> {
  String selectedPeriod = 'AM';

  void togglePeriod(String period) {
    setState(() {
      selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = MediaQuery.of(context).size.width;
            double dialogWidth = screenWidth * 0.9; // Reduced width for better alignment
            double dialogHeight = constraints.maxHeight * 0.7;

            return Stack(
              alignment: Alignment.center,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Center(
                    child: Container(
                      width: dialogWidth,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildHeader(context),
                            Divider(),
                            _buildTimeSelector(context, dialogWidth, dialogHeight),
                            const SizedBox(height: 10),
                            _buildActionButtons(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Project created',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildTimeSelector(BuildContext context, double dialogWidth, double dialogHeight) {
    return SingleChildScrollView(
      child: Container(
        width: dialogWidth,
        height: dialogHeight * 0.4,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter Time',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildTimeInputField(
                        context,
                        controller: widget.hourController,
                        label: 'Hour',
                        color: Colors.white,
                        textColor: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      const Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey)),
                      const SizedBox(width: 8),
                      _buildTimeInputField(
                        context,
                        controller: widget.minuteController,
                        label: 'Minute',
                        color: Colors.white,
                        textColor: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildPeriodSelection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeInputField(BuildContext context,
      {required TextEditingController controller, required String label, required Color color, required Color textColor}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '00',
                  hintStyle: TextStyle(color: textColor),
                ),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
          Text(label, style: const TextStyle(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPeriodSelection(BuildContext context) {
    return Container(
      height: 60,
      width: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildPeriodButton(context, label: 'AM', isSelected: selectedPeriod == 'AM', onPressed: () => togglePeriod('AM')),
            _buildPeriodButton(context, label: 'PM', isSelected: selectedPeriod == 'PM', onPressed: () => togglePeriod('PM')),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodButton(BuildContext context,
      {required String label, required bool isSelected, required VoidCallback onPressed}) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainColor : Colors.transparent,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildActionButton(
          context,
          label: 'Confirm',
          backgroundColor: AppColors.mainColor,
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BookingInfoPage()));
          },
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          context,
          label: 'Back',
          backgroundColor: Colors.white,
          borderColor: Colors.grey,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required String label, required Color backgroundColor, Color? borderColor, required VoidCallback onPressed}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: borderColor != null ? BorderSide(color: borderColor, width: 1) : BorderSide.none,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
