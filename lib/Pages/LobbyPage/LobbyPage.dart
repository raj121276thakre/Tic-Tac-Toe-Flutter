import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Components/PrimaryButton.dart';
import 'package:tik_tac_toe_multiplayer/Components/UserCard.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Configs/Messages.dart';
import 'package:tik_tac_toe_multiplayer/Controller/LobbyController.dart';
import 'package:tik_tac_toe_multiplayer/Controller/RoomController.dart';
import 'package:tik_tac_toe_multiplayer/Pages/GamePAge/MultiPlayer.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/Widgets/PricingArea.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/Widgets/RoomInfo.dart';

class LobbyPage extends StatelessWidget {
  final String roomId;

  const LobbyPage({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    LobbyController lobbyController = Get.put(LobbyController());
    RoomController roomController = Get.put(RoomController());
    RxInt timer = 5.obs;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(IconsPath.backIcon),
                  ),
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
              RoomInfo(roomCode: roomId),
              SizedBox(
                height: 40,
              ),
              StreamBuilder(
                stream: lobbyController.getRoomDetails(roomId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.player1Status == "ready" &&
                        snapshot.data!.player2Status == "ready") {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        Get.to(MultiPlayer(roomId: roomId,));
                      });
                    } else {
                      // errorMessage("Player2Status: ${snapshot.data!.player2Status}");
                      // print("Player2Status: ${snapshot.data!.player2Status}");

                    }


                    return Column(
                      children: [
                        PricingArea(
                          entryPrice: snapshot.data!.entryFee!,
                          winningPrice: snapshot.data!.winningPrize!,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UserCard(
                              imageUrl: snapshot.data!.player1!.image! ?? defaultImage,
                              name: snapshot.data!.player1!.name!,
                              coins: "00",
                              status: snapshot.data!.player1Status ?? "waiting",
                            ),
                            snapshot.data!.player2 == null
                                ? Container(
                                    child: Text("Waiting for Other"),
                                    width: w / 2.6,
                                  )
                                : UserCard(
                                    imageUrl: snapshot.data!.player2!.image! ?? defaultImage,
                                    name: snapshot.data!.player2!.name!,
                                    coins: "00",
                                    status: snapshot.data!.player2Status ??
                                        "waiting",
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        snapshot.data!.player1!.email ==
                                roomController.users.value.email
                            ? PrimaryButton(
                                buttonText: "Start Game",
                                onTap: () async {
                                  lobbyController.updatePlayer1Status(
                                    roomId,
                                    "ready",
                                  );
                                },
                              )
                            : snapshot.data!.player2Status == "waiting"
                                ? PrimaryButton(
                                    buttonText: "Ready",
                                    onTap: () async {
                                      lobbyController.updatePlayer2Status(
                                        roomId,
                                        "ready",
                                      );
                                    },
                                  )
                                : snapshot.data!.player2Status == "ready"
                                    ? PrimaryButton(
                                        buttonText: "Waiting for start",
                                        onTap: () async {
                                          lobbyController.updatePlayer2Status(
                                            roomId,
                                            "waiting",
                                          );
                                        },
                                      )
                                    : SizedBox()
                      ],
                    );
                  } else {
                    return Icon(Icons.error);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
