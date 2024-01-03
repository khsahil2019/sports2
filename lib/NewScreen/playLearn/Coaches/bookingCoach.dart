import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports2/AuthScreen/signUp.dart';
import 'package:sports2/Controller/authCotroller.dart';
import 'package:sports2/helper/theme.dart';

class CoachBookingScreen extends StatefulWidget {
  @override
  _CoachBookingScreenState createState() => _CoachBookingScreenState();
}

class _CoachBookingScreenState extends State<CoachBookingScreen> {
  var data = Get.arguments;
  DateTime? fromDate;
  DateTime? toDate;
  List<String> availableTimeSlots = [];
  List<String> selectedTimeSlots = [];
  double chargesPerHour = 10.0;
  void generateTimeSlots({
    required String startTime,
    required String endTime,
    required int slotDuration,
  }) {
    availableTimeSlots.clear();
    DateTime start = DateTime.parse('2000-01-01 $startTime:00');
    DateTime end = DateTime.parse('2000-01-01 $endTime:00');

    while (start.isBefore(end)) {
      availableTimeSlots.add(
        '${formatTime(start)} - ${formatTime(start.add(Duration(minutes: slotDuration)))}',
      );
      start = start.add(Duration(minutes: slotDuration));
      if (start.hour >= end.hour) break;
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
      lastDate: DateTime.now().add(Duration(days: 60)),
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
          toDate = null; // Reset toDate when selecting a new fromDate
        } else {
          if (picked.isAfter(fromDate!)) {
            toDate = picked;
          } else {
            // Show error/snackbar indicating invalid selection
            // For instance:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('To date must be after from date'),
            ));
          }
        }

        if (fromDate != null && toDate != null) {
          generateTimeSlots(
            startTime: data['time_schedule'].toString(),
            endTime: data['endtime_schedule'].toString(),
            slotDuration: 60,
          );
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
        backgroundColor: AppColors.orange,
        foregroundColor: Colors.white,
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
                child: Text(
                  fromDate != null
                      ? 'From: ${fromDate!.toString().substring(0, 10)}'
                      : 'Select From Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _selectDate(context, false),
                child: Text(
                  toDate != null
                      ? 'To: ${toDate!.toString().substring(0, 10)}'
                      : 'Select To Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                              child: Text(
                                slot,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: selectedTimeSlots.contains(slot)
                                    ? Colors.orange
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
                              label: Text(
                                slot,
                              ),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            //   Map<String, String> scheduleData = {
            //     'time_schedule': "12:20PM",
            //     'endtime_schedule': "1:45AM",
            //   };
            //   print(scheduleData);
            //   Get.to(() => CoachBookingScreen(), arguments: scheduleData);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: Container(
            height: 40,
            // padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                ),
              ],
              color: AppColors.orange,
            ),
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Text(
                  'Pay Total Amount: \Rs ${calculateTotalAmount().toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),

      //   bottomNavigationBar: Container(
      //     // color: Colors.grey[200],
      //     padding: const EdgeInsets.all(16.0),
      //     child: ElevatedButton(
      //       style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all<Color>(
      //           Colors.blue, // Replace with your desired color
      //         ),
      //       ),
      //       onPressed: () {
      //         // Get.to(() => UPIScreen());
      //         //Get.to(() => CodeScreen());
      //         // Get.to(() => StripePayment());
      //       },
      //       child: Text(
      //         'Pay Total Amount: \Rs ${calculateTotalAmount().toStringAsFixed(2)}',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ),
      //   ),
    );
  }
}
