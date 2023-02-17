import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/catogry_models/ReleaseModel.dart';
import 'package:movie/models/catogry_models/movie.dart';
import 'package:movie/moduels/catogery/MovieViewScreen.dart';
import 'package:movie/shared/network/remote/api_Manger.dart';

import '../../repositorie/data_source/remote.dart';
import '../../shared/styles/colors.dart';

class CategoryItem extends StatelessWidget {
  Genres genres;

  CategoryItem(this.genres);

  @override
  Widget build(BuildContext context) {
    Repo repo=Repo(baseRepositorie: Remote());
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MoviesListScreen.routeName, arguments: genres);

      },
      child: Stack(
        children: [
          FutureBuilder<Movies>(
            future: repo.baseRepositorie?.getMoviesByList(genres.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error ?? "has error"}',
                      style: TextStyle(color: Colors.white)),
                );
              }
              return CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500"
                      "${snapshot.data!.results!.elementAt(4).backdropPath}",
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
            },
          ),
          Container(color: Color.fromARGB(112, 112, 112, 100)),
          Center(
            child: Text(genres.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
