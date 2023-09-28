import 'package:amazon/core/constants.dart';
import 'package:amazon/presentation/search/search_resullt.dart';
import 'package:amazon/presentation/search/widget/search_idle.dart';

import 'package:amazon/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Find"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            kheight,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoTextField(
                padding: const EdgeInsets.all(13),
                placeholder: 'Actor, title, or genre',
                placeholderStyle: TextStyle(color: Colors.grey),
                prefix: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                ),
                clearButtonMode: OverlayVisibilityMode.editing,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
            ),
            const SearchIdleWidget(),
            //SearchResultWidget()
          ],
        ),
      ),
    );
  }
}
