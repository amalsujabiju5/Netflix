// this is the code for the top portion of downlods page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
//this variable is for giving the title
  final String title;

  @override
  Widget build(BuildContext context) {
    //here the row is used becuse for tthe app the top portion items is in a row
    return Row(children: [
      Text(
        title,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      Icon(
        Icons.cast,
        color: Colors.white,
        size: 30,
      ),
      //Kwidth is the constant given for the sized box in Core/constants
      Kwidth,
      //container is used for the avatar(profile)
      Container(
        width: 30,
        height: 30,
        color: Colors.blue,
      ),
      Kwidth,
    ]);
  }
}
