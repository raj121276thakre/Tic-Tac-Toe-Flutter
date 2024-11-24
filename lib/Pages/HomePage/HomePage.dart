import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tik_tac_toe_multiplayer/Components/PrimaryButtonWithIcon.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Controller/ProfileController.dart';
import 'package:tik_tac_toe_multiplayer/Pages/GamePage/SinglePlayer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TIC TAC TOE", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Theme.of(context).colorScheme.primary
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("With Multiplayer" , style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color:   Theme.of(context).colorScheme.secondary
                ),),
              ],
            ),
            SizedBox(height: 30,),
            SvgPicture.asset(
              IconsPath.appLogo,
              width: 200,
            ),
            SizedBox(height: 80,),
            PrimaryButtonWithIcon(
              buttonText: 'Single Player',
              onTap: () {
                Get.toNamed("/singlePlayer");
              },
              iconPath: IconsPath.userIcon,
            ),
            SizedBox(height: 40,),
            PrimaryButtonWithIcon(
              buttonText: 'Multi Player',
              onTap: () {
               Get.toNamed("/room");
              },
              iconPath: IconsPath.groupIcon,
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              //Info
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset(IconsPath.infoIcon),
                ),
              ),

              //game
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset(IconsPath.gameIcon),
                ),
              ),

              //github
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset(IconsPath.githubIcon),
                ),
              ),

              //youtube
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset(IconsPath.youtubeIcon),
                ),
              ),


            ],)
            
            
          ],
        ),
      ),
    );
  }
}
