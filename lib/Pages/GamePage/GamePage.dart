import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tik_tac_toe_multiplayer/Components/InGameUserCard.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(IconsPath.backIcon),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Play Game",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InGameUserCard(icon: IconsPath.xIcon,),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        SvgPicture.asset(IconsPath.wonIcon),
                        SizedBox(
                          height: 10,
                        ),
                        Text("WON : 12"),
                      ],),
                    )
                  ],
                ),
                Column(
                  children: [
                    InGameUserCard(icon: IconsPath.oIcon,),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        SvgPicture.asset(IconsPath.wonIcon),
                        SizedBox(
                          height: 10,
                        ),
                        Text("WON : 12"),
                      ],),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),



          ],
        ),
      ),
    ));
  }
}
