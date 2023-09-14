import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';

import '../../../core/constants.dart';
import 'title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,

        //here we are using the  LiStViewSeperatesd
//wrapping with bloc
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("Error while getting data"),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text("List is Empty"),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        imageUrl: '$imageAppendUrl${movie.posterPath}',
                        title: movie.title ?? 'No title provided');
                  },
                  separatorBuilder: (ctx, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

// creating a stateless widget for the images that are showing

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),

        //this is the circle avatar for the play button

        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: KblackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
