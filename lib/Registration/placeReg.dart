import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/Widgets/textField.dart';
import 'package:sports2/helper/theme.dart';

class PlaceHolderRegistration extends StatefulWidget {
  @override
  _PlaceHolderRegistrationState createState() =>
      _PlaceHolderRegistrationState();
}

//var data = Get.arguments;

class _PlaceHolderRegistrationState extends State<PlaceHolderRegistration> {
  final TextEditingController _nameFacilityController = TextEditingController();
  final TextEditingController _spaceController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  bool availibilty = false;
  final Map<String, bool> _daysAvailability = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };
  List<String> selectedDays = [];
  TimeOfDay _selectedStartTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _selectedEndTime = const TimeOfDay(hour: 18, minute: 0);
  final TextEditingController _disRailwayController = TextEditingController();
  final TextEditingController _disCityController = TextEditingController();
  final TextEditingController _disAirportController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _mobile1Controller = TextEditingController();
  final TextEditingController _mobile2Controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _email1Controller = TextEditingController();
  final TextEditingController _email2Controller = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _whatsapp1Controller = TextEditingController();
  final TextEditingController _whatsapp2Controller = TextEditingController();
  final TextEditingController _contact1Controller = TextEditingController();
  final TextEditingController _contact2Controller = TextEditingController();
  final TextEditingController _designation1Controller = TextEditingController();
  final TextEditingController _designation2Controller = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  bool _isTypeOfProperty = false;
  final List<bool> _isTypeOfPropertyList = List.filled(29, false);
  List typeOfPropertyList = [
    'Indoor',
    'Outdoor',
    'Only day facility',
    'Only night facility',
    'Both indoor and outdoor',
    'Both night and day',
  ];
  List selectedTypeOfProperty = [];
  bool indoorCapacity = false;
  bool outdoorCapacity = false;
  final TextEditingController _indoorController = TextEditingController();
  final TextEditingController _outdoorController = TextEditingController();
  bool _isActivities = false;
  final List<bool> _isActivitiesList = List.filled(29, false);
  List activitiesList = [
    'Annual function',
    'Wedding',
    'Social engagement',
    'Social function',
    'Community activities',
  ];
  List selectedActivities = [];
  bool _isSecurityMeasure = false;
  final List<bool> _isSecurityMeasureList = List.filled(29, false);
  List securityMeasureList = [
    'Security guards',
    'CCTV Surveillance',
    'Metal Detector',
    'Assisted Entry',
    'Assisted Exit',
    'Fire Extinguishers',
    'Smoke Alrams',
    'Emergency response system',
    'Crowd Management',
    'Ambulance',
    'Nurse',
    'Doctor',
    'First Aid',
    'CPR',
    'Sick room',
    'Police assistance',
  ];
  List selectSecurityMeasure = [];
  bool isAttendeeFacilities = false;
  List<bool> isAttendeeFacilitiesList = List.filled(29, false);
  List selectedAttendeeFacilities = [];
  List attendeeFacilitiesList = [
    'Clean washroom',
    'Soap in the washrooms',
    'Parking',
    'Locker',
    'Charging Points',
    'RO water',
  ];
  bool isParticipantFacilities = false;
  List<bool> isParticipantFacilitiesList = List.filled(29, false);
  List selectedParticipantFacilities = [];
  List participantFacilitiesList = [
    'Change room',
    'Locker',
    'Clean washrooms',
    'Towel',
    'Kit',
    'Soap',
    'Shampoo',
    'ShampooBed with mattress',
    'AC',
    'Cooler',
    'Fan',
    'Charging point',
    'Proper lighting',
    'Parking',
    'Gym',
    'Ro water',
  ];
  final List<String> _chargesList = [
    'Charges per hours (in Rupees)',
    'Charges per game/event (in Rupees)',
    'Charges per day (in Rupees)',
    'Charges per person (in Rupees)'
  ];
  String? _selectedCharges;
  final TextEditingController _chargesController = TextEditingController();
  /***************************************************************/

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
            color: AppColors.orange, // Set back button color to white
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Playground Registration",
          style: TextStyle(color: AppColors.orange),
        ),
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
                    child: _imageFile != null
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            backgroundImage: FileImage(_imageFile!),
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 60,
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ),
                            // You can add a placeholder image or text here when no image is selected
                          ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 130,
                    child: GestureDetector(
                      onTap: () {
                        _getImage();
                        // Handle edit profile photo functionality
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 200, 243, 239),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
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
                      heading: "Name of the facility/ground/gaming",
                      hint: "Enter the Facility",
                      keyboardType: TextInputType.name,
                      controller: _nameFacilityController),
                  TextWidget(
                      heading: "Space",
                      hint: "Enter email",
                      keyboardType: TextInputType.emailAddress,
                      controller: _spaceController),
                  TextWidget(
                      heading: "Address 1",
                      hint: "Enter Address 1",
                      keyboardType: TextInputType.text,
                      controller: _address1Controller),
                  TextWidget(
                      heading: "Address 2",
                      hint: "Enter Address 2",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _address2Controller),
                  TextWidget(
                      heading: "City",
                      hint: "Enter Property Description",
                      keyboardType: TextInputType.text,
                      controller: _cityController),
                  TextWidget(
                      heading: "Pincode",
                      hint: "Enter Property Address",
                      keyboardType: TextInputType.text,
                      controller: _pincodeController),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Set your Availability Schedule',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Switch(
                            activeColor: AppColors.orange,
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
                                const SizedBox(height: 12),
                                // Select start and end timings
                                Row(
                                  children: [
                                    const Text('Start Time: '),
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
                                    const SizedBox(width: 20),
                                    const Text('End Time: '),
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
                  TextWidget(
                      heading: "Distance from Main railway station (KM)",
                      hint: "Ex - 12",
                      keyboardType: TextInputType.text,
                      controller: _disRailwayController),
                  TextWidget(
                      heading: "Distance from city center (KM)",
                      hint: "Ex - 23",
                      keyboardType: TextInputType.text,
                      controller: _disCityController),
                  TextWidget(
                      heading: "Distance from Airport (KM)",
                      hint: "Ex - 20",
                      keyboardType: TextInputType.text,
                      controller: _disAirportController),
                  TextWidget(
                      heading: "Mobile Number",
                      hint: "Enter Mobile Number",
                      keyboardType: TextInputType.text,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Email ID",
                      hint: "Enter Email ID",
                      keyboardType: TextInputType.text,
                      controller: _emailController),
                  TextWidget(
                      heading: "Whatsapp Number",
                      hint: "Enter Whatsapp Number",
                      keyboardType: TextInputType.text,
                      controller: _whatsappController),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Contact Person 1 Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Contact person 1",
                      hint: "Enter Contact person 1",
                      keyboardType: TextInputType.text,
                      controller: _contact1Controller),
                  TextWidget(
                      heading: "Designation",
                      hint: "Enter Designation",
                      keyboardType: TextInputType.text,
                      controller: _designation1Controller),
                  TextWidget(
                      heading: "Mobile Number",
                      hint: "Enter Mobile Number",
                      keyboardType: TextInputType.text,
                      controller: _mobile1Controller),
                  TextWidget(
                      heading: "Whatsapp Number",
                      hint: "Enter Whatsapp Number",
                      keyboardType: TextInputType.text,
                      controller: _whatsapp1Controller),
                  TextWidget(
                      heading: "Email ID",
                      hint: "Enter Email ID",
                      keyboardType: TextInputType.text,
                      controller: _email1Controller),
                  const Text(
                    "Contact Person 2 Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Contact person 2",
                      hint: "Enter Contact Person 2",
                      keyboardType: TextInputType.text,
                      controller: _contact2Controller),
                  TextWidget(
                      heading: "Designation",
                      hint: "Enter Designation",
                      keyboardType: TextInputType.text,
                      controller: _designation2Controller),
                  TextWidget(
                      heading: "Mobile Number",
                      hint: "Enter Mobile Number",
                      keyboardType: TextInputType.text,
                      controller: _mobile2Controller),
                  TextWidget(
                      heading: "Whatsapp Number",
                      hint: "Enter Whatsapp Number",
                      keyboardType: TextInputType.text,
                      controller: _whatsapp2Controller),
                  TextWidget(
                      heading: "Email ID",
                      hint: "Enter Email ID",
                      keyboardType: TextInputType.text,
                      controller: _email2Controller),
                  TextWidget(
                      heading: "Enter Area (Approximate in sq feet)",
                      hint: "Enter Area",
                      keyboardType: TextInputType.text,
                      controller: _areaController),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Type of Property",
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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
                            itemCount: typeOfPropertyList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(typeOfPropertyList[index]),
                                value: _isTypeOfPropertyList[index],
                                selected: _isTypeOfPropertyList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedTypeOfProperty.contains(
                                          typeOfPropertyList[index])) {
                                        selectedTypeOfProperty
                                            .add(typeOfPropertyList[index]);
                                        log(selectedTypeOfProperty.toString());
                                      }
                                    } else {
                                      if (selectedTypeOfProperty.contains(
                                          typeOfPropertyList[index])) {
                                        selectedTypeOfProperty
                                            .remove(typeOfPropertyList[index]);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Indoor Capacity',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8.0),
                      Checkbox(
                        value: indoorCapacity,
                        onChanged: (bool? value) {
                          setState(() {
                            indoorCapacity = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  if (indoorCapacity)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white, // Top color
                            Colors.grey.shade200, // Bottom color
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3), // Shadow position
                          ),
                        ], // Outer border color
                      ),
                      child: TextFormField(
                        controller: _indoorController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: const InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: "Enter the Indoor Capacity",
                          border: InputBorder.none, // Remove the default border
                        ),
                        style: const TextStyle(
                            fontSize: 16), // Adjust text style if needed
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Outdoor Capacity',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8.0),
                      Checkbox(
                        value: outdoorCapacity,
                        onChanged: (bool? value) {
                          setState(() {
                            outdoorCapacity = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  if (outdoorCapacity)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white, // Top color
                            Colors.grey.shade200, // Bottom color
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3), // Shadow position
                          ),
                        ], // Outer border color
                      ),
                      child: TextFormField(
                        controller: _outdoorController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: const InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: "Enter the Outdoor Capacity",
                          border: InputBorder.none, // Remove the default border
                        ),
                        style: const TextStyle(
                            fontSize: 16), // Adjust text style if needed
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Activities/Games",
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isActivities = !_isActivities;
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
                                          selectedActivities.isEmpty
                                              ? "Select Activities/Games"
                                              : "Selected ${selectedActivities.length} Activities/Games",
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
                      if (_isActivities)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: activitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(activitiesList[index]),
                                value: _isActivitiesList[index],
                                selected: _isActivitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedActivities
                                          .contains(activitiesList[index])) {
                                        selectedActivities
                                            .add(activitiesList[index]);
                                        log(selectedActivities.toString());
                                      }
                                    } else {
                                      if (selectedActivities
                                          .contains(activitiesList[index])) {
                                        selectedActivities
                                            .remove(activitiesList[index]);
                                        log(selectedActivities.toString());
                                      }
                                    }
                                    _isActivitiesList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Facilities for the Participant",
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isParticipantFacilities = !isParticipantFacilities;
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
                                          selectedParticipantFacilities.isEmpty
                                              ? "Select Facilities for Participants"
                                              : "Select ${selectedParticipantFacilities.length} Preferred Refreshments",
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
                      if (isParticipantFacilities)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: participantFacilitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(participantFacilitiesList[index]),
                                value: isParticipantFacilitiesList[index],
                                selected: isParticipantFacilitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedParticipantFacilities
                                          .contains(participantFacilitiesList[
                                              index])) {
                                        selectedParticipantFacilities.add(
                                            participantFacilitiesList[index]);
                                      }
                                    } else {
                                      if (selectedParticipantFacilities
                                          .contains(participantFacilitiesList[
                                              index])) {
                                        selectedParticipantFacilities.remove(
                                            participantFacilitiesList[index]);
                                      }
                                    }
                                    isParticipantFacilitiesList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Facilities for the Attendees",
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isAttendeeFacilities = !isAttendeeFacilities;
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
                                          selectedAttendeeFacilities.isEmpty
                                              ? "Select Facilities for Attendees"
                                              : "Select ${selectedAttendeeFacilities.length} Preferred Refreshments",
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
                      if (isAttendeeFacilities)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: attendeeFacilitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(attendeeFacilitiesList[index]),
                                value: isAttendeeFacilitiesList[index],
                                selected: isAttendeeFacilitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedAttendeeFacilities.contains(
                                          attendeeFacilitiesList[index])) {
                                        selectedAttendeeFacilities
                                            .add(attendeeFacilitiesList[index]);
                                      }
                                    } else {
                                      if (selectedAttendeeFacilities.contains(
                                          attendeeFacilitiesList[index])) {
                                        selectedAttendeeFacilities.remove(
                                            attendeeFacilitiesList[index]);
                                      }
                                    }
                                    isAttendeeFacilitiesList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Safety and security features",
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSecurityMeasure = !_isSecurityMeasure;
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
                                          selectSecurityMeasure.isEmpty
                                              ? "Select Safety and security features"
                                              : "Selected ${selectSecurityMeasure.length} Safety and security features",
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
                      if (_isSecurityMeasure)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: securityMeasureList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(securityMeasureList[index]),
                                value: _isSecurityMeasureList[index],
                                selected: _isSecurityMeasureList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectSecurityMeasure.contains(
                                          securityMeasureList[index])) {
                                        selectSecurityMeasure
                                            .add(securityMeasureList[index]);
                                        log(selectSecurityMeasure.toString());
                                      }
                                    } else {
                                      if (selectSecurityMeasure.contains(
                                          securityMeasureList[index])) {
                                        selectSecurityMeasure
                                            .remove(securityMeasureList[index]);
                                        log(selectSecurityMeasure.toString());
                                      }
                                    }
                                    _isSecurityMeasureList[index] = value;
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
                  CustomDropdown(
                    heading: 'Charges',
                    subHeading: "Charges",
                    options: _chargesList,
                    selectedValue:
                        _selectedCharges, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCharges = value;
                      });
                    },
                  ),
                  if (_selectedCharges == "Charges per hours (in Rupees)" ||
                      _selectedCharges ==
                          "Charges per game/event (in Rupees)" ||
                      _selectedCharges == "Charges per day (in Rupees)" ||
                      _selectedCharges == "Charges per person (in Rupees)")
                    Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white, // Top color
                                Colors.grey.shade200, // Bottom color
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 3), // Shadow position
                              ),
                            ], // Outer border color
                          ),
                          child: TextFormField(
                            controller: _chargesController,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: const InputDecoration(
                              counterText: '',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              hintText: "Enter the Rupees",
                              border:
                                  InputBorder.none, // Remove the default border
                            ),
                            style: const TextStyle(
                                fontSize: 16), // Adjust text style if needed
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          sendPlaceHolderRegDataToServer(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors
                                    .orangeAccent; // Adjust color when pressed
                              }
                              return AppColors.orange; // Default color
                            },
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              5), // Elevation for 3D effect
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              side: BorderSide(
                                width: 1,
                                color: Colors.grey
                                    .shade400, // Border color for 3D effect
                              ),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
    //     _nameFacilityController.text,
    //     _spaceController.text,
    //     _address1Controller.text,
    //     _address2Controller.text,
    //     _cityController.text,
    //     _pincodeController.text,
    //     selectedTypeOfProperty,
    //     selectedDays,
    //     _selectedStartTime.toString(),
    //     _selectedEndTime.toString(),
    //     selectedActivities,
    //     selectSecurityMeasure,
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
