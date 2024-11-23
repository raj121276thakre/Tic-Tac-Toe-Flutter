import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Pages/Auth/AuthPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/GamePAge/GamePage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/GamePage/SinglePlayer.dart';
import 'package:tik_tac_toe_multiplayer/Pages/HomePage/HomePage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/RoomPage/RoomPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/LobbyPage/LobbyPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/SplashPage/SplashPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/UpdateProfile/UpdateProfile.dart';
import 'package:tik_tac_toe_multiplayer/Pages/Welcome/WelcomePage.dart';

var pages = [
  GetPage(
    name: "/home",
    page: () => HomePage(),
  ),

  GetPage(
    name: "/room",
    page: () => RoomPage(),
  ),

  GetPage(
    name: "/lobby",
    page: () => LobbyPage(),
  ),

  GetPage(
    name: "/auth",
    page: () => AuthPage(),
  ),

  GetPage(
    name: "/splash",
    page: () => SplashPage(),
  ),

  GetPage(
    name: "/gamePage",
    page: () => GamePage(),
  ),

  GetPage(
    name: "/updateProfile",
    page: () => UpdateProfile(),
  ),

  GetPage(
    name: "/welcome",
    page: () => WelcomePage(),
  ),

  GetPage(
    name: "/singlePlayer",
    page: () => SinglePlayer(),
  ),

];














