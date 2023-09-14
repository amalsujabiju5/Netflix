import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/core/debounce/debouncer.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  //this is for making a delay in search
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    //bloc implementation in UI
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(
              backgroundColor: const Color.fromARGB(255, 74, 71, 71),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                //null check

                if (value.isEmpty) {
                  return;
                }
                //this will create a slight delay in search because the value is called in debouncer
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                });
              },
            ),
          ),
          kHeight,

          //this is the code for the screens idle screen and result screen
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              //if there is nothing in the searchList then the screen will be idle
              if (state.searchResultList.isEmpty) {
                return const SearchIdleWidget();

                //if there is value in the SearchResult then the Screen will be SearchResult
              } else {
                return const SearchResultWidget();
              }
            },
          )),
        ],
      )),
    );
  }
}
