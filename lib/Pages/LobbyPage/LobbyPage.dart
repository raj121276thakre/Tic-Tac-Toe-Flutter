import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Components/PrimaryButton.dart';
import 'package:tik_tac_toe_multiplayer/Components/UserCard.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Pages/GamePAge/GamePage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/Widgets/PricingArea.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/Widgets/RoomInfo.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconsPath.backIcon),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Play With Private Room",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RoomInfo(roomCode: "1235467"),
              SizedBox(
                height: 40,
              ),
              PricingArea(),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserCard(),
                  UserCard(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  buttonText: "Start Game",
                  onTap: () {
                    Get.to(() => GamePage());
                  }),

            ],
          ),
        ),
      ),
    ));
  }
}
