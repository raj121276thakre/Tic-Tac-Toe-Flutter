import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Controller/SplashController.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconsPath.appLogo,
            width: 150,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Tic Tac Toe Multiplayer",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ));
  }
}
