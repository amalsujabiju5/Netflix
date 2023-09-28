import 'package:amazon/core/constants.dart';
import 'package:amazon/presentation/widgets/app_bar_widget.dart';
import 'package:amazon/presentation/widgets/main_card.dart';
import 'package:amazon/presentation/widgets/main_movie_card.dart';
import 'package:amazon/presentation/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//this is for the scroll
ValueNotifier<bool> ScrollNotifier = ValueNotifier(false);

// const imageUrl =
//     "https://upload.wikimedia.org/wikipedia/en/thumb/3/39/Jawan_film_poster.jpg/220px-Jawan_film_poster.jpg";

class ScreenStore extends StatelessWidget {
  const ScreenStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: ScrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            //checking the direction

            if (direction == ScrollDirection.reverse) {
              ScrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              ScrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                      colors: [Color.fromRGBO(185, 172, 55, 1), Colors.black],
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MainTitle(title: ""),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "In the Spotlight",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.yellow,
                          ),
                        ),
                        kheight,

                        // This is the code for the image
                        LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                List.generate(10, (index) => const MainCard()),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Movies In Telugu",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.yellow,
                          ),
                        ),

                        Column(
                          children: [
                            LimitedBox(
                              maxHeight: 136,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => const MainMovieCard(
                                    title: "Rent",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Science Fiction Movies",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.yellow,
                          ),
                        ),
                        kheight,
                        Column(
                          children: [
                            LimitedBox(
                              maxHeight: 136,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => const MainMovieCard(
                                    title: "Rent",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        kheight,
                        const Text(
                          "Rent New Movies",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.yellow,
                          ),
                        ),
                        kheight,
                        Column(
                          children: [
                            LimitedBox(
                              maxHeight: 136,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => const MainMovieCard(
                                    title: "Rent",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        kheight,
                        const Text(
                          "Horror Movies",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.yellow,
                          ),
                        ),
                        kheight,
                        Column(
                          children: [
                            LimitedBox(
                              maxHeight: 136,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => const MainMovieCard(
                                    title: "Rent",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Repeat similar sections for other categories...
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ScrollNotifier.value == true
                  ? Container(
                      child: AppBarWidget(title: "Store"),
                    )
                  : kheight
            ],
          ),
        );
      },
    ));
  }
}
