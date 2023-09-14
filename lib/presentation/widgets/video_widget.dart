import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.volume_off),
                color: kWhiteColor,
                iconSize: 20,
              )),
        ),
      ],
    );
  }
}
