import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';

class PricingArea extends StatelessWidget {
  final String entryPrice;
  final String winningPrice;
  const PricingArea({super.key, required this.entryPrice, required this.winningPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Entry fee
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary),
              child: const Row(
                children: [
                  Text("Entry Fee"),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
              ],
            ),
//:
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox(width: 10,),
                  Text(entryPrice.toString()),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),

        // second row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Entry fee
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary),
              child: Row(
                children: [
                  Text("Winning Coins"),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
              ],
            ),
//:
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Row(
                children: [
                  SvgPicture.asset(IconsPath.coinIcon),
                  SizedBox(width: 10,),
                  Text(winningPrice.toString()),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
