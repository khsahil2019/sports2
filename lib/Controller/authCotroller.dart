import 'dart:developer';

import 'package:get/get.dart';
import 'package:sports2/Services/apiService.dart';

AuthController authController = AuthController.instance;
// FirebaseAuth auth = FirebaseAuth.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Map? user;
  List<dynamic> coaches = [];
  List<dynamic> lenders = [];
  // List<dynamic> dealsList = [];
  // List<dynamic> reviewList = [];
  // Map? indexPageList;
  // Map? logoList;
  // Map? privacyList;
  // Map? reviewList;
  //Map? reviewList;
// Map? fulldata;
  @override
  void onInit() {
    // TODO: implement onInit
    getCoach();
    getLender();
    // deleteAccount();
    // getPrivacy();
    // getExoticpalce();
    // getIndexPage();
    // getDestinationWeeding();
    // getDeals();
    // getlogo();
    // getReview();
    super.onInit();
    log("AuthController onInit");
  }

  getCoach() {
    ApiService().CoachData().then((value) => coaches = value);
  }

  getLender() {
    ApiService().LenderData().then((value) => lenders = value);
  }

  // getLogout2() {
  //   ApiService().logout2().then((value) => null);
  // }

  // deleteAccount() {
  //   ApiService().deleteAccount().then((value) => null);
  // }
  //  void signOut() async {
  //   ApiService.();
  // }
  // getReview() {
  //   ApiService().review().then((value) => reviewList = value);
  // }

  // getExoticpalce() {
  //   ApiService().exoticLocation().then((value) => exoticplaceList = value);
  // }

  // getReview() {
  //   ApiService().Review().then((value) => reviewList = value);
  // }

  // getDestinationWeeding() {
  //   ApiService()
  //       .destinationWedding()
  //       .then((value) => destinationWeddingList = value);
  // }

  // getDeals() {
  //   ApiService().deals().then((value) => dealsList = value);
  // }

  // getIndexPage() {
  //   ApiService().indexPage().then((value) => indexPageList = value);
  // }

  // getlogo() {
  //   ApiService().logo().then((value) => logoList = value);
  // }

  // void Signout() {
  //   authController.user!.remove("user");
  // }
}
