import 'package:flutter/material.dart';

import '../../../models/newReleases.dart';

class NewRelaseItems extends StatelessWidget {
  var imageHight;
  Results results;



  NewRelaseItems(this.imageHight,this.results);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original${results.posterPath!}',
                    width: w * .26,
                    height: h * 0.17,
                    fit: BoxFit.cover,
                  )
              ),
            ],
          ),
          Image.asset(
            'assets/images/bookmark.png',
          )
        ],
      ),
    );
  }
}
