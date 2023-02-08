import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 240.0,top: 180),
            child: Stack(
              children: [


                CarouselSlider(
                    items: image,

                    options:
                    CarouselOptions (

                      height: 150,
                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.7,


                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    )
                ),

              ],
            ),
          )
        ]
    );
  }
  List<Widget> image=[
    Image.asset('assets/images/1.jpeg',width: double.infinity,),
    Image.asset('assets/images/2.jpeg'),
    Image.asset('assets/images/3.jpeg'),
    Image.asset('assets/images/2.jpeg'),
  ];
}
