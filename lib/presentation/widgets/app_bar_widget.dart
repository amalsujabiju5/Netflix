import 'package:amazon/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.title});
  //this is for the title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Padding(padding: EdgeInsets.all(10)),
      const SizedBox(height: 20),
      Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
      ),
      Spacer(),
      const Icon(Icons.cast, color: Colors.white, size: 30),
      const SizedBox(
        width: 15,
      ),
      const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 120, 16, 8),
        child: Icon(
          Icons.account_circle,
          color: Color.fromARGB(255, 254, 119, 119),
          size: 42,
        ),
      ),
      kwidth,
    ]);
  }
}
