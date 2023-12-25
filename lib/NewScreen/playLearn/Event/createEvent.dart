import 'dart:developer';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:country_list_pick/support/code_country.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/Services/apiService.dart';
import 'package:sports2/Widgets/countryList.dart';
import 'package:sports2/Widgets/dobPicker.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/Widgets/slider.dart';
import 'package:sports2/Widgets/textField.dart';
import 'package:sports2/helper/theme.dart';

class CreateEventScreen extends StatefulWidget {
  // CreateEventScreen({
  //   Key? key,
  // }) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

//var data = Get.arguments;

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _chargesController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _extraController = TextEditingController();

  String? _selectedGender;
  String? _selectedSport;

  String? _countryName;

  // String? _selectedTargetGender;

  double _currentSliderValue = 0;
  bool providePickAndDrop = false;
  bool availibilty = false;
  bool ageGroup = false;

  final List<String> _gendersList = ['Male', 'Female', 'Other'];
  final List<String> _sportsList = ['Hockey', 'Cricket', 'BasketBall'];

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
  List FacilitiesList = ['Camera', 'Security', 'Gaurds', 'Lights', 'Police'];
  List GenderList = ['Male', 'Female', 'Other'];
  bool _isExpanded = false;
  bool _isExpanded1 = false;
  bool _isExpandedFac = false;
  bool _isExpandedFac1 = false;
  // bool _isExpanded = false;

  List<bool> isSpecializationList = List.filled(29, false);
  List<bool> isFacilitiesList = List.filled(29, false);
  List<bool> isGenderList = List.filled(29, false);

  List selectedSpecialization = [];
  List selectedFacilities = [];
  List selectedGender = [];
  TimeOfDay _selectedStartTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _selectedEndTime = TimeOfDay(hour: 18, minute: 0);
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

