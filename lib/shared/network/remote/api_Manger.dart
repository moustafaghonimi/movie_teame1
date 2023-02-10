import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/core/constant.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/moreLikeThis.dart';
import 'package:movie/models/topSide.dart';

import '../../../models/TopReated.dart';
import '../../../models/newReleases.dart';

class ApiManger {


  Future<NewReleases> getNewRelases( ) async {
    Uri URL = Uri.https(BASE, '/3/movie/upcoming', {
      'api_key': APIHEY,
      // 'imdb_id': imdb_id,
    });
    Response release = await http.get(URL);
    try {
      var json = jsonDecode(release.body);
      NewReleases newRelease = NewReleases.fromJson(json);
      return newRelease;
    } catch (e) {
      print('erorrrr:::$e');
      throw e;
    }
  }

  Future<TopSide> getTOPside( ) async {
    Uri URL = Uri.https(BASE, '/3/movie/popular', {
      'api_key':APIHEY,
      // 'imdb_id': imdb_id,
    });
    Response top = await http.get(URL);
    try {
      var json = jsonDecode(top.body);
      TopSide topSide = TopSide.fromJson(json);
      return topSide;
    } catch (e) {
      print('erorrrr:::$e');
      throw e;
    }
  }
Future<MoreLikeThis> getMoreLikeThise(num movie_id)async{
    Uri URL=Uri.https(BASE,'/3/movie/${movie_id.toString()}/similar',{
      'api_key':APIHEY,
      // 'movie_id':Filme_ID,
    });
Response more=await http.get(URL);
try{
  var json=jsonDecode(more.body);
  MoreLikeThis moreLikeThis=MoreLikeThis.fromJson(json);
  return moreLikeThis;
}
catch(e){
  print(e);
  throw e;
}

}

  ////////////////////////////////////////////////////////////


  Future<TopReated> getTopReated() async {
    Uri URL = Uri.https(BASE, '/3/movie/top_rated', {
      'api_key': APIHEY,
      // 'imdb_id': imdb_id,
    });
    Response reated = await http.get(URL);
    try {
      var json = jsonDecode(reated.body);
      TopReated topReated = TopReated.fromJson(json);
      return topReated;
    } catch (e) {
      print('erorrrr:::$e');
      throw e;
    }
  }
}
