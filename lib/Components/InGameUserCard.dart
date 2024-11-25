import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InGameUserCard extends StatelessWidget {
  final String icon;
  final String name;
  final String imageUrl;

  const InGameUserCard({super.key, required this.icon, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    //final h = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            width: w / 2.6,
            height: 150,
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
                  name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      SvgPicture.asset(
                        icon,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        width: 30,
                      ),
                    ],
                  ),
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
                //color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 3)),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
