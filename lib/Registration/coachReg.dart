import 'dart:developer';
import 'dart:io';

import 'package:country_list_pick/support/code_country.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/state_utils.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/NewScreen/playLearn/Coaches/detailCoach.dart';
import 'package:sports2/Services/apiService.dart';
import 'package:sports2/Widgets/countryList.dart';
import 'package:sports2/Widgets/dobPicker.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/Widgets/slider.dart';
import 'package:sports2/Widgets/textField.dart';
import 'package:sports2/helper/theme.dart';
import 'package:csc_picker/csc_picker.dart';

class CoachRegistrationScreen extends StatefulWidget {
  @override
  _CoachRegistrationScreenState createState() =>
      _CoachRegistrationScreenState();
}

class _CoachRegistrationScreenState extends State<CoachRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  // final TextEditingController _cityController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  // final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _chargesController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _extraController = TextEditingController();

  String? _selectedGender;
  String? _selectedlevel;
  String? _selectedlocation;
  String? _selectedExperince;

  String? currentCountry;
  String? currentState;
  String? currentCity;

  // String? _selectedTargetGender;

  double _currentSliderValue = 0;
  bool providePickAndDrop = false;
  bool availibilty = false;
  bool ageGroup = false;

  final List<String> _gendersList = ['Male', 'Female', 'Other'];
  final List<String> _ExperienceList = ['1 year', '2 year', '3-5 years'];
  final List<String> _locationList = [
    'Indoor',
    'OutDoor',
    'Both Indoor and OutDoor'
  ];
  final List<String> _levelList = [
    'Beginner',
    'Intermediate',
    'Advance',
    'Both Beginner and Intermediate',
    'Both Intermediate and Advance',
    'Beginner, Intermediate and Advance'
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
  List GenderList = ['Male', 'Female', 'Other'];
  List GameList = ['Hockey', 'Pool', 'Cricket'];
  List FacilitiesList = [
    'Pick and Drop',
    'Transport',
    'Snacks',
    'Energy Drink',
    'Protein Shake',
    'Streching',
    'Intermediate',
    'physio',
    'Expert Physio'
  ];
  bool _isExpanded = false;
  bool _isGame = false;
  bool _isFacilities = false;
  bool _isExpanded1 = false;

  List<bool> isSpecializationList = List.filled(29, false);
  List<bool> isGameList = List.filled(29, false);
  List<bool> isFacilitiesList = List.filled(29, false);
  List<bool> isGenderList = List.filled(29, false);

  List selectedSpecialization = [];
  List selectedGame = [];
  List selectedFacilities = [];
  List selectedGender = [];
  bool _isIncludeFacilities = false;
  bool _isNotIncludeFacilities = false;
  bool _isOutStation = false;
  bool _isCity = false;

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

  Future<List<Country>> countries = getAllCountries();

  final states = getAllStates();

  final cities = getAllCities();
  // Future<void> _pickFiles() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['pdf', 'doc', 'docx'],
  //     );

  //     if (result != null) {
  //       PlatformFile file = result.files.first;
  //       // Use the selected file (file.path) or perform necessary actions
  //       print('File picked: ${file.name}');
  //       // Add further processing or upload logic here
  //     } else {
  //       // User canceled the file picking
  //       print('File picking canceled');
  //     }
  //   } catch (e) {
  //     // Handle exceptions or errors here
  //     print('Error picking file: $e');
  //   }
  // }

  FilePickerResult? result;

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
        title: Text("Coach Registration"),
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
                        : CircleAvatar(
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
                      heading: "Full Name",
                      hint: "Enter the Name",
                      keyboardType: TextInputType.name,
                      controller: _nameController),
                  CustomDropdown(
                    heading: 'Gender', subHeading: "Select Gender",
                    options: _gendersList,
                    selectedValue:
                        _selectedGender, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
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
                        "Sports/Game",
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
                            _isGame = !_isGame;
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
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            selectedGame.isEmpty
                                                ? "Select one or more Game/Sports"
                                                : "Selected " +
                                                    selectedGame.join(', '),
                                            maxLines:
                                                2, // Limit to a single line
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                      if (_isGame)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: GameList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(GameList[index]),
                                value: isGameList[index],
                                selected: isGameList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedGame
                                          .contains(GameList[index])) {
                                        selectedGame.add(GameList[index]);
                                      }
                                    } else {
                                      if (selectedGame
                                          .contains(GameList[index])) {
                                        selectedGame.remove(GameList[index]);
                                      }
                                    }
                                    isGameList[index] = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomDropdown(
                    heading: 'Experience', subHeading: "Select Experience",
                    options: _ExperienceList,
                    selectedValue:
                        _selectedExperince, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
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
                        "Preferred Gender for coaching/training",
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
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            selectedGender.isEmpty
                                                ? "Select Preferred Gender"
                                                : "Selected " +
                                                    selectedGender.join(', '),
                                            maxLines:
                                                2, // Limit to a single line
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                  CustomDropdown(
                    heading: 'Preferred level of coaching/training',
                    subHeading: "Select level",
                    options: _levelList,
                    selectedValue:
                        _selectedlevel, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedlevel = value;
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
                        'Preferred Age of Coaching/training',
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
                              ? 'Select Preferred Age of Coaching/training '
                              : 'Slide to Set Age of Coaching/training'),
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
                  CustomDropdown(
                    heading: 'Preferred location of coaching/training',
                    subHeading: "Select location",
                    options: _locationList,
                    selectedValue:
                        _selectedlocation, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedlocation = value;
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
                            activeColor: Colors.orange,
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
                        height: 20,
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Facilities",
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
                            _isFacilities = !_isFacilities;
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
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            selectedFacilities.isEmpty
                                                ? "Select Preferred Facilities"
                                                : "Selected " +
                                                    selectedFacilities
                                                        .join(', '),
                                            maxLines:
                                                2, // Limit to a single line
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                      if (_isFacilities)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
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
                    height: 20,
                  ),

                  TextWidget(
                      heading: "Hourly Pricing",
                      hint: "Enter Price",
                      keyboardType: TextInputType.number,
                      controller: _priceController),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price Includes Facilities',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: _isIncludeFacilities,
                        onChanged: (value) {
                          setState(() {
                            _isIncludeFacilities = value!;
                          });
                        },
                      ),
                      //  SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price does not Includes Facilities',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: _isNotIncludeFacilities,
                        onChanged: (value) {
                          setState(() {
                            _isNotIncludeFacilities = value!;
                          });
                        },
                      ),
                      //  SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'I am open for outstation travel',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: _isOutStation,
                        onChanged: (value) {
                          setState(() {
                            _isOutStation = value!;
                          });
                        },
                      ),
                      //  SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'I prefer to be in my city',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: _isCity,
                        onChanged: (value) {
                          setState(() {
                            _isCity = value!;
                          });
                        },
                      ),
                      //  SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CSCPicker(
                    title: Text(
                      'Select Country, State and city',
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    currentCountry: countryValue,
                    currentCity: cityValue,
                    currentState: stateValue,
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onCityChanged: (value) => setState(() {
                      cityValue = value;
                    }),
                    onStateChanged: (value) => setState(() {
                      stateValue = value;
                    }),
                    layout: Layout.vertical,
                    defaultCountry: CscCountry.India,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Address",
                      hint: "Enter Address",
                      keyboardType: TextInputType.text,
                      controller: _addressController),
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

