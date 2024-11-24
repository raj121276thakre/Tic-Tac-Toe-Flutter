import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:tik_tac_toe_multiplayer/Configs/Messages.dart';
import 'package:tik_tac_toe_multiplayer/Models/RoomModel.dart';

class LobbyController extends GetxController {
  final db = FirebaseFirestore.instance;

  void copyRoomCode(String roomCode) {
    FlutterClipboard.copy(roomCode)
        .then((value) => successMessage('copied'));
  }

  Stream<RoomModel> getRoomDetails(String roomId) {
    return db
        .collection("rooms")
        .doc(roomId)
        .snapshots()
        .map((event) => RoomModel.fromJson(
              event.data()!,
            ));
  }
}
