import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Models/RoomModel.dart';

class MultiPlayerController extends GetxController {
  final db = FirebaseFirestore.instance;

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db.collection("rooms").doc(roomId).snapshots().map((event) {
      final data = event.data();
      return RoomModel.fromJson(data!);
    });
  }

  Future<void> updateData(
      String roomId, List<String> gameValue, int index, bool isXturn) async
  {
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
    }
    else  if (!isXturn) {
      if (oldValue[index] == "") {
        oldValue[index] = "O";
        print(oldValue);
        await db.collection("rooms").doc(roomId).update({
          "gameValue": oldValue,
          "isXturn": true,
        });
      }
    }
    checkWinner(oldValue);
  }

  void checkWinner(List<String> playValue) {
    // Horizontal win
    if (playValue[0] == playValue[1] &&
        playValue[0] == playValue[2] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0]);
    } else if (playValue[3] == playValue[4] &&
        playValue[3] == playValue[5] &&
        playValue[3] != "") {
      WinnerDialog(playValue[3]);
    } else if (playValue[6] == playValue[7] &&
        playValue[6] == playValue[8] &&
        playValue[6] != "") {
      WinnerDialog(playValue[6]);
    }

    // Vertical win
    else if (playValue[0] == playValue[3] &&
        playValue[0] == playValue[6] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0]);
    } else if (playValue[1] == playValue[4] &&
        playValue[1] == playValue[7] &&
        playValue[1] != "") {
      WinnerDialog(playValue[1]);
    } else if (playValue[2] == playValue[5] &&
        playValue[2] == playValue[8] &&
        playValue[2] != "") {
      WinnerDialog(playValue[2]);
    }

    // Diagonal win
    else if (playValue[0] == playValue[4] &&
        playValue[0] == playValue[8] &&
        playValue[0] != "") {
      WinnerDialog(playValue[0]);
    } else if (playValue[2] == playValue[4] &&
        playValue[2] == playValue[6] &&
        playValue[2] != "") {
      WinnerDialog(playValue[2]);
    }

    // Draw condition
    else if (!playValue.contains("")) {
      WinnerDialog("none");
    }
  }


  Future<dynamic> WinnerDialog(String winner) {
  //  scoreCalculate(winner);
    return Get.defaultDialog(
        barrierDismissible: false,
        title: winner == "none" ? "Match Draw" : "Winner is $winner",
        backgroundColor: Colors.white,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: winner == "none" ? Column(
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
                     //resetGame();
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
          )  :  Column(
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
                      //resetGame();
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



}
