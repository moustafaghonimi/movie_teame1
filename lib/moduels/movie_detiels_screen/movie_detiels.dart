import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/moduels/movie_detiels_screen/triler_video/youtube.dart';
import 'package:provider/provider.dart';

import '../../core/colorApp.dart';
import '../../models/TopReated.dart';
import '../../models/favorite.dart';
import '../../provider/myProvider.dart';
import '../../shared/componant/ui_utlis.dart';
import '../../shared/network/remote/firestore_utiles.dart';
import 'moreLikeThise_Viewr.dart';

class MovieDetiels extends StatefulWidget {
  static const String routeName = 'movieDetiels';

  @override
  State<MovieDetiels> createState() => _MovieDetielsState();
}

class _MovieDetielsState extends State<MovieDetiels> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Myprovider>(context);

    var result = ModalRoute.of(context)!.settings.arguments as Results;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          result.title ?? '',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: ColorApp().backgroundColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          color: ColorApp().backgroundColor,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${result.backdropPath!}',
                      width: double.infinity,
                      height: h * 0.24,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result.title ?? ' ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        result.releaseDate ?? ' ',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              provider.result_ID = result.id!;
                              print(provider.result_ID);
                              Navigator.pushNamed(
                                  context, MovieDetiels.routeName,
                                  arguments: result);
                            },
                            child: Container(
                              width: w * .28,
                              height: h * 0.20,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://image.tmdb.org/t/p/original${result.posterPath!}',
                                width: w * .28,
                                height: h * 0.22,
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
                            ),
                          ),
                          Image.asset('assets/images/bookmark.png')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: w * 0.60,
                          child: Text(
                            result.overview!,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              result.voteAverage.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shadowColor: Colors.grey,
                                animationDuration: Duration(seconds: 1)),
                            onPressed: () {
                              Favorite favorite = Favorite(
                                  filem_id: result.id ?? 0,
                                  filmeName: result.title ?? "",
                                  backdropPath: result.backdropPath ?? '',
                                  voteAverage: result.voteAverage ?? 0,
                                  releaseDate: result.releaseDate ?? '',
                                  isFavorite: true);
                              showMasage(
                                  context, "Film is Add to Watch List", "OK",
                                  () {
                                hideMassage(context);
                              });
                              addFavoriteToFirestore(favorite)
                                  .then((value) => (value) {})
                                  .catchError((error) {
                                print(error);
                                hideMassage(context);
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Add To Watch List ',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.featured_play_list_rounded,
                                  color: Colors.orange,
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
/////////////////////////////////////////////
              MoreLikeThis_Viewr(),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Text('in update',style: TextStyle(color: Colors.red,fontSize: 20),);
                    // Navigator.pushNamed(context, YoutubePlayerTriler.routeName,
                    //     arguments: result);
                  },
                  child: Text(
                    'prese here to show triler',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
