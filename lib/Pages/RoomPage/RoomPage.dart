import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Components/PrimaryButton.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/LobbyPage.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
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
              height: 40,
            ),
            Text(
              "Enter Private Code And Join With Your Friend",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                filled: true,
                hintText: "Enter Code Here",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(buttonText: "Join now", onTap: () {}),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create private room",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Spacer(),
            PrimaryButton(
                buttonText: "Create Room",
                onTap: () {
                  Get.to(LobbyPage());
                }),

          ],
        ),
      ),
    ));
  }
}
