import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/LobbyPage.dart';

var pages = [
  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),

  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
  ),
];