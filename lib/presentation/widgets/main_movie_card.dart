import 'package:flutter/material.dart';

class MainMovieCard extends StatelessWidget {
  const MainMovieCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 200,
      height:
          200, // Make the height and width the same to create a square shape
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/jailer.jpg'),
                ),
              ),
            ),
          ),
          Container(
            // Add a background color for text
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
