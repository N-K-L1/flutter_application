import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({super.key});

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String date = '';
  String time = '';
  String status = '';

  // ---- Show Date Picker ----
  void showDate() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 10, 1),
      lastDate: DateTime(DateTime.now().year, 10, 31),
    );

    if (dt != null) {
      setState(() {
        date = '${dt.day}-${dt.month}-${dt.year}';
      });
    }
  }

  // ---- Show Time Picker ----
  void showTime() async {
    TimeOfDay? td = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (td != null) {
      setState(() {
        // Format time with leading zeros if needed
        String hour = td.hour.toString().padLeft(2, '0');
        String minute = td.minute.toString().padLeft(2, '0');
        time = '$hour : $minute';
      });
    }
  }

  // ---- Show Alert Dialog ----
  void showAlert() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Warning',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/564/564619.png',
                width: 80,
              ),
              const SizedBox(height: 10),
              const Text('All files will be deleted!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  status = '✅ All files deleted';
                  date = '';
                  time = '';
                });
              },
              child: const Text('OK', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  status = '❌ Cancelled';
                });
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Date Picker
              FilledButton(
                onPressed: showDate,
                child: const Text('Select Date'),
              ),
              Text(
                date.isEmpty ? 'No date selected' : date,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              // Time Picker
              FilledButton(
                onPressed: showTime,
                child: const Text('Select Time'),
              ),
              Text(
                time.isEmpty ? 'No time selected' : time,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              // Alert Dialog
              FilledButton(
                onPressed: showAlert,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
                child: const Text('Delete'),
              ),
              const SizedBox(height: 20),

              // Status Message
              Text(
                status,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
