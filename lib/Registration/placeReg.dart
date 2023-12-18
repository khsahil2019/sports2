import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/Services/apiService.dart';
import 'package:sports2/Widgets/textField.dart';

class PlaceHolderRegistration extends StatefulWidget {
  @override
  _PlaceHolderRegistrationState createState() =>
      _PlaceHolderRegistrationState();
}

//var data = Get.arguments;

class _PlaceHolderRegistrationState extends State<PlaceHolderRegistration> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _propertyDescriptionController =
      TextEditingController();
  final TextEditingController _sizeOfPropertyController =
      TextEditingController();
  bool _isTypeOfProperty = false;
  final List<bool> _isTypeOfPropertyList = List.filled(29, false);
  List TypeOfPropertyList = [
    'Field,',
    'Court,',
    'Gym)',
    'Swimming',
  ];
  List selectedTypeOfProperty = [];
  // bool _isFacilities = false;
  // final List<bool> _isFacilitiesList = List.filled(29, false);
  // List FacilitiesList = [
  //   'lighting,',
  //   'equipment,',
  //   'seating)',
  // ];
  // List selectedFacilities = [];
  bool availibilty = false;
  List<String> selectedDays = [];
  final Map<String, bool> _daysAvailability = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  final TextEditingController _activityController = TextEditingController();
  bool _isAmenities = false;
  final List<bool> _isAmenitiesList = List.filled(29, false);
  List AmenitiesList = [
    'washroom for male',
    'washroom for female',
    'changing room',
  ];
  List selectedAmenities = [];
  bool _isSafety = false;
  final List<bool> _isSafetyList = List.filled(29, false);
  List SafetyList = [
    'gated',
    'CCTV',
    'Guard',
    'entry and exit register',
    'secured locker'
  ];
  List selectedSafety = [];
  bool providePickAndDrop = false;
  List<String> providePickAndDropList = [];
  final TextEditingController _chargesController = TextEditingController();

  TimeOfDay _selectedStartTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _selectedEndTime = TimeOfDay(hour: 18, minute: 0);
  File? _imageFile;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Set back button color to white
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Lender"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          // backgroundImage: AssetImage(
                          //     'assets/google.png'), // Replace with your image
                        ),
                        GestureDetector(
                          onTap: () {
                            _getImage();
                            // Handle edit profile photo functionality
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Full Name",
                      hint: "Enter the Name",
                      keyboardType: TextInputType.name,
                      controller: _fullNameController),
                  TextWidget(
                      heading: "Email",
                      hint: "Enter email",
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController),
                  TextWidget(
                      heading: "Address",
                      hint: "Enter Address",
                      keyboardType: TextInputType.text,
                      controller: _addressController),
                  TextWidget(
                      heading: "Contact Number",
                      hint: "Enter contact No",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Property Description",
                      hint: "Enter Property Description",
                      keyboardType: TextInputType.text,
                      controller: _propertyDescriptionController),
                  TextWidget(
                      heading: "Size of the Property (in square meters/feet)",
                      hint: "Enter Property Address",
                      keyboardType: TextInputType.text,
                      controller: _sizeOfPropertyController),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Type of Property",
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTypeOfProperty = !_isTypeOfProperty;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          selectedTypeOfProperty.isEmpty
                                              ? "Type of Property"
                                              : "You are Selected ${selectedTypeOfProperty.length} Type of Property",
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isTypeOfProperty)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: TypeOfPropertyList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(TypeOfPropertyList[index]),
                                value: _isTypeOfPropertyList[index],
                                selected: _isTypeOfPropertyList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedTypeOfProperty.contains(
                                          TypeOfPropertyList[index])) {
                                        selectedTypeOfProperty
                                            .add(TypeOfPropertyList[index]);
                                        log(selectedTypeOfProperty.toString());
                                      }
                                    } else {
                                      if (selectedTypeOfProperty.contains(
                                          TypeOfPropertyList[index])) {
                                        selectedTypeOfProperty
                                            .remove(TypeOfPropertyList[index]);
                                        log(selectedTypeOfProperty.toString());
                                      }
                                    }
                                    _isTypeOfPropertyList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Set your Availability Schedule',
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Switch(
                            value: availibilty,
                            onChanged: (newValue) {
                              setState(() {
                                availibilty = newValue;
                              });
                            },
                          ),
                          Text(availibilty
                              ? 'Now Set your Availability Schedule'
                              : 'Slide to Set your Availability Schedule'),
                        ],
                      ),
                      availibilty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                // Display checkboxes for days
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      _daysAvailability.keys.map((String day) {
                                    return CheckboxListTile(
                                      title: Text(day),
                                      value: _daysAvailability[day],
                                      onChanged: (bool? value) {
                                        bool isChecked = value ?? false;
                                        setState(() {
                                          _daysAvailability[day] = isChecked;
                                        });

                                        if (isChecked) {
                                          setState(() {
                                            selectedDays.add(day);
                                            log(selectedDays.toString());
                                          });
                                        } else {
                                          setState(() {
                                            selectedDays.remove(day);
                                            log(selectedDays.toString());
                                          });
                                        }
                                      },
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 12),
                                // Select start and end timings
                                Row(
                                  children: [
                                    Text('Start Time: '),
                                    TextButton(
                                      onPressed: () async {
                                        TimeOfDay? selectedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: _selectedStartTime,
                                        );
                                        if (selectedTime != null) {
                                          setState(() {
                                            _selectedStartTime = selectedTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                          _selectedStartTime.format(context)),
                                    ),
                                    SizedBox(width: 20),
                                    Text('End Time: '),
                                    TextButton(
                                      onPressed: () async {
                                        TimeOfDay? selectedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime: _selectedEndTime,
                                        );
                                        if (selectedTime != null) {
                                          setState(() {
                                            _selectedEndTime = selectedTime;
                                          });
                                        }
                                      },
                                      child: Text(
                                          _selectedEndTime.format(context)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amenities or Facilities Available",
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAmenities = !_isAmenities;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          selectedAmenities.isEmpty
                                              ? "Select Amenities or Facilities Available"
                                              : "Selected ${selectedAmenities.length} Amenities or Facilities Available",
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isAmenities)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: AmenitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(AmenitiesList[index]),
                                value: _isAmenitiesList[index],
                                selected: _isAmenitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedAmenities
                                          .contains(AmenitiesList[index])) {
                                        selectedAmenities
                                            .add(AmenitiesList[index]);
                                        log(selectedAmenities.toString());
                                      }
                                    } else {
                                      if (selectedAmenities
                                          .contains(AmenitiesList[index])) {
                                        selectedAmenities
                                            .remove(AmenitiesList[index]);
                                        log(selectedAmenities.toString());
                                      }
                                    }
                                    _isAmenitiesList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Safety and security features",
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSafety = !_isSafety;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          selectedSafety.isEmpty
                                              ? "Select Safety and security features"
                                              : "Selected ${selectedSafety.length} Safety and security features",
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: const Icon(
                                              Icons.arrow_drop_down)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_isSafety)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: SafetyList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(SafetyList[index]),
                                value: _isSafetyList[index],
                                selected: _isSafetyList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedSafety
                                          .contains(SafetyList[index])) {
                                        selectedSafety.add(SafetyList[index]);
                                        log(selectedSafety.toString());
                                      }
                                    } else {
                                      if (selectedSafety
                                          .contains(SafetyList[index])) {
                                        selectedSafety
                                            .remove(SafetyList[index]);
                                        log(selectedSafety.toString());
                                      }
                                    }
                                    _isSafetyList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Preferred Sports or Activities Allowed",
                      hint: "Enter Preferred Sports",
                      keyboardType: TextInputType.text,
                      controller: _activityController),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you provide pick and drop facility?',
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Switch(
                            value: providePickAndDrop,
                            onChanged: (newValue) {
                              setState(() {
                                providePickAndDrop = newValue;

                                // Clear the list before adding the latest value
                                providePickAndDropList.clear();

                                // Update the list based on the switch value
                                if (newValue) {
                                  providePickAndDropList.add('Yes');
                                  print(providePickAndDrop
                                      .toString()); // Print 'true' when true
                                } else {
                                  providePickAndDropList.add('No');
                                  print(providePickAndDrop
                                      .toString()); // Print 'false' when false
                                }
                              });
                            },
                          ),
                          Text(providePickAndDrop
                              ? 'Providing Pick and Drop'
                              : 'Not Providing Pick and Drop'),
                        ],
                      ),
                    ],
                  ),
                  TextWidget(
                      heading: "Charges per Hours",
                      hint: "Enter Charges",
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      controller: _chargesController),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          sendPlaceHolderRegDataToServer(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendPlaceHolderRegDataToServer(BuildContext context) {
    // ApiService().RegisterPlaceHolder(
    //     _fullNameController.text,
    //     _emailController.text,
    //     _addressController.text,
    //     _mobileController.text,
    //     _propertyDescriptionController.text,
    //     _sizeOfPropertyController.text,
    //     selectedTypeOfProperty,
    //     selectedDays,
    //     _selectedStartTime.toString(),
    //     _selectedEndTime.toString(),
    //     selectedAmenities,
    //     selectedSafety,
    //     providePickAndDropList,
    //     _chargesController.text);
    // // For demonstration purposes, print the data
    // // print('Name: $name, Number: $number, Email: $email ');

    // // Show a message or navigate after sending data to the server
    // // ScaffoldMessenger.of(context).showSnackBar(
    // //   SnackBar(content: Text('Data sent successfully')),
    // // );
  }
}
