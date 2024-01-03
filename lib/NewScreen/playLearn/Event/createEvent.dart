import 'dart:developer';
import 'dart:io';

import 'package:country_list_pick/support/code_country.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/NewScreen/playLearn/Event/showEvent.dart';
import 'package:sports2/NewScreen/playLearn/Event/test.dart';
import 'package:sports2/Services/apiService.dart';
import 'package:sports2/Widgets/countryList.dart';
import 'package:sports2/Widgets/datePicker.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/Widgets/slider.dart';
import 'package:sports2/Widgets/textField.dart';
import 'package:sports2/helper/theme.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  List<TextEditingController> controllers = [TextEditingController()];

  void addTextField() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void removeTextField() {
    setState(() {
      if (controllers.length > 1) {
        controllers.removeLast();
      }
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // final TextEditingController _dobController = TextEditingController();
  // final TextEditingController _cityController = TextEditingController();
  // final TextEditingController _areaController = TextEditingController();
  // final TextEditingController _stateController = TextEditingController();
  // final TextEditingController _pincodeController = TextEditingController();
  // final TextEditingController _chargesController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _extraController = TextEditingController();

  // String? _selectedGender;
  String? _selectedSport;

  // String? _countryName;

  // String? _selectedTargetGender;

  // double _currentSliderValue = 0;
  bool providePickAndDrop = false;
  bool availibilty = false;
  bool ageGroup = false;

  // final List<String> _gendersList = ['Male', 'Female', 'Other'];
  final List<String> _participantLevelList = [
    'Beginner',
    'Intermediate',
    'Advance'
  ];
  String? _selectedpurposeEvent;
  final List<String> _purposeEventList = [
    'This is a charitable event',
    'This is a Entertainment event',
    'This is a Sponsored event',
    'This is a "In memory of" event',
    'This is a Community based event',
    'This is a Friendly event',
    'This is a Institutional event',
    'This is a Competitive event',
    'This is a Casual event',
  ];
  String? _selectedAttend;
  final List<String> _attendList = [
    'Anyone until venue is full (free)',
    'Tickets are sold at venue',
    'only by invitation',
    'Paid tickets holders',
    'Pass holders',
  ];

  final Map<String, bool> _ageGroups = {
    'Kids (6-12)': false,
    'Teenagers (13-18)': false,
    'Young Adults (19-30)': false,
    'Adults (31-50)': false,
    'Seniors (50+)': false,
  };
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
  List<String> selectedAgeGroup = [];
  List SpecializationList = [
    'Football',
    'Basketball',
    'Tennis',
    'Swimming',
    'Others'
  ];
  List AwardList = [
    'Winners will get Trophy',
    'Winners will get Trophy with cash prize',
    'Winners will get Certificate',
    'Winners will get Certificate with cash prize',
    'Winners will get cash Prize',
    'Winners will get Citation on website',
    'Winners will get Socail media circulation',
    'Participants will get Certificates'
  ];
  List GenderList = ['Male', 'Female', 'Other'];
  bool _isExpanded1 = false;
  bool isAward = false;
  bool isParticipantGender = false;
  List<bool> isParticipantGenderList = List.filled(29, false);
  List selectedParticipantGender = [];
  List participantGenderList = [
    'Male',
    'Female',
    'Other',
  ];
  bool isParticipantRefresh = false;
  List<bool> isParticipantRefreshList = List.filled(29, false);
  List selectedParticipantRefresh = [];
  List participantRefreshList = [
    'Free snack',
    'Free lunch',
    'Free Dinner',
    'Free Water',
    'Free Energy Drink',
    'Paid snack',
    'Paid lunch',
    'Paid Dinner',
    'Paid Water',
    'Paid Energy Drink',
  ];
  bool isAttendeeRefresh = false;
  List<bool> isAttendeeRefreshList = List.filled(29, false);
  List selectedAttendeeRefresh = [];
  List AttendeeRefreshList = [
    'Free snack',
    'Free lunch',
    'Free Dinner',
    'Free Water',
    'Free Energy Drink',
    'Paid snack',
    'Paid lunch',
    'Paid Dinner',
    'Paid Water',
    'Paid Energy Drink',
  ];
  bool isAttendeeFacilities = false;
  List<bool> isAttendeeFacilitiesList = List.filled(29, false);
  List selectedAttendeeFacilities = [];
  List AttendeeFacilitiesList = [
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
  List ParticipantFacilitiesList = [
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
  bool isSecurity = false;
  List<bool> isSecurityList = List.filled(29, false);
  List selectedSecurity = [];
  List SecurityList = [
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
  ];
  // bool _isExpanded = false;

  List<bool> isSpecializationList = List.filled(29, false);
  List<bool> isAwardList = List.filled(29, false);
  List<bool> isGenderList = List.filled(29, false);

  List selectedSpecialization = [];
  List selectedAward = [];
  List selectedGender = [];
  // TimeOfDay _selectedStartTime = TimeOfDay(hour: 8, minute: 0);
  // TimeOfDay _selectedEndTime = TimeOfDay(hour: 18, minute: 0);
  List<String> providePickAndDropList = [];
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

  TextEditingController _dateController = TextEditingController();
  String? countryValue;
  String? stateValue;
  String? cityValue;
  // TimeOfDay _selectedStartTime = TimeOfDay.now();
  // TimeOfDay _selectedEndTime = TimeOfDay.now();

  Future<List<Country>> countries = getAllCountries();
  // Get all states
  final states = getAllStates();
  // Get all cities
  final cities = getAllCities();

  // Get a country
  // final country =  getCountryFromCode('AF');

  @override
  Widget build(BuildContext context) {
    List<Widget> textFields = controllers.map((controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "heading",
          //   style: TextStyle(
          //     color: AppColors.orange,
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          SizedBox(height: 8),
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
                  offset: Offset(0, 3), // Shadow position
                ),
              ], // Outer border color
            ),
            child: TextFormField(
              controller: controller,
              // keyboardType: keyboardType,
              // maxLength: maxLength,
              decoration: InputDecoration(
                counterText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: "Add all social link by adding +",
                border: InputBorder.none, // Remove the default border
              ),
              style: TextStyle(fontSize: 16), // Adjust text style if needed
            ),
          ),
          SizedBox(height: 15),
        ],
      );
      ;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Create Event",
          style:
              TextStyle(color: AppColors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  _getImage();
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 205, 163),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: _imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200,
                              ),
                            )
                          : const Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 60,
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      heading: "Event type",
                      hint:
                          "Exp: Indoor games, sports, dance competition, singing competition etc.",
                      keyboardType: TextInputType.name,
                      controller: _nameController),

                  TextWidget(
                      heading: "Name of activity",
                      hint:
                          "Exp: Football match, Annual Function, Lawn tennis match etc.",
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController),
                  TextWidget(
                      heading: "Venue/Place",
                      hint: "Enter Venue/Place",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Name of the Event",
                      hint: "Enter Name of Event",
                      keyboardType: TextInputType.text,
                      controller: _passwordController),
                  TextWidget(
                      heading: "Venue",
                      hint: "Enter Venue",
                      keyboardType: TextInputType.text,
                      controller: _addressController),
                  const SizedBox(
                    height: 10,
                  ),
                  buildDatePickerField(
                    controller: _dateController,
                    context: context,
                    heading: 'Select Start Date',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildDatePickerField(
                    controller: _dateController,
                    context: context,
                    heading: 'Select End Date',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                      heading: "Total Days",
                      hint: "Enter Total Days",
                      keyboardType: TextInputType.number,
                      controller: _addressController),
                  TextWidget(
                      heading: "Participant Age Group",
                      hint: "Ex: 20 -25 year",
                      keyboardType: TextInputType.number,
                      controller: _addressController),
                  TextWidget(
                      heading: "Participant Height Group",
                      hint: "Ex: 130 - 150 Cm",
                      keyboardType: TextInputType.number,
                      controller: _addressController),
                  TextWidget(
                      heading: "Participant Weight Group",
                      hint: "Ex: 40 - 50 kg",
                      keyboardType: TextInputType.number,
                      controller: _addressController),

                  CustomDropdown(
                    heading: 'Participants level',
                    subHeading: "Select Participant level",
                    options: _participantLevelList,
                    selectedValue: _selectedSport,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedSport = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Participants Gender",
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
                            isParticipantGender = !isParticipantGender;
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
                                          selectedParticipantGender.isEmpty
                                              ? "Select Preferred Gender"
                                              : "Select ${selectedParticipantGender.length} Preferred Gender",
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
                      if (isParticipantGender)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: participantGenderList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(participantGenderList[index]),
                                value: isParticipantGenderList[index],
                                selected: isParticipantGenderList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedParticipantGender.contains(
                                          participantGenderList[index])) {
                                        selectedParticipantGender
                                            .add(participantGenderList[index]);
                                      }
                                    } else {
                                      if (selectedParticipantGender.contains(
                                          participantGenderList[index])) {
                                        selectedParticipantGender.remove(
                                            participantGenderList[index]);
                                      }
                                    }
                                    isParticipantGenderList[index] = value;
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
                        "Award/Reward",
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
                            isAward = !isAward;
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
                                          selectedAward.isEmpty
                                              ? "select Award/Reward"
                                              : "You are Selected ${selectedAward.length} Sports Facilities",
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
                      if (isAward)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: AwardList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(AwardList[index]),
                                value: isAwardList[index],
                                selected: isAwardList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedAward
                                          .contains(AwardList[index])) {
                                        selectedAward.add(AwardList[index]);
                                      }
                                    } else {
                                      if (selectedAward
                                          .contains(AwardList[index])) {
                                        selectedAward.remove(AwardList[index]);
                                      }
                                    }
                                    isAwardList[index] = value;
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

                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // CustomSlider(
                  //   minValue: 0,
                  //   maxValue: 100,
                  //   divisions: 10,
                  //   label: 'Experince Level',
                  //   onChanged: (double value) {
                  //     _currentSliderValue = value;
                  //     // Do something with the value when it changes
                  //     print('Selected level: ${_currentSliderValue.round()}');
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'Preferred Age Group to participant',
                  //       style: TextStyle(
                  //           color: AppColors.orange,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     Row(
                  //       children: [
                  //         Switch(
                  //           activeColor: Colors.orange,
                  //           value: ageGroup,
                  //           onChanged: (newValue) {
                  //             setState(() {
                  //               ageGroup = newValue;
                  //             });
                  //           },
                  //         ),
                  //         Text(ageGroup
                  //             ? 'Select Preferred Age Group to participant'
                  //             : 'Slide to Set Preferred Age Group to participant'),
                  //       ],
                  //     ),
                  //     ageGroup
                  //         ? Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: _ageGroups.keys.map((String ageGroup) {
                  //               return CheckboxListTile(
                  //                 title: Text(ageGroup),
                  //                 value: _ageGroups[ageGroup],
                  //                 onChanged: (bool? value) {
                  //                   setState(() {
                  //                     _ageGroups[ageGroup] = value ?? false;

                  //                     if (value == true) {
                  //                       selectedAgeGroup.add(ageGroup);
                  //                       log(selectedAgeGroup
                  //                           .toString()); // Add selected age group to the list
                  //                     } else {
                  //                       selectedAgeGroup.remove(ageGroup);
                  //                       log(selectedAgeGroup
                  //                           .toString()); // Remove unselected age group from the list
                  //                     }
                  //                   });
                  //                 },
                  //                 // onChanged: (bool? value) {
                  //                 //   setState(() {
                  //                 //     _ageGroups[ageGroup] = value ?? false;
                  //                 //   });
                  //                 // },
                  //               );
                  //             }).toList(),
                  //           )
                  //         : const SizedBox(),
                  //     SizedBox(
                  //       height: 20,
                  //     )
                  //   ],
                  // ),
                  CustomDropdown(
                    heading: 'Purpose of Event',
                    subHeading: "Select Participant level",
                    options: _purposeEventList,
                    selectedValue: _selectedpurposeEvent,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedpurposeEvent = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdown(
                    heading: 'Who can attend',
                    subHeading: "Select Attendee",
                    options: _attendList,
                    selectedValue: _selectedAttend,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedAttend = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                      heading: "Dress code for participant",
                      hint:
                          "Exp.: Tee Shits and Shorts, Jacket and Lower, Kurta Pajama, Formals, Casuals etc.",
                      keyboardType: TextInputType.name,
                      controller: _extraController),
                  TextWidget(
                      heading: "Dress code for attendees",
                      hint:
                          "Exp.: Tee Shits and Shorts, Jacket and Lower, Kurta Pajama, Formals, Casuals etc.",
                      keyboardType: TextInputType.number,
                      controller: _skillController),
                  // TextWidget(
                  //     heading: "Trophies/Awards",
                  //     hint: "Enter Trophies/Awards",
                  //     keyboardType: TextInputType.number,
                  //     controller: _skillController),
                  // TextWidget(
                  //     heading: "Sponsors",
                  //     hint: "Enter Sponsorsed By",
                  //     keyboardType: TextInputType.number,
                  //     controller: _skillController),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'Do you Have Medical Facilities?',
                  //       style: TextStyle(
                  //           color: AppColors.orange,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     Row(
                  //       children: [
                  //         Switch(
                  //           activeColor: Colors.orange,
                  //           value: providePickAndDrop,
                  //           onChanged: (newValue) {
                  //             setState(() {
                  //               providePickAndDrop = newValue;

                  //               // Clear the list before adding the latest value
                  //               providePickAndDropList.clear();

                  //               // Update the list based on the switch value
                  //               if (newValue) {
                  //                 providePickAndDropList.add('Yes');
                  //                 print(providePickAndDrop
                  //                     .toString()); // Print 'true' when true
                  //               } else {
                  //                 providePickAndDropList.add('No');
                  //                 print(providePickAndDrop
                  //                     .toString()); // Print 'false' when false
                  //               }
                  //             });
                  //           },
                  //         ),
                  //         Text(
                  //           providePickAndDrop
                  //               ? 'Providing Medical Facilities'
                  //               : 'Not Providing Medical Facilities',
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Refreshment for the participant",
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
                            isParticipantRefresh = !isParticipantRefresh;
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
                                          selectedParticipantRefresh.isEmpty
                                              ? "Select Refreshment for participants"
                                              : "Select ${selectedParticipantRefresh.length} Preferred Refreshments",
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
                      if (isParticipantRefresh)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: participantRefreshList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(participantRefreshList[index]),
                                value: isParticipantRefreshList[index],
                                selected: isParticipantRefreshList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedParticipantRefresh.contains(
                                          participantRefreshList[index])) {
                                        selectedParticipantRefresh
                                            .add(participantRefreshList[index]);
                                      }
                                    } else {
                                      if (selectedParticipantRefresh.contains(
                                          participantRefreshList[index])) {
                                        selectedParticipantRefresh.remove(
                                            participantRefreshList[index]);
                                      }
                                    }
                                    isParticipantRefreshList[index] = value;
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
                        "Refreshment for the Attendees",
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
                            isAttendeeRefresh = !isAttendeeRefresh;
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
                                          selectedAttendeeRefresh.isEmpty
                                              ? "Select Refreshment for Attendees"
                                              : "Select ${selectedAttendeeRefresh.length} Preferred Refreshments",
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
                      if (isAttendeeRefresh)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: AttendeeRefreshList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(AttendeeRefreshList[index]),
                                value: isAttendeeRefreshList[index],
                                selected: isAttendeeRefreshList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedAttendeeRefresh.contains(
                                          AttendeeRefreshList[index])) {
                                        selectedAttendeeRefresh
                                            .add(AttendeeRefreshList[index]);
                                      }
                                    } else {
                                      if (selectedAttendeeRefresh.contains(
                                          AttendeeRefreshList[index])) {
                                        selectedAttendeeRefresh
                                            .remove(AttendeeRefreshList[index]);
                                      }
                                    }
                                    isAttendeeRefreshList[index] = value;
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
                      if (isParticipantFacilities)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: ParticipantFacilitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(ParticipantFacilitiesList[index]),
                                value: isParticipantFacilitiesList[index],
                                selected: isParticipantFacilitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedParticipantFacilities
                                          .contains(ParticipantFacilitiesList[
                                              index])) {
                                        selectedParticipantFacilities.add(
                                            ParticipantFacilitiesList[index]);
                                      }
                                    } else {
                                      if (selectedParticipantFacilities
                                          .contains(ParticipantFacilitiesList[
                                              index])) {
                                        selectedParticipantFacilities.remove(
                                            ParticipantFacilitiesList[index]);
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
                      if (isAttendeeFacilities)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: AttendeeFacilitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(AttendeeFacilitiesList[index]),
                                value: isAttendeeFacilitiesList[index],
                                selected: isAttendeeFacilitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedAttendeeFacilities.contains(
                                          AttendeeFacilitiesList[index])) {
                                        selectedAttendeeFacilities
                                            .add(AttendeeFacilitiesList[index]);
                                      }
                                    } else {
                                      if (selectedAttendeeFacilities.contains(
                                          AttendeeFacilitiesList[index])) {
                                        selectedAttendeeFacilities.remove(
                                            AttendeeFacilitiesList[index]);
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
                        "Security measures",
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
                            isSecurity = !isSecurity;
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
                                          selectedSecurity.isEmpty
                                              ? "Select Security measures"
                                              : "Select ${selectedSecurity.length} Security measures",
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
                      if (isSecurity)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: SecurityList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(SecurityList[index]),
                                value: isSecurityList[index],
                                selected: isSecurityList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedSecurity
                                          .contains(SecurityList[index])) {
                                        selectedSecurity
                                            .add(SecurityList[index]);
                                      }
                                    } else {
                                      if (selectedSecurity
                                          .contains(SecurityList[index])) {
                                        selectedSecurity
                                            .remove(SecurityList[index]);
                                      }
                                    }
                                    isSecurityList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Add social media handling link",
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(children: textFields),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              addTextField();
                            },
                            child: Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              removeTextField();
                            },
                            child: Icon(
                              Icons.remove,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextWidget(
                      heading: "Book your Ticket/Pass From",
                      hint:
                          "Exp.: BookMyShow.com , AtTheVenue, Name if the places etc.",
                      keyboardType: TextInputType.number,
                      controller: _skillController),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          Get.to(() => EventDetailScreen());
                          //sendCoachRegDataToServer(context);
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
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Create Event',
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

  // void sendCoachRegDataToServer(BuildContext context) {
  //   ApiService().RegisterCoach(
  //     _nameController.text,
  //     "sahil@gmail.og",
  //     "888888",
  //     _passwordController.text,
  //     _addressController.text,
  //     _currentSliderValue.toString(),
  //     _dobController.text,
  //     selectedSpecialization,
  //     _countryName.toString(),
  //     _selectedGender.toString(),
  //     selectedGender,
  //     selectedDays,
  //     _selectedStartTime.toString(),
  //     _selectedEndTime.toString(),
  //     selectedAgeGroup,
  //     _extraController.text,
  //     _skillController.text,
  //     _stateController.text,
  //     _cityController.text,
  //     _areaController.text,
  //     providePickAndDropList,
  //     _chargesController.text,
  //     // DateTime.now(),
  //     _pincodeController.text,
  //     "coach",
  //     //  _imageFile!
  //   );
  //   // For demonstration purposes, print the data
  //   // print('Name: $name, Number: $number, Email: $email ');

  //   // Show a message or navigate after sending data to the server
  //   // ScaffoldMessenger.of(context).showSnackBar(
  //   //   SnackBar(content: Text('Data sent successfully')),
  //   // );
  // }
}
