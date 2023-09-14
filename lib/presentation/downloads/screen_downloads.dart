import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    //this is for the size of the sccreen

    return Scaffold(
        //here the AppBarWidget is called and wrapped with a prefered size
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: //the list view is used to enable the scrolling
            ListView.separated(
                padding: EdgeInsets.all(10),
                itemBuilder: (ctx, index) => _widgetList[index],
                separatorBuilder: (ctx, index) => SizedBox(
                      height: 25,
                    ),
                itemCount: _widgetList.length));
  }
}

//creating a  stateless widget for section which includes "Introducing downloads and we wll"

class Section2 extends StatelessWidget {
  //creating a list of images

  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadImage());
    });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadImage());

    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introdcing Downloads for You",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        //Kheight is used to give a space and it is initialised on constants
        kHeight,
        const Text(
          "We'll download a perzonalized selection of\n movies and shows for you, so ther's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),

        //changing the sized box to blockbuilder
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: Center(
                //is loading is used to show the loading
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.35,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                          //container for the three displays
                          DownloadsImageWidget(
                            imageList:
                                '$imageAppendUrl${state.downloads[0].posterPath}',
                            margin: EdgeInsets.only(
                              left: 170,
                            ),
                            angle: 25,
                            size: Size(size.width * 0.38, size.width * 0.55),
                          ),
                          DownloadsImageWidget(
                            imageList:
                                '$imageAppendUrl${state.downloads[1].posterPath}',
                            margin: EdgeInsets.only(
                              right: 170,
                            ),
                            angle: -20,
                            size: Size(size.width * 0.35, size.width * 0.55),
                          ),
                          DownloadsImageWidget(
                            imageList:
                                '$imageAppendUrl${state.downloads[2].posterPath}',
                            radius: 5,
                            margin: EdgeInsets.only(bottom: 12),
                            size: Size(size.width * 0.4, size.width * 0.6),
                          )
                        ],
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}

//creating the section 3 for the buttons

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttonColorBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "Setup",
                style: TextStyle(
                    color: kbuttonColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
              color: kbuttonColorWhite,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                "see What You Can Download",
                style: TextStyle(
                    color: KblackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Kwidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Kwidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      required this.size,
      required this.margin,
      required this.imageList,
      this.angle = 0,
      this.radius = 10});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageList)),
              )),
        ),
      ),
    );
  }
}
