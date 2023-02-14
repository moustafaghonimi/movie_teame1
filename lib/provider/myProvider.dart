import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/models/favorite.dart';
import 'package:movie/models/videoResults.dart';
import 'package:movie/shared/network/remote/firestore_utiles.dart';

class Myprovider extends ChangeNotifier{

  num result_ID=0;

  bool isfavorite=false;

  void updateFavoriteToFirestore(Favorite favorite) {
    FirebaseFirestore.instance.collection('Favorite').doc(favorite.id).update({
      "id": favorite.id,
      "filem_id": favorite.filem_id,
      "isFavorite": favorite.isFavorite,
      "filmeName": favorite.filmeName,
      "backdropPath": favorite.backdropPath,
      "voteAverage": favorite.voteAverage,
      "releaseDate": favorite.releaseDate,
    }).timeout(Duration(milliseconds: 500), onTimeout: () {
      getFavorite();
      print('updated');
      notifyListeners();
    });
  }
}