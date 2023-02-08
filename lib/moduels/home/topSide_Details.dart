import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/topSide.dart';
import 'new_relase_details.dart';

class TopSide_Details extends StatelessWidget {
late Results results;

TopSide_Details(this.results);

@override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    List<Widget> image=[
      Image.network(
        'https://image.tmdb.org/t/p/original${results.posterPath!}',
        width: w * .26,
        height: h * 0.17,
        fit: BoxFit.cover,
      )
    ];
    print(image.length);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/original${results.backdropPath!}',
              width:double.infinity,
              height: h * 0.24,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 115),
              child: Text(
                results.title??' ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Text(
                results.releaseDate??' ',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 65.0),
          child: Icon(
            Icons.play_circle,
            color: Colors.white,
            size: 80,
          ),
        )),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10, top: 80),
        //   child: NewRelaseItems(
        //     h * 0.22,results),
        // ),
      ],
    );
  }

}
