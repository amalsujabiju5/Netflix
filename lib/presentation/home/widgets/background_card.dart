import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    //here the container is used because to give the big image of UI
    //use stack for overalaying image with any thing like button inside an image
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 450,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(KMainImage))),
        ),

        //Row for the buttons
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                _PlayButton(),
                const CustomButtonWidget(title: "Info", icon: Icons.info)
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: KblackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(
              fontSize: 20,
              color: KblackColor,
            ),
          ),
        ));
  }
}
