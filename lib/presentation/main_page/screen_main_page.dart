import 'package:amazon/core/colors/colors.dart';
import 'package:amazon/presentation/downloads/screen_downloads.dart';
import 'package:amazon/presentation/home/screen_home.dart';
import 'package:amazon/presentation/main_page/widgets/bottom_nav.dart';
import 'package:amazon/presentation/search/screen_search.dart';

import 'package:amazon/presentation/store/screen_store.dart';
import 'package:flutter/material.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

//making a list of pages

  final _pages = const [
    ScreenHome(),
    ScreenStore(),
    ScreenDownloads(),
    ScreenSearch()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChageNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
