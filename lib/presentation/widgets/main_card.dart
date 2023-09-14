import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: (10)),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
