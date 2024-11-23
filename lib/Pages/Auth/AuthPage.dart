import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Components/PrimaryButtonWithIcon.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Controller/AuthController.dart';
import 'package:tik_tac_toe_multiplayer/Pages/HomePage/HomePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconsPath.appLogo,
                  width: 200,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Please sign in to continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            SizedBox(
              height: 100,
            ),
            PrimaryButtonWithIcon(
              buttonText: 'Login With Google',
              onTap: () {
                authController.login();
               // Get.offAll(const HomePage());
              },
              iconPath: IconsPath.googleIcon,
            )
          ],
        ),
      ),
    );
  }
}
