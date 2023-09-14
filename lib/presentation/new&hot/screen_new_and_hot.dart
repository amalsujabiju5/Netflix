import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new&hot/widgets/evryones_watching_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

import '../../application/downloads/downloads_bloc.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: const Text("New & Hot"),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              //Kwidth is the constant given for the sized box in Core/constants
              Kwidth,
              //container is used for the avatar(profile)
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              Kwidth,
            ],
            //for the two tabs
            bottom: TabBar(
              //is scrollable is used to avoid the fading of letters to the side
              isScrollable: true,
              labelColor: KblackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(30)),
              tabs: const [
                Tab(
                  text: "🍿 Comming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(
              // key: Key('coming_Soon'),
              ),
          //  _buildEveryonesWatching()
        ]),
      ),
    );
  }
}

// //this is for the page
// Widget _buildComingSoon() {
//   //this mediaquery is used for taking the screenSize

//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
//   );
// }

Widget _buildEveryonesWatching() {
  return ListView.builder(
      itemCount: 10, itemBuilder: (BuildContext context, index) => SizedBox());
  //const EveryonesWatchingWidget());
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const HotAndNewEvent.loadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading Coming soon List"),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("comming soon list is empty"),
          );
        } else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];

// if the movie is is null
                if (movie.id == null) {
                  return const SizedBox();
                }
                //for the date
                final _date = DateTime.parse(movie.releaseDate!);
                final formatedDate = DateFormat.yMMMd('en_US').format(_date);
                print(formatedDate);
                return ComingSoonWidget(
                  id: movie.id.toString(),
                  day: movie.releaseDate.toString().split('-')[1],
                  month: formatedDate.substring(0, 3),
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  description: movie.overview ?? 'No description',
                );
              });
        }
      },
    );
  }
}
