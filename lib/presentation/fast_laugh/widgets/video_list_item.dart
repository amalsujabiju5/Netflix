import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.volume_off),
                      color: kWhiteColor,
                      iconSize: 30,
                    )),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://images.indianexpress.com/2020/05/mohanlal-movies-759.jpg'),
                      ),
                    ),
                    VideoActionsWidget(
                        title: 'LOL', icon: Icons.emoji_emotions),
                    VideoActionsWidget(title: 'My List ', icon: Icons.add),
                    VideoActionsWidget(title: 'Share', icon: Icons.share),
                    VideoActionsWidget(title: 'Play', icon: Icons.play_arrow)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  //declaring a IconData
  final IconData icon;
  //for title
  final String title;
  const VideoActionsWidget(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}

//widget for video

class FasLaughVideoPlayer extends StatefulWidget {
  const FasLaughVideoPlayer({super.key});

  @override
  State<FasLaughVideoPlayer> createState() => _FastVideoPlayerState();
}

class _FastVideoPlayerState extends State<FasLaughVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
