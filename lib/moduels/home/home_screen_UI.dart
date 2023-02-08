import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/colorApp.dart';
import 'package:movie/models/newReleases.dart';
import 'package:movie/models/topSide.dart';
import 'package:movie/moduels/home/recommende_details.dart';
import 'package:movie/moduels/home/recommended_Viewr.dart';
import 'package:movie/moduels/home/topSide_Details.dart';
import 'package:movie/moduels/home/topSide_Viewr.dart';
import 'package:movie/shared/network/remote/api_Manger.dart';

import '../../models/TopReated.dart';
import 'newRelaseViewr.dart';
import 'new_relase_details.dart';

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
          ////////////////////////
          // Top Side section
          TopSideViewr(),
          // FutureBuilder<TopSide>(
          //   future: ApiManger().getTOPside(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //     if (snapshot.hasError) {
          //       return Center(
          //         child: Column(
          //           children: [
          //             Text(
          //               'Something Has Error',
          //               style: TextStyle(color: Colors.black),
          //             ),
          //             TextButton(
          //                 onPressed: () {
          //                   setState(() {});
          //                 },
          //                 child: Text('Try Again')),
          //           ],
          //         ),
          //       );
          //     }
          //     var results = snapshot.data?.results ?? [];
          //     // print(results.length);
          //     return   CarouselSlider.builder(itemCount:results.length , itemBuilder: (context, index, realIndex) {
          //       return  TopSide_Details(results[index]);
          //     }, options:
          //     CarouselOptions(
          //       height: h*0.35,
          //       aspectRatio: 16/9,
          //       viewportFraction: 0.9,
          //       initialPage: 0,
          //       enableInfiniteScroll: true,
          //       reverse: false,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: true,
          //       enlargeFactor: 0.3,
          //
          //       // onPageChanged: callbackFunction,
          //       scrollDirection: Axis.horizontal,
          //     )
          //     );
          //
          //     //   Container(
          //     //   width: double.infinity,
          //     //   height: h * 0.35,
          //     //   child: ListView.builder(
          //     //     addAutomaticKeepAlives:true ,
          //     //       scrollDirection: Axis.horizontal,
          //     //       itemBuilder: (context, index) {
          //     //         return TopSide_Details(results[index]);
          //     //       },
          //     //       itemCount: results.length),
          //     // );
          //   },
          // ),

          /////////////////////////////////////////////////////////
          // new releases
          //////////////////////////////////////////

          NewReleaseViewr(),
          // new releases here
          // Container(
          //   color: ColorApp().graycolor,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(4.0),
          //         child: Text(
          //           '  New Releases',
          //           style: TextStyle(
          //               fontSize: 15,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //           textAlign: TextAlign.start,
          //         ),
          //       ),
          //
          //       FutureBuilder<NewReleases>(
          //         future: ApiManger().getNewRelases(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return Center(child: CircularProgressIndicator());
          //           }
          //           if (snapshot.hasError) {
          //             return Center(
          //               child: Column(
          //                 children: [
          //                   Text(
          //                     'Something Has Error',
          //                     style: TextStyle(color: Colors.black),
          //                   ),
          //                   TextButton(
          //                       onPressed: () {
          //                         setState(() {});
          //                       },
          //                       child: Text('Try Again')),
          //                 ],
          //               ),
          //             );
          //           }
          //           var results = snapshot.data?.results ?? [];
          //           return Container(
          //             width: double.infinity,
          //             // width: double.infinity,
          //             height: h * 0.19,
          //             child: ListView.builder(
          //
          //                 scrollDirection: Axis.horizontal,
          //                 itemBuilder: (context, index) {
          //                   return NewRelaseItems(h * 0.20,results[index]);
          //                 },
          //                 itemCount: results.length),
          //           );
          //         },
          //       ),
          //
          //
          //
          //     ],
          //   ),
          // ),
          //recommended
          /////////////////////////////////////////////////////////


          SizedBox(
            height: h / 30,
          ),
          /////////////////////////////////////////////////
          //// recommended
          RecommendedViewr(),
          // Container(
          //   color: ColorApp().graycolor,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(4.0),
          //         child: Text(
          //           '  Recommended',
          //           style: TextStyle(
          //               fontSize: 15,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //           textAlign: TextAlign.start,
          //         ),
          //       ),
          //       FutureBuilder<TopReated>(
          //         future: ApiManger().getTopReated(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return Center(child: CircularProgressIndicator());
          //           }
          //           if (snapshot.hasError) {
          //             return Center(
          //               child: Column(
          //                 children: [
          //                   Text(
          //                     'Something Has Error',
          //                     style: TextStyle(color: Colors.black),
          //                   ),
          //                   TextButton(
          //                       onPressed: () {
          //                         setState(() {});
          //                       },
          //                       child: Text('Try Again')),
          //                 ],
          //               ),
          //             );
          //           }
          //           // if (snapshot.data?.success == 'error') {
          //           //   return Center(
          //           //     child: Column(
          //           //       children: [
          //           //         Text(snapshot.data?. ?? 'style: TextStyle(color: Colors.black)'),
          //           //         TextButton(onPressed: () {}, child: Text('Try Again')),
          //           //       ],
          //           //     ),
          //           //   );
          //           // }
          //           var results = snapshot.data?.results ?? [];
          //           return Container(
          //             width: double.infinity,
          //             height: h * 0.24,
          //             child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemBuilder: (context, index) {
          //                   return Recommended_Details(results[index]);
          //                 },
          //                 itemCount: results.length),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          /////////////////////////////////////////////////
        ],
      ),
    );
  }
}
