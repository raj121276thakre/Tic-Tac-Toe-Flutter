import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
   // final h = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            width: w / 2.6,
            height: 140,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Raj Thakre",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconsPath.coinIcon,
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "23 Coins",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: w / 2.6 / 2 - 50,
          child: Container(
            width: 100,
            height: 100,
            //color: Colors.red,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 3)),
          ),
        ),
      ],
    );
  }
}
