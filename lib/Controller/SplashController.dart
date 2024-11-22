import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/Welcome/WelcomePage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashHandle();
    super.onInit();
  }

  Future<void> splashHandle() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(const WelcomePage());
  }
}
