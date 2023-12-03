import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:sports2/Screens/homeScreen.dart';

import 'dart:io';

import 'package:sports2/helper/show_loading.dart';
import 'package:sports2/helper/snackbar.dart';

class ApiService {
  BuildContext? get context => null;

  final baseUrl = "easyresearch.in";
  //final baseUrl2 = "kabiatravels.com";
  final _header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  // List<BestDeals> results = [];
  // String fetchUrl = "https://kabiatravels.com/api/Deals.php";
  Future<Map?> RegisterCoach(
      String username,
      String email,
      String mobile,
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
      // DateTime dateTime,
      String pincode) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/coach_signup3.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'name': username,
        'email': email,
        'number': mobile,
        'address': address,
        'exp_level': exp,
        'dob': dob,
        'sport_speciality': selectedList,
        'country': country,
        'gender': gender,
        'pref_gender': preGender,
        'day_schedule': daySchedule,
        'time_schedule': time,
        'endtime_schedule': endtime,
        'age_group': ageGroup,
        'extra': extra,
        'specific_skills': skill,
        'state': state,
        'city': city,
        'location': location,
        'pickdrop_facility': dropPick,
        'charges_per_hour': charges,
        // 'date': dateTime.toIso8601String(),
        'pincode': pincode,
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");
      Map<String, dynamic> _res = jsonDecode(response.body);

      log("response: " + _res.toString());

      log("status code: " + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("Successfully Register as a Coach");
          showSnakbar("Congratulation !", "Register successful");
          Get.to(() => HomeScreen());
        } else {
          log("Mobile Number Or Email already registered");
          showSnakbar(
              "Try Again !", "Mobile Number or Email already registered");
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

  Future<Map?> RegisterSportsman(
    String username,
    String email,
    String mobile,
    String address,
    String dob,
    String gender,
    List preferredSport,
    String skilllevel,
    String aim,
  ) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/student.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'name': username,
        'email': email,
        'number': mobile,
        'address': address,
        'dob': dob,
        'gender': gender,
        'pref_sport': preferredSport,
        'skill_level': skilllevel,
        'aim': aim,
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");
      Map<String, dynamic> _res = jsonDecode(response.body);

      log("response: " + _res.toString());

      log("status code: " + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          Get.to(() => HomeScreen());
          log("Successfully Register as a Sportmans");
          showSnakbar("Congratulation !", "Register successful");
        } else {
          log("Mobile Number Or Email already registered");
          showSnakbar(
              "Try Again !", "Mobile Number or Email already registered");
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

  Future<Map?> RegisterPlaceHolder(
    String username,
    String email,
    String address,
    String mobile,
    String property_description,
    String sizeOfproperty,
    List typeOfproperty,
    List daySchedule,
    String time,
    String endtime,
    List Amenities,
    List safety,
    List pickDrop,
    String charges,
  ) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'sports/api/lender.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'name': username,
        'email': email,
        'address': address,
        'number': mobile,
        'property_desc': property_description,
        'property_size': sizeOfproperty,
        'property_type': typeOfproperty,
        'day_schedule': daySchedule,
        'time_schedule': time,
        'end_time': endtime,
        'facility': Amenities,
        'safety': safety,
        'pickdrop': pickDrop,
        'charges': charges,
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      log("Response Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");
      Map<String, dynamic> _res = jsonDecode(response.body);

      log("response: " + _res.toString());

      log("status code: " + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          Get.to(() => HomeScreen());
          log("Successfully Register as a Lender");
          showSnakbar("Congratulation !", "Register successful");
        } else {
          log("Mobile Number Or Email already registered");
          showSnakbar(
              "Try Again !", "Mobile Number or Email already registered");
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
}
