import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Pages/Auth/AuthPage.dart';
import 'package:tik_tac_toe_multiplayer/Pages/RoomPage/RoomPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pages = [
      // 1
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome1),
            SizedBox(height: 20,),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Most fun game now available on your smartphone device!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),

      // 2
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.welcome2),
            SizedBox(height: 20,),
            Text(
              "Compete",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Play online with your friends and top the leaderboard!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),

      // 3
      Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60,),
            Image.asset(ImagePath.welcome3),
            SizedBox(height: 20,),
            Text(
              "Scoreboard",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Earn points for each game and make your way to top the scoreboard!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            SizedBox(height: 60,),
            OutlinedButton(

                onPressed: () {
                  Get.offAll(const AuthPage());
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    ];
    return Scaffold(
      body: ConcentricPageView(
        colors: [Theme.of(context).colorScheme.surface, Theme.of(context).colorScheme.surface, Theme.of(context).colorScheme.surface,],
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        onFinish: () {
          Get.offAll(const AuthPage());
        },
        itemBuilder: (int index) {
          return pages[index];
        },
      ),
    );
  }
}
