import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

import 'package:netflix/presentation/home/widgets/number_title_card.dart';

import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext ctx, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator(
                          strokeWidth: 2,
                        );
                      } else if (state.isError) {
                        return const Center(
                            child: Text(
                          "Error while getting data",
                          style: TextStyle(color: Colors.white),
                        ));
                      }

                      ///released past year
                      final _releasedPastYear =
                          state.pastYearMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();

                      //trending
                      final _trending = state.trendingMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();

                      //tense dramas
                      final _tenseDramas = state.tenseDramaMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();

                      //SouthIndian
                      final _southIndian = state.southIndianMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _southIndian.shuffle();

                      //top ten tv

                      final _top10 = state.trendingTvList.map((t) {
                        return '$imageAppendUrl${t.posterPath}';
                      }).toList();
                      _top10.shuffle();

                      return ListView(
                        children: [
                          BackgroundCard(),
                          MainTitleCard(
                              title: "Released in past year",
                              PosterList: _releasedPastYear.sublist(0, 10)),
                          kHeight,
                          MainTitleCard(
                            title: "Trending Now",
                            PosterList: _trending.sublist(0, 10),
                          ),
                          kHeight,
                          NumberTitleCard(
                            PosterList: _top10.sublist(0, 10),
                          ),
                          kHeight,
                          MainTitleCard(
                              title: "Tense Dramas",
                              PosterList: _tenseDramas.sublist(0, 10)),
                          kHeight,
                          MainTitleCard(
                            title: "South Indian Cinemas",
                            PosterList: _southIndian.sublist(0, 10),
                          ),
                          kHeight,
                        ],
                      );
                    },
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: Duration(microseconds: 1000),
                          child: Container(
                            width: double.infinity,
                            height: 90,
                            color: Colors.black12,
                            child: Column(children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://i.redd.it/gj1t3nckxyx61.png',
                                    height: 60,
                                    width: 70,
                                  ),
                                  const Spacer(),
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
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('TV Shows', style: KHomeTitleText),
                                  Text('Movies', style: KHomeTitleText),
                                  Text('Categories', style: KHomeTitleText),
                                ],
                              )
                            ]),
                          ))
                      : kHeight,
                ]),
              );
            }));
  }
}
