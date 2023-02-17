import 'package:movie/models/TopReated.dart';

import 'package:movie/models/catogry_models/ReleaseModel.dart';

import 'package:movie/models/catogry_models/movie.dart';

import 'package:movie/models/moreLikeThis.dart';

import 'package:movie/models/newReleases.dart';

import 'package:movie/models/searchModel.dart';

import 'package:movie/models/topSide.dart';

import 'package:movie/models/videoResults.dart';

import '../base_Repo.dart';
import 'package:http/http.dart' as http;


class LocalDB implements BaseRepositorie{
  @override
  Future<ReleaseModel> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<MoreLikeThis> getMoreLikeThise(num movie_id) {
    // TODO: implement getMoreLikeThise
    throw UnimplementedError();
  }

  @override
  Future<Movies> getMoviesByList(int genreId) {
    // TODO: implement getMoviesByList
    throw UnimplementedError();
  }

  @override
  Future<NewReleases> getNewRelases() {
    // TODO: implement getNewRelases
    throw UnimplementedError();
  }

  @override
  Future<SearchModel> getSearch(String query) {
    // TODO: implement getSearch
    throw UnimplementedError();
  }

  @override
  Future<TopSide> getTOPside() {
    // TODO: implement getTOPside
    throw UnimplementedError();
  }

  @override
  Future<TopReated> getTopReated() {
    // TODO: implement getTopReated
    throw UnimplementedError();
  }

  @override
  Future<VideoResults> getVideoTriler(num movie_id) {
    // TODO: implement getVideoTriler
    throw UnimplementedError();
  }

}