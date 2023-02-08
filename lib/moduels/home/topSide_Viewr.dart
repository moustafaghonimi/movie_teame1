import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/moduels/home/topSide_Details.dart';

import '../../core/colorApp.dart';
import '../../models/topSide.dart';
import '../../shared/network/remote/api_Manger.dart';

class TopSideViewr extends StatefulWidget {
  @override
  State<TopSideViewr> createState() => _TopSideViewrState();
}

class _TopSideViewrState extends State<TopSideViewr> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return FutureBuilder<TopSide>(
      future: ApiManger().getTOPside(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Check Internet And Press Try Again',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Icon(
                  Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
                  color: Colors.white,
                  size: 70,
                ),
                TextButton(
                    onHover: (value) {
                      return activate();
                    },
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Try Again',
                        style: TextStyle(
                            color: ColorApp().bottomBarSelectedIconColor,
                            fontSize: 14))),
              ],
            ),
          );
        }
        var results = snapshot.data?.results ?? [];
        // print(results.length);
        return CarouselSlider.builder(
            itemCount: results.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                children: [
                  TopSide_Details(results[index]),
                ],
              );
            },
            options: CarouselOptions(
              height: h * 0.35,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,

              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ));

        //   Container(
        //   width: double.infinity,
        //   height: h * 0.35,
        //   child: ListView.builder(
        //     addAutomaticKeepAlives:true ,
        //       scrollDirection: Axis.horizontal,
        //       itemBuilder: (context, index) {
        //         return TopSide_Details(results[index]);
        //       },
        //       itemCount: results.length),
        // );
      },
    );
  }
}
