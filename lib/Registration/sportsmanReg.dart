import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports2/Services/apiService.dart';
import 'package:sports2/Widgets/dobPicker.dart';
import 'package:sports2/Widgets/dropDown.dart';
import 'package:sports2/Widgets/textField.dart';
import 'package:sports2/helper/theme.dart';

class SportsmanRegistrationScreen extends StatefulWidget {
  @override
  _SportsmanRegistrationScreenState createState() =>
      _SportsmanRegistrationScreenState();
}

class _SportsmanRegistrationScreenState
    extends State<SportsmanRegistrationScreen> {
  void initState() {
    super.initState();
  }

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<String> _gendersList = ['Male', 'Female', 'Other'];
  String? _selectedGender;
  bool _isPreferredSports = false;
  List<bool> isPreferredSportList = List.filled(29, false);
  List selectedPreferredSport = [];
  List PreferredSportList = [
    'Football',
    'Basketball',
    'Tennis',
    'Swimming',
    'Others'
  ];
  String? _selectedLevel;
  final List<String> _levelList = ['Beginner', 'Intermediate', 'Advanced'];
  final TextEditingController _aimController = TextEditingController();

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
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Student"),
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
                  TextWidget(
                      heading: "Email",
                      hint: "Enter email",
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController),
                  TextWidget(
                      heading: "Password",
                      hint: "Enter Password",
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController),
                  TextWidget(
                      heading: "Contact Number",
                      hint: "Enter contact No",
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _mobileController),
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
                        "Preferred Sport(s) for Learning",
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
                            _isPreferredSports = !_isPreferredSports;
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
                                          selectedPreferredSport.isEmpty
                                              ? "Select Preferred Sport(s) for Learning"
                                              : "You are Selected ${selectedPreferredSport.length} Preferred Sports",
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
                      if (_isPreferredSports)
                        AnimatedContainer(
                          //width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          duration: Duration(milliseconds: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: PreferredSportList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                autofocus: true,
                                checkColor: Colors.white,
                                title: Text(PreferredSportList[index]),
                                value: isPreferredSportList[index],
                                selected: isPreferredSportList[index],
                                dense: true,
                                onChanged: (value) {
                                  setState(() {
                                    if (value!) {
                                      if (!selectedPreferredSport.contains(
                                          PreferredSportList[index])) {
                                        selectedPreferredSport
                                            .add(PreferredSportList[index]);
                                      }
                                    } else {
                                      if (selectedPreferredSport.contains(
                                          PreferredSportList[index])) {
                                        selectedPreferredSport
                                            .remove(PreferredSportList[index]);
                                      }
                                    }
                                    isPreferredSportList[index] = value;
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
                    heading: 'Skill Level', subHeading: "Select Level",
                    options: _levelList,
                    selectedValue:
                        _selectedLevel, // Set your initial selected value
                    onChanged: (String? value) {
                      setState(() {
                        _selectedLevel = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextWidget(
                      heading: "Goals or Objectives for Learning the Sport",
                      hint: "Enter Goals or Objectives for Learning the Sport",
                      keyboardType: TextInputType.name,
                      controller: _aimController),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Press");
                          sendSportsmanRegDataToServer(context);
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

  // void sendSportsmanRegDataToServer(BuildContext context) {
  //   ApiService().RegisterSportsman("sahil", "sahlsbaihb", "62387", "hardoi",
  //       "09-89-2019", "Male", ["selectedPreferredSport"], "Begginer", "Aim");
  // }
  void sendSportsmanRegDataToServer(BuildContext context) {
    ApiService().RegisterSportsman(
      _nameController.text,
      _emailController.text,
      _mobileController.text,
      _passwordController.text,
      _addressController.text,
      _dobController.text,
      "std",
      _selectedGender.toString(),
      selectedPreferredSport,
      _selectedLevel.toString(),
      _aimController.text,
      _imageFile!,
    );
  }
}
