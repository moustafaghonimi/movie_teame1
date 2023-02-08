import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/core/constant.dart';
import 'package:http/http.dart' as http;
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
