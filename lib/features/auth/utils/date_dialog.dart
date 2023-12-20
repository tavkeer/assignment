import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDialog extends StatelessWidget {
  final TextEditingController controller;
  const DateDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a date'),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      content: SizedBox(
        height: 300,
        width: 300,
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            selectedDayHighlightColor: Colors.blue,
          ),
          value: [DateTime.now()],
          onValueChanged: (dates) {
            final selectedDate = dates[0] as DateTime;
            final formattedDate =
                DateFormat('dd MMM yyyy').format(selectedDate);
            controller.text = formattedDate;
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
