import 'package:amazon/core/constants.dart';
import 'package:amazon/presentation/widgets/app_bar_widget.dart';

import 'package:amazon/presentation/widgets/continue_watching_widget.dart';
import 'package:amazon/presentation/widgets/main_card.dart';

import 'package:amazon/presentation/widgets/main_title.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//to save the bool value declaring valueNotifier

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // here  i had wrapped notificationListner
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  //checking the if condition

                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.only(top: 50),
                            height: 250,
                            width: 900,
                            child: Column(children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/prime.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTitle(title: ""),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Continue Watching",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                kheight,

                                // This is the code for the image
                                continueWatchingWidget(),

                                kheight,
                                Row(
                                  children: const [
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text(
                                      "Prime",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                    kwidth,
                                    Text(
                                      "- Latest movies >",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),

                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: LimitedBox(
                                    maxHeight: 150,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                          10, (index) => HomeMovies()),
                                    ),
                                  ),
                                )
                              ]),
                        ),

                        //fourth row
                        kheight,
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "Prime",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            kwidth,
                            Text(
                              "- Movies in Malyalam >",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: LimitedBox(
                            maxHeight: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  List.generate(10, (index) => HomeMovies()),
                            ),
                          ),
                        ),
                        kheight,
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "Prime",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            kwidth,
                            Text(
                              "- Tamil movies >",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: LimitedBox(
                            maxHeight: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  List.generate(10, (index) => HomeMovies()),
                            ),
                          ),
                        ),
                        kheight,
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              "Prime",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            kwidth,
                            Text(
                              "- Amazon Orginal series >",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: LimitedBox(
                            maxHeight: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children:
                                  List.generate(10, (index) => MainCard()),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    scrollNotifier.value == true
                        ? Container(
                            child: AppBarWidget(title: ""),
                          )
                        : kheight
                  ],
                ),
              );
            }));
  }
}

/// this , i had created for showing the images in the homePage
class HomeMovies extends StatelessWidget {
  const HomeMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: 210,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/rdx.jpg'))),
        )
      ],
    );
  }
}
