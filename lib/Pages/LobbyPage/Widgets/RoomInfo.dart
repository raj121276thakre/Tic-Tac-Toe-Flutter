import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Controller/LobbyController.dart';
import 'package:tik_tac_toe_multiplayer/Controller/RoomController.dart';

class RoomInfo extends StatelessWidget {
  final String roomCode;

  const RoomInfo({super.key, required this.roomCode});

  @override
  Widget build(BuildContext context) {
    LobbyController lobbyController = Get.put(LobbyController());
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Generated Room Code"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(10),
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            roomCode,
                            style: TextStyle(
                                fontSize: w/11,
                                letterSpacing: 2.4,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,

                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap:(){
                        lobbyController.copyRoomCode(roomCode);
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary),
                        child: SvgPicture.asset(IconsPath.copyIcon),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Share This Private code with your Friends & Ask Them To Join The Game",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
