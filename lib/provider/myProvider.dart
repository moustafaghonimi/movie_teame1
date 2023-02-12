import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie/models/favorite.dart';
import 'package:movie/shared/network/remote/firestore_utiles.dart';

class Myprovider extends ChangeNotifier{

  num result_ID=0;



  void updateFavoriteToFirestore(Favorite favorite) {
    getFavorite().doc(favorite.id).update({
      'favorite.id': favorite.id,
      'isFavorite': favorite.isFavorite,
    }).timeout(Duration(milliseconds: 500), onTimeout: () {
      getFavorite();
      notifyListeners();
    });
  }
}