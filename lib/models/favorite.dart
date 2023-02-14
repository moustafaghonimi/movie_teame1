import 'TopReated.dart';

class Favorite {
  String id;
  num filem_id;
  bool isFavorite;
  String filmeName;
  String backdropPath;
  num voteAverage;
  String releaseDate;

  Favorite({
    this.id = '',
     required this.isFavorite ,
    required this.filem_id,
    required this.filmeName,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  Favorite.fromjson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          filem_id: json['filem_id'],
          isFavorite: json['isFavorite'],
          filmeName: json['filmeName'],
          backdropPath: json['backdropPath'],
          voteAverage: json['voteAverage'],
          releaseDate: json['releaseDate'],
        );

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "filem_id": filem_id,
      "isFavorite": isFavorite,
      "filmeName": filmeName,
      "backdropPath": backdropPath,
      "voteAverage": voteAverage,
      "releaseDate": releaseDate,
    };
  }
}
