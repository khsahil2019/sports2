import 'dart:developer';
import 'dart:io';

import 'package:country_list_pick/support/code_country.dart';
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

class CoachRegistrationScreen extends StatefulWidget {
  // CoachRegistrationScreen({
  //   Key? key,
  // }) : super(key: key);

  @override
  _CoachRegistrationScreenState createState() =>
      _CoachRegistrationScreenState();
}

//var data = Get.arguments;

class _CoachRegistrationScreenState extends State<CoachRegistrationScreen> {
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

  String? _countryName;

  // String? _selectedTargetGender;

  double _currentSliderValue = 0;
  bool providePickAndDrop = false;
  bool availibilty = false;
  bool ageGroup = false;

  final List<String> _gendersList = ['Male', 'Female', 'Other'];

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
  bool _isExpanded = false;
  bool _isExpanded1 = false;
  // bool _isExpanded = false;

  List<bool> isSpecializationList = List.filled(29, false);
  List<bool> isGenderList = List.filled(29, false);

  List selectedSpecialization = [];
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
        title: Text("data"),
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
                  const SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Full Name",
                      hint: "Enter the Name",
                      keyboardType: TextInputType.name,
                      controller: _nameController),
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
                      heading: "Password",
                      hint: "Enter Password",
                      keyboardType: TextInputType.text,
                      controller: _passwordController),
                  TextWidget(
                      heading: "Address",
                      hint: "Enter Address",
                      keyboardType: TextInputType.text,
                      controller: _addressController),
                  DatePickerField(
                    controller: _dobController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                        "Sports Specialization",
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
                            _isExpanded = !_isExpanded;
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
                                          selectedSpecialization.isEmpty
                                              ? "Sports Specialization"
                                              : "You are Selected ${selectedSpecialization.length} Sports Specialization",
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
                      if (_isExpanded)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: SpecializationList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(SpecializationList[index]),
                                value: isSpecializationList[index],
                                selected: isSpecializationList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedSpecialization.contains(
                                          SpecializationList[index])) {
                                        selectedSpecialization
                                            .add(SpecializationList[index]);
                                      }
                                    } else {
                                      if (selectedSpecialization.contains(
                                          SpecializationList[index])) {
                                        selectedSpecialization
                                            .remove(SpecializationList[index]);
                                      }
                                    }
                                    isSpecializationList[index] = value;
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
                        "Preferred Gender for leraning (Male/Female)",
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
                          height: 200,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Preferred Age Group to teach',
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
                              ? 'Select Preferred Age Group to teach'
                              : 'Slide to Set Preferred Age Group to teach'),
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
                      heading: "Something extra ordinary",
                      hint: "Enter Something extra ordinary",
                      keyboardType: TextInputType.name,
                      controller: _extraController),
                  TextWidget(
                      heading: "Specific Skills or Techniques Taught",
                      hint: "Enter Specific Skills",
                      keyboardType: TextInputType.name,
                      controller: _skillController),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Do you provide pick and drop facility?',
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
                                ? 'Providing Pick and Drop'
                                : 'Not Providing Pick and Drop',
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
                      heading: "Charges per Hours",
                      hint: "Enter Charges",
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
