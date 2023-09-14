import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.title,
      required this.icon,
      this.IconSize = 30,
      this.TextSize = 18});
  final IconData icon;
  final String title;
  final double IconSize;
  final double TextSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: IconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: TextSize),
        )
      ],
    );
  }
}
