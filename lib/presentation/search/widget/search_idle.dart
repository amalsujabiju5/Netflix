import 'package:amazon/core/constants.dart';
import 'package:flutter/material.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      kheight,
      Row(
        children: const [
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Genres",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10), // Adjust spacing as needed
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Action and Adventure",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Anime",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Comedy",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Documentary",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Drama",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Fantasy",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),

      //fourth row
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Horror",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 57,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 64, 72, 75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "International",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
