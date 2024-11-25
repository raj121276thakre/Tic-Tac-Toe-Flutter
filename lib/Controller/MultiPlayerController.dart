import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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
      String roomId, List<String> gameValue, int index, bool isXturn) async {
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
  }
}
