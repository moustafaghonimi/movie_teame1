import 'package:flutter/material.dart';
import 'package:movie/core/colorApp.dart';
import 'package:movie/moduels/home/recommended_Section/recommended_Viewr.dart';
import 'package:movie/moduels/home/topSide_Section/topSide_Viewr.dart';


import 'newRelease_Section/newRelaseViewr.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      color: ColorApp().backgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          // Top Side section
          TopSideViewr(),
          // new Release
          NewReleaseViewr(),
          SizedBox(
            height: h / 45,
          ),
          //// recommended
          RecommendedViewr(),
        ],
      ),
    );
  }
}
