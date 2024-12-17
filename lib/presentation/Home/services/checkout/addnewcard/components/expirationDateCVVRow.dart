import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ExpirationDateCVVRow extends StatefulWidget {
  final TextEditingController expirationDateController;
  final VoidCallback onDateTapped;

  ExpirationDateCVVRow({required this.expirationDateController, required this.onDateTapped});

  @override
  _ExpirationDateCVVRowState createState() => _ExpirationDateCVVRowState();
}

class _ExpirationDateCVVRowState extends State<ExpirationDateCVVRow> {
  late DateTime selectedDate;
  late String expirationDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); // Initialize with today's date
    expirationDate = ''; // Initialize the expiration date
  }

  void _showCustomDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9, // Responsive width
            height: 400,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    Text("Select Date",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: TableCalendar<DateTime>(
                        focusedDay: selectedDate,
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2101),
                        selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            selectedDate = selectedDay;
                          });
                        },
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          leftChevronIcon: Icon(Icons.chevron_left),
                          rightChevronIcon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    Divider(height: 20, thickness: 1, color: Colors.grey),
                  ],
                );
              },
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Go back
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    child: Text('Back'),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      String formattedDate = DateFormat('MM/dd/yyyy').format(selectedDate);
                      setState(() {
                        expirationDate = formattedDate;
                        widget.expirationDateController.text = formattedDate;
                      });
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expires',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.0),
              GestureDetector(
                onTap: () => _showCustomDatePicker(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: widget.expirationDateController,
                    decoration: InputDecoration(
                      hintText: 'MM/YY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CVV',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.0),
              TextField(
                decoration: InputDecoration(
                  hintText: '***',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
