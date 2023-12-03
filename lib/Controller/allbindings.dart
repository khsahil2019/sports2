import 'package:get/get.dart';
import 'package:sports2/Controller/authCotroller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
