import '../models/TopReated.dart';
import '../models/catogry_models/ReleaseModel.dart';
import '../models/catogry_models/movie.dart';
import '../models/moreLikeThis.dart';
import '../models/newReleases.dart';
import '../models/searchModel.dart';
import '../models/topSide.dart';
import '../models/videoResults.dart';

abstract class BaseRepositorie{

  Future<ReleaseModel> getCategory();

  Future<Movies> getMoviesByList(int genreId);

  Future<SearchModel> getSearch(String query);

  Future<NewReleases> getNewRelases();

  Future<TopSide> getTOPside();

  Future<MoreLikeThis> getMoreLikeThise(num movie_id);

  Future<TopReated> getTopReated();

  Future<VideoResults> getVideoTriler(num movie_id);



}