/*********************************************************************************************************/
                  TextWidget(
                      heading: "Email",
                      hint: "Enter email",
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController),
                  TextWidget(
                      heading: "Contact Number",
                      hint: "Enter contact No",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _mobileController),
                  TextWidget(
                      heading: "Whatsapp Number",
                      hint: "Enter Whatsapp No",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _mobileController),

                  // ElevatedButton(
                  //   onPressed: _pickFiles,
                  //   child: Text('Upload Document'),
                  // ),
                  // TextWidget(
                  //     heading: "Password",
                  //     hint: "Enter Password",
                  //     keyboardType: TextInputType.text,
                  //     controller: _passwordController),

                  // DatePickerField(
                  //   controller: _dobController,
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // buildCustomPicker(),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       "Sports Specialization",
                  //       style: TextStyle(
                  //           color: AppColors.orange,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     const SizedBox(
                  //       height: 10,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           _isExpanded = !_isExpanded;
                  //         });
                  //       },
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(5),
                  //                 border: Border.all(color: Colors.grey),
                  //                 gradient: LinearGradient(
                  //                   begin: Alignment.topCenter,
                  //                   end: Alignment.bottomCenter,
                  //                   colors: [
                  //                     Colors.white, // Top color
                  //                     Colors.grey.shade200, // Bottom color
                  //                   ],
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Colors.grey.withOpacity(0.5),
                  //                     spreadRadius: 2,
                  //                     blurRadius: 4,
                  //                     offset: Offset(0, 3), // Shadow position
                  //                   ),
                  //                 ],
                  //               ),
                  //               child: DropdownButtonHideUnderline(
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Flexible(
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.all(4.0),
                  //                         child: Text(
                  //                           selectedSpecialization.isEmpty
                  //                               ? "Select one or more Sports Specialization"
                  //                               : "Selected " +
                  //                                   selectedSpecialization
                  //                                       .join(', '),
                  //                           maxLines:
                  //                               2, // Limit to a single line
                  //                           overflow: TextOverflow.ellipsis,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     Container(
                  //                         margin: EdgeInsets.only(top: 20),
                  //                         child: const Icon(
                  //                             Icons.arrow_drop_down)),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     if (_isExpanded)
                  //       AnimatedContainer(
                  //         //width: 300,
                  //         height: 200,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: Colors.grey)),
                  //         duration: Duration(milliseconds: 300),
                  //         child: ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: ScrollPhysics(),
                  //           itemCount: SpecializationList.length,
                  //           itemBuilder: (context, index) {
                  //             return CheckboxListTile(
                  //               autofocus: true,
                  //               checkColor: Colors.white,
                  //               title: Text(SpecializationList[index]),
                  //               value: isSpecializationList[index],
                  //               selected: isSpecializationList[index],
                  //               dense: true,
                  //               onChanged: (value) {
                  //                 setState(() {
                  //                   if (value!) {
                  //                     if (!selectedSpecialization.contains(
                  //                         SpecializationList[index])) {
                  //                       selectedSpecialization
                  //                           .add(SpecializationList[index]);
                  //                     }
                  //                   } else {
                  //                     if (selectedSpecialization.contains(
                  //                         SpecializationList[index])) {
                  //                       selectedSpecialization
                  //                           .remove(SpecializationList[index]);
                  //                     }
                  //                   }
                  //                   isSpecializationList[index] = value;
                  //                 });
                  //               },
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //   ],
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
                  // TextWidget(
                  //     heading: "Something extra ordinary",
                  //     hint: "Enter Something extra ordinary",
                  //     keyboardType: TextInputType.name,
                  //     controller: _extraController),
                  // TextWidget(
                  //     heading: "Specific Skills or Techniques Taught",
                  //     hint: "Enter Specific Skills",
                  //     keyboardType: TextInputType.name,
                  //     controller: _skillController),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'Do you provide pick and drop facility?',
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
                  //               ? 'Providing Pick and Drop'
                  //               : 'Not Providing Pick and Drop',
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // TextWidget(
                  //     maxLength: 6,
                  //     heading: "Charges per Hours",
                  //     hint: "Enter Charges",
                  //     keyboardType: TextInputType.number,
                  //     controller: _chargesController),

                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          // print("Press");
                          // sendCoachRegDataToServer(context);
                          Get.to(() => CoachDetailScreen());
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
      countryValue!,
      _selectedGender.toString(),
      selectedGender,
      selectedDays,
      _selectedStartTime.toString(),
      _selectedEndTime.toString(),
      selectedAgeGroup,
      _extraController.text,
      _skillController.text,
      // _stateController.text,
      stateValue!,
      cityValue!,
      // _cityController.text,
      _areaController.text,
      providePickAndDropList,
      _chargesController.text,
      // DateTime.now(),
      _pincodeController.text,
      "coach",
      //  _imageFile!
    );
  }
}
