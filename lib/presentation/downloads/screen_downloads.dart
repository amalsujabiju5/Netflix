import 'package:amazon/core/colors/colors.dart';
import 'package:amazon/core/constants.dart';
import 'package:amazon/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "No videos downloaded",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                color: kbuttonColor,
                onPressed: () {},
                height: 40,
                minWidth: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Find videos to download",
                  style: TextStyle(
                      color: kblackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              ),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Centering the text within the row
                children: const [
                  Text(
                    "Auto Downloads: On .",
                    style: TextStyle(color: Colors.white),
                  ),
                  kwidth, // Adding some space between the texts
                  Text(
                    "Manage",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
