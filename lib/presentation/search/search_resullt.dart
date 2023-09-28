import 'package:amazon/application/Search/search_bloc.dart';
import 'package:amazon/core/colors/colors.dart';
import 'package:amazon/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Replace this with a valid image URL
const imageUrl =
    'https://pbs.twimg.com/media/E_8i0JrVEAEHa7e?format=jpg&name=large';

class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({Key? key}) : super(key: key);

  // Replace this list with your actual list of image URLs
  final List<String> imageUrls = [
    'https://pbs.twimg.com/media/E_8i0JrVEAEHa7e?format=jpg&name=large'
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(SearchMovieEvent(""));
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              "Results",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            MaterialButton(
              color: Color.fromARGB(255, 64, 72, 75),
              onPressed: () {},
              height: 40,
              minWidth: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: const Text(
                "Filters",
                style: TextStyle(
                    color: kbuttonColor,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),

        // List of vertical images

        SizedBox(
          width: 600 * 1.2,
          height: 140, // Adjust the height as needed
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls.length, // Use imageUrls.length
                  itemBuilder: (context, index) {
                    final imageUrl = imageUrls[index];
                    return Padding(
                      padding: const EdgeInsets.all(10), // Adjust spacing
                      child: Stack(children: [
                        Container(
                          width: 200, // Adjust the width as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/jailer.jpg'),
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
              Container(
                width: 200,
                padding: const EdgeInsets.all(10),
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Jailer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
