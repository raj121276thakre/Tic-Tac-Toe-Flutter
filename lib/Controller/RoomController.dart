import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Configs/Messages.dart';
import 'package:tik_tac_toe_multiplayer/Controller/ProfileController.dart';
import 'package:tik_tac_toe_multiplayer/Models/RoomModel.dart';
import 'package:tik_tac_toe_multiplayer/Models/UserModel.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/LobbyPage.dart';
import 'package:uuid/uuid.dart';

class RoomController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  var uuid = Uuid();
  ProfileController profileController = Get.find();
  RxBool isLoading = false.obs;

  RxString roomCode = "".obs;

  Future<void> createRoom() async {
    isLoading.value = true;
    String id = uuid.v4().substring(0, 8).toUpperCase();
    roomCode.value = id;
    var user = profileController.user.value;

    var player1 = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      image: user.image,
      totalWins: "0",
      role: "admin",
    );

    var newRoom = RoomModel(
      id: id,
      entryFee: "10",
      winningPrize: "100",
      drawMatch: "",
      player1: player1,
    );

    try {
      await db.collection("rooms").doc(id).set(
        newRoom.toJson(),
      );
      Get.to(LobbyPage(roomId : id));
      successMessage("Done");
    } catch (e) {
      errorMessage("Error");
      print(e);
    }
    isLoading.value = false;
  }



}
