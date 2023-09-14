import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//key for the value notifier and giving the index 0
ValueNotifier<int> indexChageNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        //this code is for the changing of icons whhen clicked
        valueListenable: indexChageNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChageNotifier.value = index;
            },
            elevation: 0,
            //this is for giving the black color to btm nav
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'downloads')
            ],
          );
        });
  }
}
