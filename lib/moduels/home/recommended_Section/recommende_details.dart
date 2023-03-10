import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/TopReated.dart';
import 'package:movie/models/favorite.dart';
import 'package:movie/shared/network/remote/firestore_utiles.dart';
import 'package:provider/provider.dart';

import '../../../core/colorApp.dart';
import '../../../provider/myProvider.dart';
import '../../movie_detiels_screen/movie_detiels.dart';

class Recommended_Details extends StatefulWidget {
  Results results;

  Recommended_Details(this.results);

  @override
  State<Recommended_Details> createState() => _Recommended_DetailsState();
}

class _Recommended_DetailsState extends State<Recommended_Details> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var provider = Provider.of<Myprovider>(context);



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  provider.result_ID = widget.results.id!;
                  print(provider.result_ID);
                  Navigator.pushNamed(context, MovieDetiels.routeName,
                      arguments: widget.results);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: ColorApp().itemRecommendColor.withOpacity(.30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/original${widget.results.posterPath!}',
                              width: w * .26,
                              height: h * 0.14,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18,
                              ),
                              Text(
                                widget.results.voteAverage.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: w * .26,
                              height: h / 30,
                              child: Text(
                                widget.results.title!,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(widget.results.releaseDate ?? '',
                                style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white70,
                                    wordSpacing: 5)),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
