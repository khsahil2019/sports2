import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports2/AuthScreen/signIn.dart';
import 'package:sports2/Screens/home.dart';
import 'package:sports2/Screens/homeScreen.dart';
import 'package:path/path.dart' as path;

import 'dart:io';
import 'package:sports2/helper/show_loading.dart';
import 'package:sports2/helper/snackbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  BuildContext? get context => null;

  final baseUrl = "easyresearch.in";

  final _header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  final storage = FlutterSecureStorage();

  // Future<Map?> RegisterCoach(
  //     String username,
  //     String email,
  //     String mobile,
  //     String address,
  //     String exp,
  //     String dob,
  //     List selectedList,
  //     String country,
  //     String gender,
  //     List preGender,
  //     List daySchedule,
  //     String time,
  //     String endtime,
  //     List ageGroup,
  //     String extra,
  //     String skill,
  //     String state,
  //     String city,
  //     String location,
  //     List dropPick,
  //     String charges,
  //     // DateTime dateTime,
  //     String pincode) async {
  //   showLoading();
  //   var client = http.Client();
  //   Uri uri = Uri.https(baseUrl, 'sports/api/coach_signup3.php');
  //   log("uri: " + uri.toString());

  //   try {
  //     var _body = json.encode({
  //       'name': username,
  //       'email': email,
  //       'number': mobile,
  //       'address': address,
  //       'exp_level': exp,
  //       'dob': dob,
  //       'sport_speciality': selectedList,
  //       'country': country,
  //       'gender': gender,
  //       'pref_gender': preGender,
  //       'day_schedule': daySchedule,
  //       'time_schedule': time,
  //       'endtime_schedule': endtime,
  //       'age_group': ageGroup,
  //       'extra': extra,
  //       'specific_skills': skill,
  //       'state': state,
  //       'city': city,
  //       'location': location,
  //       'pickdrop_facility': dropPick,
  //       'charges_per_hour': charges,
  //       // 'date': dateTime.toIso8601String(),
  //       'pincode': pincode,
  //     });
  //     log("body: " + _body);
  //     var response = await client.post(uri, headers: _header, body: _body);
  //     log("Response Status Code: ${response.statusCode}");
  //     log("Response Body: ${response.body}");
  //     Map<String, dynamic> _res = jsonDecode(response.body);

  //     log("response: " + _res.toString());

  //     log("status code: " + response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       dismissLoadingWidget();

  //       if (_res["status"] == 1) {
  //         String token = _res['token'];
  //         await storage.write(key: 'token', value: token);
  //         log("Successfully Register as a Coach");
  //         showSnakbar("Congratulation !", "Register successful");
  //         Get.to(() => Home());
  //       } else {
  //         log("Mobile Number Or Email already registered");
  //         showSnakbar(
  //             "Try Again !", "Mobile Number or Email already registered");
  //       }
  //     }

  //     return null;
  //   } on SocketException catch (e) {
  //     dismissLoadingWidget();

  //     log("no internet catch: " + e.toString());
  //     return null;
  //   } catch (e) {
  //     dismissLoadingWidget();

  //     log("error catch: " + e.toString());
  //     return null;
  //   }
  // }

  Future<Map?> RegisterCoach(
    String username,
    String email,
    String mobile,
    String password,
    String address,
    String exp,
    String dob,
    List selectedList,
    String country,
    String gender,
    List preGender,
    List daySchedule,
    String time,
    String endtime,
    List ageGroup,
    String extra,
    String skill,
    String state,
    String city,
    String location,
    List dropPick,
    String charges,
    String pincode,
    String userType,
    // File image, // Add this parameter for the image
  ) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/coach_signup3.php');
    log("uri: " + uri.toString());

    try {
      var request = http.MultipartRequest('POST', uri);

      request.fields.addAll({
        'name': username,
        'email': email,
        'number': mobile,
        'password': password,
        'address': address,
        'exp_level': exp,
        'dob': dob,
        'sport_speciality': selectedList.toString(),
        'country': country,
        'gender': gender,
        'pref_gender': preGender.toString(),
        'day_schedule': daySchedule.toString(),
        'time_schedule': time,
        'endtime_schedule': endtime,
        'age_group': ageGroup.toString(),
        'extra': extra,
        'specific_skills': skill,
        'state': state,
        'city': city,
        'location': location,
        'pickdrop_facility': dropPick.toString(),
        'charges_per_hour': charges,
        'pincode': pincode,
        'usertype': userType,
      });

      // if (image != null) {
      //   request.files.add(
      //     await http.MultipartFile.fromPath(
      //       'image', // The name of the image field in your API
      //       image.path,
      //     ),
      //   );
      // }

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      Map<String, dynamic> _res = jsonDecode(responseString);

      log("response: " + _res.toString());

      log("status code: " + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();

        if (_res["status"] == 1) {
          String token = _res['token'];
          await storage.write(key: 'token', value: token);
          log("Successfully Register as a Coach");
          showSnakbar("Congratulation !", "Register successful");
          Get.to(() => Home());
        } else {
          log("Mobile Number Or Email already registered");
          showSnakbar(
            "Try Again !",
            "Mobile Number or Email already registered",
          );
        }
      }

      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();

      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();

      log("error catch: " + e.toString());
      return null;
    }
  }

  /******************************************************************************/

