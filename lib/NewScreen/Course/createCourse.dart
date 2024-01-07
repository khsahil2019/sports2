import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/Widgets/datePicker.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/Widgets/textField.dart';
import 'package:sports2/helper/theme.dart';

class CreateCourseScreen extends StatefulWidget {
  @override
  _CreateCourseScreenState createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  List<TextEditingController> courseDetailControllers = [
    TextEditingController()
  ];

  void addTextField() {
    setState(() {
      courseDetailControllers.add(TextEditingController());
    });
  }

  void removeTextField() {
    setState(() {
      if (courseDetailControllers.length > 1) {
        courseDetailControllers.removeLast();
      }
    });
  }

  List<TextEditingController> outcomeControllers = [TextEditingController()];
  List<TextEditingController> courseMapControllers = [TextEditingController()];

  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _courseFeesController = TextEditingController();

  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();
  final TextEditingController _monthsController = TextEditingController();

  String? _selectedSport;

  bool providePickAndDrop = false;
  bool availibilty = false;
  bool ageGroup = false;

  final List<String> _sportsList = ['Hockey', 'Cricket', 'BasketBall'];

  final Map<String, bool> _ageGroups = {
    'Kids (6-12)': false,
    'Teenagers (13-18)': false,
    'Young Adults (19-30)': false,
    'Adults (31-50)': false,
    'Seniors (50+)': false,
  };

  List<String> selectedDays = [];
  List<String> selectedAgeGroup = [];

  List prefrredGenderList = ['Male', 'Female', 'Other'];

  bool _isPreferredGender = false;

  List<bool> isSpecializationList = List.filled(29, false);
  List<bool> isFacilitiesList = List.filled(29, false);
  List<bool> isPrefrredGenderList = List.filled(29, false);

  List selectedSpecialization = [];
  List selectedFacilities = [];
  List selectedPreferredGender = [];

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
    List<Widget> programOfferField = courseDetailControllers.map((controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
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
              controller: controller,
              // keyboardType: keyboardType,
              // maxLength: maxLength,
              decoration: const InputDecoration(
                counterText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: "Enter what Course offers using + sign",
                border: InputBorder.none, // Remove the default border
              ),
              style:
                  const TextStyle(fontSize: 16), // Adjust text style if needed
            ),
          ),
          const SizedBox(height: 15),
        ],
      );
      ;
    }).toList();
    List<Widget> programOutcomeField = outcomeControllers.map((controller1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
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
              controller: controller1,
              // keyboardType: keyboardType,
              // maxLength: maxLength,
              decoration: const InputDecoration(
                counterText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: "Enter Outcomes of the course using + sign",
                border: InputBorder.none, // Remove the default border
              ),
              style:
                  const TextStyle(fontSize: 16), // Adjust text style if needed
            ),
          ),
          const SizedBox(height: 15),
        ],
      );
      ;
    }).toList();
    List<Widget> courseMapField = courseMapControllers.map((controller2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
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
              controller: controller2,
              // keyboardType: keyboardType,
              // maxLength: maxLength,
              decoration: const InputDecoration(
                counterText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: "Enter Course map using + sign",
                border: InputBorder.none, // Remove the default border
              ),
              style:
                  const TextStyle(fontSize: 16), // Adjust text style if needed
            ),
          ),
          const SizedBox(height: 15),
        ],
      );
      ;
    }).toList();

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
        title: const Text(
          "Create Course",
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
                      heading: "Course Name",
                      hint: "Enter Course Name",
                      keyboardType: TextInputType.name,
                      controller: _courseNameController),
                  TextWidget(
                      heading: "About",
                      hint: "This cousre is designed for ",
                      keyboardType: TextInputType.emailAddress,
                      controller: _aboutController),
                  CustomDropdown(
                    heading: 'Sports Type',
                    subHeading: "Sport",
                    options: _sportsList,
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
                            _isPreferredGender = !_isPreferredGender;
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
                                          selectedPreferredGender.isEmpty
                                              ? "Select Preferred Gender"
                                              : "Select ${selectedPreferredGender.length} Preferred Gender",
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
                      if (_isPreferredGender)
                        AnimatedContainer(
                          //width: 300,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: const Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: prefrredGenderList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(prefrredGenderList[index]),
                                value: isPrefrredGenderList[index],
                                selected: isPrefrredGenderList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedPreferredGender.contains(
                                          prefrredGenderList[index])) {
                                        selectedPreferredGender
                                            .add(prefrredGenderList[index]);
                                      }
                                    } else {
                                      if (selectedPreferredGender.contains(
                                          prefrredGenderList[index])) {
                                        selectedPreferredGender
                                            .remove(prefrredGenderList[index]);
                                      }
                                    }
                                    isPrefrredGenderList[index] = value;
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
                  buildDatePickerField(
                    controller: _startDateController,
                    context: context,
                    heading: 'Select start Date', // Optional heading
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildDatePickerField(
                    controller: _endDateController,
                    context: context,
                    heading: 'Select End Date', // Optional heading
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextWidget(
                          maxLength: 6,
                          heading: "Hours",
                          hint: "Enter Hours",
                          keyboardType: TextInputType.number,
                          controller: _hoursController,
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Adjust the space between widgets

                      Expanded(
                        child: TextWidget(
                          maxLength: 4,
                          heading: "Days",
                          hint: "Enter Days",
                          keyboardType: TextInputType.number,
                          controller: _daysController,
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Adjust the space between widgets

                      Expanded(
                        child: TextWidget(
                          maxLength: 3,
                          heading: "Months",
                          hint: "Enter Months",
                          keyboardType: TextInputType.number,
                          controller: _monthsController,
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
                                        log(selectedAgeGroup.toString());
                                      } else {
                                        selectedAgeGroup.remove(ageGroup);
                                        log(selectedAgeGroup.toString());
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Course Offering",
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(children: programOfferField),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              addTextField();
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              removeTextField();
                            },
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                      /****************************** Course outcome  *************************/

                      const Text(
                        "Course Outcomes",
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(children: programOutcomeField),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                outcomeControllers.add(TextEditingController());
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (outcomeControllers.length > 1) {
                                  outcomeControllers.removeLast();
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),

                      /********************************  Course outcome    ****************************************/
                      const Text(
                        "Course Content during course",
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(children: courseMapField),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                courseMapControllers
                                    .add(TextEditingController());
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppColors.orange,
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (courseMapControllers.length > 1) {
                                  courseMapControllers.removeLast();
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextWidget(
                      maxLength: 6,
                      heading: "Course Fees",
                      hint: "Enter Course Fees",
                      keyboardType: TextInputType.number,
                      controller: _courseFeesController),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.orangeAccent;
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
                            'Create Course',
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
  //     _courseNameController.text,
  //     "sahil@gmail.og",
  //     "888888",
  //     _passwordController.text,
  //     _addressController.text,
  //     _currentSliderValue.toString(),
  //     _dobController.text,
  //     selectedSpecialization,
  //     _countryName.toString(),
  //     _selectedGender.toString(),
  //     selectedPreferredGender,
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
