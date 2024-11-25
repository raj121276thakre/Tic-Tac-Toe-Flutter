import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Models/RoomModel.dart';
import 'package:tik_tac_toe_multiplayer/Models/UserModel.dart';

class MultiPlayerController extends GetxController {
  final db = FirebaseFirestore.instance;
  ConfettiController confettiController = ConfettiController(duration: Duration(seconds: 2));

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map((event) {
      final data = event.data();
      return RoomModel.fromJson(data!);
    });
  }

  Future<void> updateData(String roomId, List<String> gameValue, int index,
      bool isXturn, RoomModel roomData) async {
    List<String> oldValue = gameValue;

    if (isXturn) {
      if (oldValue[index] == "") {
        oldValue[index] = "X";
        print(oldValue);
        await db.collection("rooms").doc(roomId).update({
          "gameValue": oldValue,
          "isXturn": false,
        });
      }
    } else if (!isXturn) {
      if (oldValue[index] == "") {
        oldValue[index] = "O";
        print(oldValue);
        await db.collection("rooms").doc(roomId).update({
          "gameValue": oldValue,
          "isXturn": true,
        });
      }
    }
    checkWinner(oldValue, roomData);
  }

  void checkWinner(List<String> playValue, RoomModel roomData) {
    // Horizontal win
    if (playValue[0] == playValue[1] &&
        playValue[0] == playValue[2] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0], roomData);
    } else if (playValue[3] == playValue[4] &&
        playValue[3] == playValue[5] &&
        playValue[3] != "") {
      WinnerDialog(playValue[3], roomData);
    } else if (playValue[6] == playValue[7] &&
        playValue[6] == playValue[8] &&
        playValue[6] != "") {
      WinnerDialog(playValue[6], roomData);
    }

    // Vertical win
    else if (playValue[0] == playValue[3] &&
        playValue[0] == playValue[6] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0], roomData);
    } else if (playValue[1] == playValue[4] &&
        playValue[1] == playValue[7] &&
        playValue[1] != "") {
      WinnerDialog(playValue[1], roomData);
    } else if (playValue[2] == playValue[5] &&
        playValue[2] == playValue[8] &&
        playValue[2] != "") {
      WinnerDialog(playValue[2], roomData);
    }

    // Diagonal win
    else if (playValue[0] == playValue[4] &&
        playValue[0] == playValue[8] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0], roomData);
    } else if (playValue[2] == playValue[4] &&
        playValue[2] == playValue[6] &&
        playValue[2] != "") {
      WinnerDialog(playValue[2], roomData);
    }

    // Draw condition
    else if (!playValue.contains("")) {
      WinnerDialog("none", roomData);
    }
  }

  Future<dynamic> WinnerDialog(String winner, RoomModel roomData) {
    confettiController.play();
    //  scoreCalculate(winner);
    return Get.defaultDialog(
        barrierDismissible: false,
        title: winner == "none" ? "Match Draw" : "Winner is $winner",
        backgroundColor: Colors.white,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: winner == "none"
              ? Column(
                  children: [
                    SvgPicture.asset(
                      IconsPath.loseIcon,
                      width: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Match Draw",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "You Both played well",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            resetPlayValue(roomData);
                          },
                          child: Text("Play Again"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed("/home");
                          },
                          child: Text("Exit"),
                        ),
                      ],
                    )
                  ],
                )
              : Column(
                  children: [
                    SvgPicture.asset(
                      IconsPath.wonIcon,
                      width: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Congratulations",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "$winner won the match",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            playAgain(winner, roomData);
                          },
                          child: Text("Play Again"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed("/home");
                          },
                          child: Text("Exit"),
                        ),
                      ],
                    )
                  ],
                ),
        ));
  }

  Future<void> playAgain(String wonTeam, RoomModel roomData) async {
    if (wonTeam == "X") {
      String totalWins = roomData.player1!.totalWins!;
      int totalWin = int.parse(totalWins);
      totalWin = totalWin + 1;
      var user = roomData.player1!;
      UserModel newPlayer1 = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        image: user.image,
        totalWins: totalWin.toString(),//totalwins changed
        role: user.role,
        totalCoins: user.totalCoins,

      );

      await db.collection("rooms").doc(roomData.id).update({
        "gameValue": ["", "", "", "", "", "", "", "", ""],
        "player1": newPlayer1.toJson(),
      });
      Get.back();

    } else if (wonTeam == "O") {
      String totalWins = roomData.player2!.totalWins!;
      int totalWin = int.parse(totalWins);
      totalWin = totalWin + 1;
      var user = roomData.player2!;
      UserModel newPlayer2 = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        image: user.image,
        totalWins: totalWin.toString(),//totalwins changed
        role: user.role,
        totalCoins: user.totalCoins,

      );

      await db.collection("rooms").doc(roomData.id).update({
        "gameValue": ["", "", "", "", "", "", "", "", ""],
        "player2": newPlayer2.toJson(),
      });
      Get.back();
    }
  }

  Future<void>  resetPlayValue(RoomModel roomData) async{
    await db.collection("rooms").doc(roomData.id).update({
      "gameValue": ["", "", "", "", "", "", "", "", ""],

    });
    Get.back();
  }



}








