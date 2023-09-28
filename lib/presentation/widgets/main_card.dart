import 'package:amazon/core/constants.dart';
import 'package:amazon/presentation/search/search_resullt.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 150,
      height: 200,
      child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/moneyheist2.jpg'),
            ),
          )),
    );
  }
}
