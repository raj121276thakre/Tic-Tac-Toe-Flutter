import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tik_tac_toe_multiplayer/Components/PrimaryButtonWithIcon.dart';
import 'package:tik_tac_toe_multiplayer/Configs/AssetsPath.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SvgPicture.asset(IconsPath.cameraIcon),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: SvgPicture.asset(IconsPath.galleryIcon),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Enter your name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You can change these details later  from profile page. don’t worry",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              PrimaryButtonWithIcon(
                  buttonText: "Save",
                  onTap: () {},
                  iconPath: IconsPath.saveIcon),
            ],
          ),
        ),
      ),
    );
  }
}
