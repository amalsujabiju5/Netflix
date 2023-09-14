import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(width: 40, height: 200),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -23,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 140,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
