import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Pages/HomePage/HomePage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/UpdateProfile/UpdateProfile.dart';

class AuthController extends GetxController{

  Future<void> login() async {
    Get.to(UpdateProfile());
  }

  Future<void> updateProfile() async {
    Get.offAll(HomePage());
  }

}