import 'package:flutter/material.dart';
import 'package:movie/moduels/catogery/MovieViewScreen.dart';
import 'package:movie/provider/myProvider.dart';
import 'package:provider/provider.dart';

import 'moduels/bottomNavigaterBar_home_screen/bottomNavigaterBar_home_screen.dart';
import 'moduels/catogery/catogery_screen_UI.dart';
import 'moduels/home/home_screen_UI.dart';
import 'moduels/movie_detiels_screen/movie_detiels.dart';
import 'moduels/search/search_Screen_UI.dart';
import 'moduels/watchList/watchList_Screen_UI.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Myprovider(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavigaterBar_home_screen.routeName,
      routes: {
        BottomNavigaterBar_home_screen.routeName: (context) =>
            BottomNavigaterBar_home_screen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        CatogeryScreen.routeName: (context) => CatogeryScreen(),
        WatchListScreen.routeName: (context) => WatchListScreen(),
        MovieDetiels.routeName: (context) => MovieDetiels(),
        MoviesListScreen.routeName: (context) => MoviesListScreen()
      },
    );
  }
}
