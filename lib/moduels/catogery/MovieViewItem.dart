import 'package:flutter/material.dart';
import 'package:movie/models/catogry_models/movie.dart';
import 'package:provider/provider.dart';


import '../../models/TopReated.dart';
import '../../provider/myProvider.dart';
import '../movie_detiels_screen/movie_detiels.dart';

class MoviesListItem extends StatelessWidget {
  static const String routeName = 'movies list';
  Results moviesResult;
  MoviesListItem(this.moviesResult);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Myprovider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 95,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              provider.result_ID = moviesResult.id??0;
              print(provider.result_ID);
              Navigator.pushNamed(context, MovieDetiels.routeName,
                  arguments: moviesResult);
            },
            child: moviesResult.backdropPath == null
                ? Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.height * 0.22,
              child: Icon(
                Icons.error_outline,
                size: 35,
                color: Colors.white,
              ),
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500'
                    '${moviesResult.backdropPath}',
                fit: BoxFit.cover,
                width: 150,
                height: 100,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  moviesResult.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  moviesResult.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  moviesResult.overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
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
