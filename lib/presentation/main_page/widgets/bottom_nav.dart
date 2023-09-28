import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//value notifier

ValueNotifier<int> indexChageNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChageNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            //styling
            backgroundColor: Colors.black,
            currentIndex: newIndex,
            onTap: (index) {
              indexChageNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromRGBO(98, 116, 142, 1),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(
                color: Color.fromRGBO(112, 130, 155, 0.949)),

            ///icons
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'downloads'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
            ]);
      },
    );
  }
}
