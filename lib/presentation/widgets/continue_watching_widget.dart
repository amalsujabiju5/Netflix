import 'package:amazon/presentation/search/search_resullt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class continueWatchingWidget extends StatelessWidget {
  const continueWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => SizedBox(
            width: 600 * 1.2,
            height: 140, // Adjust the height as needed
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10), // Adjust spacing
                        child: Stack(children: [
                          Container(
                            width: 200, // Adjust the width as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/minnalmurali.jpg'),
                              ),
                            ),
                          ),
                          const Positioned(
                              bottom: 0,
                              left: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 23,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: Icon(
                                    CupertinoIcons.play_fill,
                                    color: Colors.black,
                                  ),
                                ),
                              ))
                        ]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
