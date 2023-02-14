import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/TopReated.dart';
import 'package:provider/provider.dart';

import '../../../core/colorApp.dart';
import '../../../provider/myProvider.dart';
import '../../models/favorite.dart';
import '../../shared/network/remote/firestore_utiles.dart';
import '../movie_detiels_screen/movie_detiels.dart';

class WatchList_Item extends StatefulWidget {
  Favorite favorite;

  WatchList_Item(this.favorite);

  @override
  State<WatchList_Item> createState() => _WatchList_ItemState();
}

class _WatchList_ItemState extends State<WatchList_Item> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var provider = Provider.of<Myprovider>(context);

    return Container(
      width: double.infinity,
      height: h*0.21,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            Row(
              children: [
                InkWell(
                  // onTap: () {
                  //   provider.result_ID = widget.favorite.filem_id??0;
                  //   print(provider.result_ID);
                  //   Navigator.pushNamed(context, MovieDetiels.routeName,
                  //       );
                  // },
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child:CachedNetworkImage(
                                      imageUrl:
                                      'https://image.tmdb.org/t/p/original${widget.favorite.backdropPath??''}',
                                      width: w * .40,
                                      height: h * 0.15,
                                      fit:BoxFit.cover,
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

                                    // Image.network(
                                    //   'https://image.tmdb.org/t/p/original${favorite.backdropPath??''}',
                                    //   width: w * .40,
                                    //   height: h * 0.15,
                                    //   fit: BoxFit.cover,
                                    // )
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: w*0.40,
                                        child: Text(
                                          widget.favorite.filmeName.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        widget.favorite.releaseDate??'',
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white70),
                                      ),
                                      SizedBox(
                                        height: 6,
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
                                            widget.favorite.voteAverage.toString(),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),

                      InkWell(

                        onTap: () {


                          deleteItemFromFireStore(widget.favorite.id);
                          setState(() {

                          });

                        },
                        child: widget.favorite.isFavorite
                            ? Image.asset(
                          'assets/images/bookmark_done.png',
                        )
                            : Image.asset(
                          'assets/images/bookmark.png',
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 3,),
            Divider(
              height: 2,
              color: Colors.white70,
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
