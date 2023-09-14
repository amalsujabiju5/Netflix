import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    required this.PosterList,
    super.key,
  });

  final List<String> PosterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: "Top 10 Tv Showa In India Today"),
        kHeight,

        //here the container is using because in the UI the movies are arranged in a container
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              PosterList.length,
              (index) => NumberCard(
                index: index,
                imageUrl: PosterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