  String? countryValue;
  String? stateValue;
  String? cityValue;
  DateTime _selectedStartDate = DateTime.now();
  // TimeOfDay _selectedStartTime = TimeOfDay.now();
  DateTime _selectedEndDate = DateTime.now();
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange, // Set back button color to white
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
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
                  // Handle edit profile photo functionality
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 233, 205, 163), // Background color
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
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
                          : Center(
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
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 200, 243, 239),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
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
                  // CustomDropdown(
                  //   heading: 'Registering youself As?',
                  //   subHeading: "Select User Type",
                  //   options: _userList,
                  //   selectedValue:
                  //       _selectedUser, // Set your initial selected value
                  //   onChanged: (String? value) {
                  //     setState(() {
                  //       _selectedUser = value;
                  //     });
                  //   },
                  // ),
                  TextWidget(
                      heading: "Event Name",
                      hint: "Enter Event Name",
                      keyboardType: TextInputType.name,
                      controller: _nameController),

                  TextWidget(
                      heading: "Time From",
                      hint: "Enter Time",
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController),
                  TextWidget(
                      heading: "Time To",
                      hint: "Enter Time",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Duration",
                      hint: "Enter Password",
                      keyboardType: TextInputType.text,
                      controller: _passwordController),
                  TextWidget(
                      heading: "Venue",
                      hint: "Enter Venue",
                      keyboardType: TextInputType.text,
                      controller: _addressController),
                  CustomDropdown(
                    heading: 'Sports Type', subHeading: "Select Sport",
                    options: _sportsList,
                    selectedValue:
                        _selectedSport, // Set your initial selected value
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
                        "Event Facilities",
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
                            _isExpandedFac = !_isExpandedFac;
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
                                          selectedFacilities.isEmpty
                                              ? "Event Facilities"
                                              : "You are Selected ${selectedFacilities.length} Sports Facilities",
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
                      if (_isExpandedFac)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: FacilitiesList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(FacilitiesList[index]),
                                value: isFacilitiesList[index],
                                selected: isFacilitiesList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedFacilities
                                          .contains(FacilitiesList[index])) {
                                        selectedFacilities
                                            .add(FacilitiesList[index]);
                                      }
                                    } else {
                                      if (selectedFacilities
                                          .contains(FacilitiesList[index])) {
                                        selectedFacilities
                                            .remove(FacilitiesList[index]);
                                      }
                                    }
                                    isFacilitiesList[index] = value;
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
                  /******************************************************/
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // DatePickerField(
                  //   controller: _dobController,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  CountryPickerWidget(
                    onChanged: (CountryCode? code) {
                      _countryName = code?.name;
                      print(_countryName);
                      // Handle the selected country code or name
                      if (code != null) {
                        print('Selected country: ${code.name}');
                        print('Country code: ${code.dialCode}');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "State",
                      hint: "Enter State",
                      keyboardType: TextInputType.text,
                      controller: _stateController),
                  TextWidget(
                      heading: "City",
                      hint: "Enter City",
                      keyboardType: TextInputType.text,
                      controller: _cityController),
                  TextWidget(
                      heading: "Landmark of your Area",
                      hint: "Enter Area",
                      keyboardType: TextInputType.text,
                      controller: _areaController),
                  TextWidget(
                      heading: "Pincode",
                      hint: "Enter Pincode",
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      controller: _pincodeController),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Preferred Gender",
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
                            _isExpanded1 = !_isExpanded1;
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
                                          selectedGender.isEmpty
                                              ? "Select Preferred Gender"
                                              : "Select ${selectedGender.length} Preferred Gender",
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
                      if (_isExpanded1)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: GenderList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(GenderList[index]),
                                value: isGenderList[index],
                                selected: isGenderList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedGender
                                          .contains(GenderList[index])) {
                                        selectedGender.add(GenderList[index]);
                                      }
                                    } else {
                                      if (selectedGender
                                          .contains(GenderList[index])) {
                                        selectedGender
                                            .remove(GenderList[index]);
                                      }
                                    }
                                    isGenderList[index] = value;
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
                  CustomSlider(
                    minValue: 0,
                    maxValue: 100,
                    divisions: 10,
                    label: 'Experince Level',
                    onChanged: (double value) {
                      _currentSliderValue = value;
                      // Do something with the value when it changes
                      print('Selected level: ${_currentSliderValue.round()}');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferred Age Group to participant',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Switch(
                            activeColor: Colors.orange,
                            value: ageGroup,
                            onChanged: (newValue) {
                              setState(() {
                                ageGroup = newValue;
                              });
                            },
                          ),
                          Text(ageGroup
                              ? 'Select Preferred Age Group to participant'
                              : 'Slide to Set Preferred Age Group to participant'),
                        ],
                      ),
                      ageGroup
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _ageGroups.keys.map((String ageGroup) {
                                return CheckboxListTile(
                                  title: Text(ageGroup),
                                  value: _ageGroups[ageGroup],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _ageGroups[ageGroup] = value ?? false;

                                      if (value == true) {
                                        selectedAgeGroup.add(ageGroup);
                                        log(selectedAgeGroup
                                            .toString()); // Add selected age group to the list
                                      } else {
                                        selectedAgeGroup.remove(ageGroup);
                                        log(selectedAgeGroup
                                            .toString()); // Remove unselected age group from the list
                                      }
                                    });
                                  },
                                  // onChanged: (bool? value) {
                                  //   setState(() {
                                  //     _ageGroups[ageGroup] = value ?? false;
                                  //   });
                                  // },
                                );
                              }).toList(),
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  TextWidget(
                      heading: "Rules and Regulations",
                      hint: "Enter Rules and Regulations",
                      keyboardType: TextInputType.name,
                      controller: _extraController),
                  TextWidget(
                      heading: "Participant Limits",
                      hint: "Enter Participant Limits",
                      keyboardType: TextInputType.number,
                      controller: _skillController),
                  TextWidget(
                      heading: "Trophies/Awards",
                      hint: "Enter Trophies/Awards",
                      keyboardType: TextInputType.number,
                      controller: _skillController),
                  TextWidget(
                      heading: "Sponsors",
                      hint: "Enter Sponsorsed By",
                      keyboardType: TextInputType.number,
                      controller: _skillController),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you Have Medical Facilities?',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Switch(
                            activeColor: Colors.orange,
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
                          Text(
                            providePickAndDrop
                                ? 'Providing Medical Facilities'
                                : 'Not Providing Medical Facilities',
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  TextWidget(
                      maxLength: 6,
                      heading: "Entry Fees",
                      hint: "Enter Enter Fees",
                      keyboardType: TextInputType.number,
                      controller: _chargesController),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          sendCoachRegDataToServer(context);
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

  void sendCoachRegDataToServer(BuildContext context) {
    ApiService().RegisterCoach(
      _nameController.text,
      "sahil@gmail.og",
      "888888",
      _passwordController.text,
      _addressController.text,
      _currentSliderValue.toString(),
      _dobController.text,
      selectedSpecialization,
      _countryName.toString(),
      _selectedGender.toString(),
      selectedGender,
      selectedDays,
      _selectedStartTime.toString(),
      _selectedEndTime.toString(),
      selectedAgeGroup,
      _extraController.text,
      _skillController.text,
      _stateController.text,
      _cityController.text,
      _areaController.text,
      providePickAndDropList,
      _chargesController.text,
      // DateTime.now(),
      _pincodeController.text,
      "coach",
      //  _imageFile!
    );
    // For demonstration purposes, print the data
    // print('Name: $name, Number: $number, Email: $email ');

    // Show a message or navigate after sending data to the server
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Data sent successfully')),
    // );
  }
}
