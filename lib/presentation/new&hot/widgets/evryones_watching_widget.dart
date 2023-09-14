import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Malik",
          style: TextStyle(
              fontSize: 18, letterSpacing: 0, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "Ahammadali Sulaiman is the godfather of Ramadapally, a coastal town in Thiruvananthapuram where Muslims and Christians live together. He prepares to undertake the Hajj pilgrimage in his middle years on the insistence of his Christian wife Roselyn. Ali and his friend Aboobacker, a political leader, are on the verge of fallout over land acquisition from the locals for a harbour project. At the airport, the police arrest Ali under the Terrorist and Disruptive Activities (Prevention) Act (TADA).",
          style: TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(
          url: posterPath,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              IconSize: 25,
              TextSize: 16,
            ),
            Kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              IconSize: 25,
              TextSize: 16,
            ),
            Kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              IconSize: 25,
              TextSize: 16,
            ),
            Kwidth,
          ],
        )
      ],
    );
  }
}
