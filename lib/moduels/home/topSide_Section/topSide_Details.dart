import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/moduels/movie_detiels_screen/movie_detiels.dart';
import 'package:movie/provider/myProvider.dart';
import 'package:provider/provider.dart';

import '../../../models/TopReated.dart';
import '../../../models/topSide.dart';
import '../newRelease_Section/new_relase_details.dart';

class TopSide_Details extends StatelessWidget {
  late Results results;

  TopSide_Details(this.results);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var provider=Provider.of<Myprovider>(context);

    return SingleChildScrollView(
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              provider.result_ID=results.id!;
              print(provider.result_ID);
              Navigator.pushNamed(context, MovieDetiels.routeName,
                  arguments: results);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                  'https://image.tmdb.org/t/p/original${results.backdropPath!}',
                    width: double.infinity,
                    height: h * 0.24,
                    fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 115),
                  child: Text(
                    results.title ?? ' ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Text(
                    results.releaseDate ?? ' ',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Icon(
              Icons.play_circle,
              color: Colors.white,
              size: 60,
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 85),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    provider.result_ID=results.id!;

                    Navigator.pushNamed(context, MovieDetiels.routeName,
                        arguments: results);
                  },
                  child: Container(
                    width: w * .26,
                    height: h * 0.18,
                    child: CachedNetworkImage(
                      imageUrl:
                      'https://image.tmdb.org/t/p/original${results.posterPath!}',
                        width: w * .26,
                        height: h * 0.18,
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                    ),


                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
