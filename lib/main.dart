import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/mainpage/screen_main_page.dart';

//the future function is given because of the app should only work after the ConfigureInjection
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NetFlix',
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: backgroundColor,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.white),
                bodyText2: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}
