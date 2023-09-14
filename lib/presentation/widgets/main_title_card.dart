import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  MainTitleCard({super.key, required this.title, required this.PosterList});

//making one variable for title
  final String title;
  final List<String> PosterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,

        //here the container is using because in the UI the movies are arranged in a container
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              PosterList.length,
              (index) => MainCard(
                imageUrl: PosterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}
