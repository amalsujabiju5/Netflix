import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenfastLaugh extends StatelessWidget {
  const ScreenfastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    //when the page is launched from here the data is coming
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (state.isError) {
          return const Center(
            child: Text("Error While Fetching Data"),
          );
        } else if (state.videoList.isEmpty) {
          return Text("Error Video List Empty");
        } else {
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(10, (index) {
              return VideoListItem(index: index);
            }),
          );
        }
      },
    )));
  }
}
