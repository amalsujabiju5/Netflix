import 'package:amazon/application/Search/search_bloc.dart';
import 'package:amazon/core/colors/colors.dart';

import 'package:amazon/domain/core/di/injectable.dart';
import 'package:amazon/presentation/main_page/screen_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (ctx) => getIt<SearchBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prime Video',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: backgroundColor,
            backgroundColor: Colors.black,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white))),
        home: ScreenMainPage(),
      ),
    );
  }
}
