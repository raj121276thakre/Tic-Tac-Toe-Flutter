import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tik_tac_toe_multiplayer/Components/InGameUserCard.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';
import 'package:tik_tac_toe_multiplayer/Controller/MultiPlayerController.dart';
import 'package:tik_tac_toe_multiplayer/Models/RoomModel.dart';

class MultiPlayer extends StatelessWidget {
  final String roomId;

  const MultiPlayer({super.key, required this.roomId});

  @override
  Widget build(BuildContext context) {
    MultiPlayerController multiPlayerController =
        Get.put(MultiPlayerController());
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: SvgPicture.asset(IconsPath.micIcon),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: StreamBuilder(
              stream: multiPlayerController.getRoomDetails(roomId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  RoomModel? roomData = snapshot.data;
                  var playValue = roomData!.gameValue;
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //X
                          Column(
                            children: [
                              InGameUserCard(
                                  icon: IconsPath.xIcon,
                                  name: roomData.player1!.name!,
                                  imageUrl: roomData.player1!.image!),
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
                                    Text(
                                        "WON : ${roomData.player1!.totalWins!}"),
                                  ],
                                ),
                              )
                            ],
                          ),
                          //O
                          Column(
                            children: [
                              InGameUserCard(
                                icon: IconsPath.oIcon,
                                name: roomData.player2!.name!,
                                imageUrl: roomData.player2!.image!,
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
                                    Text(
                                        "WON : ${roomData.player2!.totalWins!}"),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
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
                          child: GridView.builder(
                              itemCount: 9,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    multiPlayerController.updateData(roomId,
                                        playValue!, index, roomData.isXturn!, roomData);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    margin: EdgeInsets.all(0.5),
                                    decoration: BoxDecoration(
                                      color: playValue?[index] == "X"
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : playValue?[index] == "O"
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                              : playValue?[index] == ""
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
                                                  topRight: Radius.circular(20),
                                                )
                                              : index == 6
                                                  ? const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(20))
                                                  : index == 8
                                                      ? const BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))
                                                      : const BorderRadius
                                                          .only(),
                                    ),
                                    child: Center(
                                        child: playValue?[index] == "X"
                                            ? SvgPicture.asset(
                                                IconsPath.xIcon,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                width: 45,
                                              )
                                            : playValue?[index] == "O"
                                                ? SvgPicture.asset(
                                                    IconsPath.oIcon,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    width: 50,
                                                  )
                                                : playValue?[index] == ""
                                                    ? SizedBox()
                                                    : SizedBox()),
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //..........
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            decoration: BoxDecoration(
                                color: roomData.isXturn == true
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                roomData.isXturn == true
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
                          SizedBox(height: 50,),
                        ],
                      )
                      //..........
                    ],
                  );
                } else {
                  return Text("No Data");
                }
              },
            )),
          ),
        ));
  }
}
