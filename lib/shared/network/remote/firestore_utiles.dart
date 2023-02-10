
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie/models/favorite.dart';

CollectionReference<Favorite> getFavorite() {
  return FirebaseFirestore.instance.collection('Favorite').withConverter<Favorite>(
    fromFirestore: (snapshot, options) => Favorite.fromjson(snapshot.data()!),
    toFirestore: (value, options) => value.tojson(),
  );
}

// CollectionReference<Favorite>getFavorite(){
//   return FirebaseFirestore.instance.collection('Favorite').withConverter<Favorite>
//     (fromFirestore: (snapshot, options) => Favorite.fromJson(snapshot.data()!),
//       toFirestore: (value, options) => value.tojson(),);
// }

Future<void> addFavoriteToFirestore(Favorite favorite) {
  var collection = getFavorite();
  var docRef = collection.doc();

  favorite.id = docRef.id;

  return docRef.set(favorite);
}