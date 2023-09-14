import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});
//////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & Tv'),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchState) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.4,
                  ),
                  itemCount: state.searchResultList.length,
                  itemBuilder: (context, index) {
                    final movie = state.searchResultList[index];
                    return MainCard(imageUrl: movie.PosterImageUrl);
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
