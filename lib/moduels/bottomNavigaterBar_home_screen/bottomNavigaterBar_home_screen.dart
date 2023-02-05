import 'package:flutter/material.dart';
import 'package:movie/core/colorApp.dart';
import 'package:movie/moduels/home/home_screen_UI.dart';

import '../catogery/catogery_screen_UI.dart';
import '../search/search_Screen_UI.dart';
import '../watchList/watchList_Screen_UI.dart';

class BottomNavigaterBar_home_screen extends StatefulWidget {
  static const String routeName = 'bottomBar';

  @override
  State<BottomNavigaterBar_home_screen> createState() =>
      _BottomNavigaterBar_home_screenState();
}

class _BottomNavigaterBar_home_screenState
    extends State<BottomNavigaterBar_home_screen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorApp().bottomBarSelectedIconColor,
        onTap: (index) {
          currentIndex=index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          bottomBaricon(Icon(Icons.home), 'HOME'),
          bottomBaricon(Icon(Icons.search), 'SEARCH'),
          bottomBar('assets/images/catogery_icon.png', 'BROWSE'),
          bottomBaricon(Icon(Icons.collections_bookmark_outlined), 'WATCHLIST'),
        ],
      ),
      body: Tabs[currentIndex],
    );
  }

  List<Widget> Tabs = [
    HomeScreen(),
    SearchScreen(),
    CatogeryScreen(),
    WatchListScreen(),
  ];

  BottomNavigationBarItem bottomBar(String imgName, String label) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(imgName)),
      label: label,
      backgroundColor: ColorApp().bottomBarColor,
    );
  }

  BottomNavigationBarItem bottomBaricon(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
      backgroundColor: ColorApp().bottomBarColor,

    );
  }
}
