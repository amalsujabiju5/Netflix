import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String day;
  final String month;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.day,
    required this.month,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                  letterSpacing: 2,
                ),
              ),
              Text(
                day,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              kHeight,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notification_add_outlined,
                        title: "Remind Me",
                        IconSize: 20,
                        TextSize: 12,
                      ),
                      Kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        IconSize: 20,
                        TextSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
              kHeight,
              Text(
                "Coming On $day $month",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                overflow: TextOverflow.clip,
                style: TextStyle(color: kGreyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