/******************************************************************************/

  Future<Map?> RegisterSportsman(
    String username,
    String email,
    String mobile,
    String password,
    String address,
    String dob,
    String userType,
    String gender,
    List preferredSport,
    String skillLevel,
    String aim,
    File image,
  ) async {
    showLoading();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://easyresearch.in/sports/api/student_signup.php'),
    );

    // Add text fields (non-file data) to the request
    request.fields['name'] = username;
    request.fields['email'] = email;
    request.fields['number'] = mobile;
    request.fields['password'] = password;
    request.fields['address'] = address;
    request.fields['dob'] = dob;
    request.fields['usertype'] = userType;
    request.fields['gender'] = gender;
    request.fields['pref_sport'] =
        preferredSport.toString(); // Convert list to string if necessary
    request.fields['skill_level'] = skillLevel;
    request.fields['aim'] = aim;

    // Add the image file to the request
    var imageStream = http.ByteStream(image.openRead());
    var length = await image.length();
    var multipartFile = http.MultipartFile(
      'image',
      imageStream,
      length,
      filename: path.basename(image.path), // Use the basename of the file path
    );
    request.files.add(multipartFile);

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      Get.offAll(() => signinScreen());
      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      Map<String, dynamic> _res = jsonDecode(response.body);

      // Your handling of the response data here...

      dismissLoadingWidget();
      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();
      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();
      log("error catch: " + e.toString());
      return null;
    }
  }

/******************************************************************************/
  static Future<Map<String, dynamic>?> loginUser(
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("https://easyresearch.in/sports/api/all_login.php"),
        body: json.encode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            json.decode(response.body.toString());

        List<dynamic> dataList = responseBody['data'];
        log("DataList : " + dataList.toString());

        // Print specific data from the 'data' field
        for (var data in dataList) {
          log('ID: ${data['id']}');
          log('Name: ${data['name']}');
          log('Email: ${data['email']}');
          log('Image: ${data['image']}');
          log('Number: ${data['number']}');
          log('Password: ${data['password']}');
          log('Address: ${data['address']}');
          log('Dob: ${data['dob']}');
          log('UserType: ${data['usertype']}');
          log('Gender: ${data['gender']}');
          log('Preferred Sport: ${data['pref_sport']}');
          log('Skill Level: ${data['skill_level']}');
          log('Aim: ${data['aim']}');
          // Add other fields as needed
        }
        log("response Body " + responseBody['data'][0]["email"].toString());
        // Get.to(() => Home());
        Get.to(() => Home(), arguments: responseBody['data'][0]);
        return json.decode(response.body);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

/******************************************************************************/

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Check if the token exists in SharedPreferences
    return prefs.getString('jwt_token') != null;
    // You can add further checks or token validations as per your implementation
  }

  Future<void> uploadImage(File imageFile) async {
    const url =
        'https://easyresearch.in/sports/api/file2.php'; // Replace with your PHP upload endpoint
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Attach the image file as a file part to the request
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      var response = await request.send();
      log(response.toString());
      if (response.statusCode == 200) {
        print('Image uploaded successfully through Api');
      } else {
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

/******************************************************************************/
  Future<List<dynamic>> CoachData() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/fetch_coach.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        // if ( query!=null) {
        //     results = results.where((element) => element.)
        //   }
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return [];
        }
      }

      return [];
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }
  /******************************************************************************/

  Future<List<dynamic>> LenderData() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/fetch_lender.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        // if ( query!=null) {
        //     results = results.where((element) => element.)
        //   }
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return [];
        }
      }

      return [];
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }

  /*****************************************************************************/

  Future<List<dynamic>> UserData() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/all_details.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        // if ( query!=null) {
        //     results = results.where((element) => element.)
        //   }
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return [];
        }
      }

      return [];
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }

  /*****************************************************************************/
}
