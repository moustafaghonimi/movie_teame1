import 'package:flutter/material.dart';
import 'package:movie/core/colorApp.dart';
import 'package:movie/models/catogry_models/MoviesResponse.dart';
import 'package:movie/models/catogry_models/ReleaseModel.dart';
import 'package:movie/models/catogry_models/movie.dart';
import 'package:movie/moduels/catogery/MovieViewItem.dart';
import 'package:movie/shared/network/remote/api_Manger.dart';

import '../../repositorie/data_source/remote.dart';

class MoviesListScreen extends StatelessWidget {
  static const String routeName = 'movies list';

  @override
  Widget build(BuildContext context) {
    Repo repo=Repo(baseRepositorie: Remote());
    var genre = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        title: Text('${genre.name}',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
              color: Colors.white),),
        backgroundColor: ColorApp().backgroundColor,
        elevation: 0,
        titleSpacing: 10,
        toolbarHeight: 45,
      ),
      backgroundColor: ColorApp().backgroundColor,
      body: FutureBuilder<Movies>(
        future: repo.baseRepositorie?.getMoviesByList(genre.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error ?? "has error"}',
                  style: TextStyle(color: Colors.white)),
            );
          }
          var moviesResult = snapshot.data?.results ?? [];

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 30),
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.white70,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              );
            },
            itemCount: moviesResult.length,

            itemBuilder: (context, index) {
              return MoviesListItem(moviesResult[index]);
            },);
        },),
    );
  }
}
