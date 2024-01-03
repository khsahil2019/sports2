import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/Controller/authCotroller.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var data = Get.arguments;
  DateTime? fromDate;
  DateTime? toDate;
  List<String> availableTimeSlots = [];
  List<String> selectedTimeSlots = [];
  double chargesPerHour = 10.0; // Sample charge rate per hour

  void generateTimeSlots(
      {required String startTime,
      required String endTime,
      required int slotDuration}) {
    availableTimeSlots.clear();
    DateTime start = DateTime.parse('2000-01-01 $startTime:00');
    DateTime end = DateTime.parse('2000-01-01 $endTime:00');

    while (start.isBefore(end)) {
      availableTimeSlots.add(
          '${formatTime(start)} - ${formatTime(start.add(Duration(minutes: slotDuration)))}');
      start = start.add(Duration(minutes: slotDuration));
    }
  }

  @override
  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      // lastDate: DateTime(DateTime.now().year + 1),
      lastDate: DateTime.now().add(Duration(days: 60)),
    );

    if (picked != null && picked != (isFromDate ? fromDate : toDate)) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
        selectedTimeSlots.clear(); // Clear selected slots when dates change
        if (fromDate != null && toDate != null) {
          generateTimeSlots(
              startTime: data['time_schedule'].toString(),
              endTime: data['endtime_schedule'].toString(),
              slotDuration: 60);
        }
      });
    }
  }

  double calculateTotalAmount() {
    if (fromDate != null && toDate != null) {
      int totalDays = toDate!.difference(fromDate!).inDays + 1;
      int totalMinutes = 0;

      for (String slot in selectedTimeSlots) {
        List<String> times = slot.split(' - ');
        DateTime startTime = DateTime.parse('2000-01-01 ${times[0]}:00');
        DateTime endTime = DateTime.parse('2000-01-01 ${times[1]}:00');
        totalMinutes += endTime.difference(startTime).inMinutes;
      }

      double totalHours = totalMinutes / 60;
      return totalDays * totalHours * chargesPerHour;
    }

    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => _selectDate(context, true),
                child: Text(fromDate != null
                    ? 'From: ${fromDate!.toString().substring(0, 10)}'
                    : 'Select From Date'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _selectDate(context, false),
                child: Text(toDate != null
                    ? 'To: ${toDate!.toString().substring(0, 10)}'
                    : 'Select To Date'),
              ),
              SizedBox(height: 20),
              if (fromDate != null && toDate != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Available Time Slots:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: availableTimeSlots
                          .map(
                            (slot) => ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (selectedTimeSlots.contains(slot)) {
                                    selectedTimeSlots.remove(slot);
                                  } else {
                                    selectedTimeSlots.add(slot);
                                  }
                                });
                              },
                              child: Text(slot),
                              style: ElevatedButton.styleFrom(
                                primary: selectedTimeSlots.contains(slot)
                                    ? Colors.green
                                    : null,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    Text('Selected Time Slots:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: selectedTimeSlots
                          .map(
                            (slot) => Chip(
                              label: Text(slot),
                              onDeleted: () {
                                setState(() {
                                  selectedTimeSlots.remove(slot);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue, // Replace with your desired color
            ),
          ),
          onPressed: () {
            // Get.to(() => UPIScreen());
            //Get.to(() => CodeScreen());
            // Get.to(() => StripePayment());
          },
          child: Text(
            'Pay Total Amount: \Rs ${calculateTotalAmount().toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
