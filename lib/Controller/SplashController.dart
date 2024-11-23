import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Pages/HomePage/HomePage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/Welcome/WelcomePage.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  @override
  void onInit() {
    splashHandle();
    super.onInit();
  }

  Future<void> splashHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    // checking user logged in or not
    if(auth.currentUser==null) {
      Get.offAll(const WelcomePage());
    }else{
      Get.offAll(const HomePage());
    }
  }
}
