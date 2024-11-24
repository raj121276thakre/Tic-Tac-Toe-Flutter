
import 'package:tik_tac_toe_multiplayer/Models/UserModel.dart';

class RoomModel {
  String? id;
  String? entryFee;
  String? winningPrize;
  String? drawMatch;
  UserModel? player1;
  UserModel? player2;

  RoomModel({this.id, this.entryFee, this.winningPrize, this.drawMatch, this.player1, this.player2});

  RoomModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["entryFee"] is String) {
      entryFee = json["entryFee"];
    }
    if(json["winningPrize"] is String) {
      winningPrize = json["winningPrize"];
    }
    if(json["drawMatch"] is String) {
      drawMatch = json["drawMatch"];
    }
    if(json["player1"] is Map) {
      player1 = json["player1"] == null ? null : UserModel.fromJson(json["player1"]);
    }
    if(json["player2"] is Map) {
      player2 = json["player2"] == null ? null : UserModel.fromJson(json["player2"]);
    }
  }

  static List<RoomModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(RoomModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["entryFee"] = entryFee;
    _data["winningPrize"] = winningPrize;
    _data["drawMatch"] = drawMatch;
    if(player1 != null) {
      _data["player1"] = player1?.toJson();
    }
    if(player2 != null) {
      _data["player2"] = player2?.toJson();
    }
    return _data;
  }
}

