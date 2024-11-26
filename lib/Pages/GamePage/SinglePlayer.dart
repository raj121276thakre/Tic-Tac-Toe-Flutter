import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Controller/SinglePlayerController.dart';

class SinglePlayer extends StatelessWidget {
  const SinglePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    //var playValue = ["X", "", "", "", "", "X", "O", "X", "X"];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    SinglePlayerController singlePlayerController =
        Get.put(SinglePlayerController());

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     SvgPicture.asset(IconsPath.backIcon),
                    //     SizedBox(
                    //       width: 15,
                    //     ),
                    //     Text(
                    //       "Play Game",
                    //       style: Theme.of(context).textTheme.bodyMedium,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 45),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SvgPicture.asset(
                                IconsPath.xIcon,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(IconsPath.wonIcon),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => Text(
                                        "WON : ${singlePlayerController.xScore}"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 45),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SvgPicture.asset(
                                IconsPath.oIcon,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(IconsPath.wonIcon),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => Text(
                                        "WON : ${singlePlayerController.oScore}"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      dashPattern: [10, 10],
                      color: Theme.of(context).colorScheme.primary,
                      strokeWidth: 2,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          width: w,
                          height: w - 33,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Obx(
                            () => GridView.builder(
                                itemCount:
                                    singlePlayerController.playValue.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      singlePlayerController.onClick(index);
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      margin: EdgeInsets.all(0.5),
                                      decoration: BoxDecoration(
                                        color: singlePlayerController
                                                    .playValue[index] ==
                                                "X"
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : singlePlayerController
                                                        .playValue[index] ==
                                                    "O"
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                : singlePlayerController
                                                            .playValue[index] ==
                                                        ""
                                                    ? Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                        //Theme.of(context).colorScheme.secondary,
                                        borderRadius: index == 0
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                              )
                                            : index == 2
                                                ? const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                  )
                                                : index == 6
                                                    ? const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(20))
                                                    : index == 8
                                                        ? const BorderRadius
                                                            .only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20))
                                                        : const BorderRadius
                                                            .only(),
                                      ),
                                      child: Center(
                                          child: singlePlayerController
                                                      .playValue[index] ==
                                                  "X"
                                              ? SvgPicture.asset(
                                                  IconsPath.xIcon,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer,
                                                  width: 45,
                                                )
                                              : singlePlayerController
                                                          .playValue[index] ==
                                                      "O"
                                                  ? SvgPicture.asset(
                                                      IconsPath.oIcon,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primaryContainer,
                                                      width: 50,
                                                    )
                                                  : singlePlayerController
                                                                  .playValue[
                                                              index] ==
                                                          ""
                                                      ? SizedBox()
                                                      : SizedBox()),
                                    ),
                                  );
                                }),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            decoration: BoxDecoration(
                                color: singlePlayerController.isXtime.value
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                singlePlayerController.isXtime.value
                                    ? SvgPicture.asset(
                                        IconsPath.xIcon,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        width: 30,
                                      )
                                    : SvgPicture.asset(
                                        IconsPath.oIcon,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        width: 30,
                                      ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Turn",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        //confetti
        ConfettiWidget(
          confettiController: singlePlayerController.confettiController,
          shouldLoop: false,
          blastDirection: pi / 2,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Colors.green,
            Colors.deepPurple
          ],
          gravity: 0.01,
          emissionFrequency: 0.05,
        )
      ],
    );
  }
}
