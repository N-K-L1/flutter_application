import 'package:flutter/material.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  // Initial both dates are October 30, 2025
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  // ---- Show 'From' Date Picker ----
  void showDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: fromDate,
      firstDate: DateTime(1400, 1, 1),
      lastDate: DateTime(3000, 1, 1),
    );

    if (dt != null) {
      setState(() {
        fromDate = dt;

        // If new 'From' date is later than current 'To' date,
        // set 'To' date to be the same as 'From' date
        if (fromDate.isAfter(toDate)) {
          toDate = fromDate;
        }
      });
    }
  }

  // ---- Show 'To' Date Picker ----
  void showDate2() async {
    DateTime? dt2 = await showDatePicker(
      context: context,
      initialDate: toDate,
      firstDate: fromDate,
      lastDate: DateTime(3000, 1, 1),
    );

    if (dt2 != null) {
      setState(() {
        toDate = dt2;
      });
    }
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Demo')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilledButton.icon(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: showDate,
                    label: const Text('From'),
                  ),
                  const SizedBox(width: 15),
                  Text(formatDate(fromDate)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilledButton.icon(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: showDate2,
                    label: const Text('To'),
                  ),
                  const SizedBox(width: 15),
                  Text(formatDate(toDate)),
                ],
              ),
              const SizedBox(height: 20),

              // Display summary
              Text(
                'Selected range: ${formatDate(fromDate)} → ${formatDate(toDate)}',
                style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
