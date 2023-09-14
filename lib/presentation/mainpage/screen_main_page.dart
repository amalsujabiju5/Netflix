//creating a main page which has all the bottom navigation

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new&hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

//making a list of pages

  final _pages = [
    ScreenHome(),
    ScreenNewandHot(),
    ScreenfastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChageNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
