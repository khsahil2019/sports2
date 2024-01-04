import 'dart:developer';

import 'package:get/get.dart';
import 'package:sports2/Services/apiService.dart';

import '../Services/app_deeplink.dart';

AuthController authController = AuthController.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Map? user;
  List<dynamic> coaches = [];
  List<dynamic> lenders = [];
  List<dynamic> users = [];

  //Map? reviewList;

  @override
  void onInit() async {
    await AppDeepLinkService.init();
    getCoach();
    getLender();
    getUser();

    super.onInit();
    log("AuthController onInit");
  }

  getCoach() {
    ApiService().CoachData().then((value) => coaches = value);
  }

  getLender() {
    ApiService().LenderData().then((value) => lenders = value);
  }

  getUser() {
    ApiService().UserData().then((value) => users = value);
  }
}
