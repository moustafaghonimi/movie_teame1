class Favorite{
  String id;
  num filem_id;
  bool isFavorite;
  String filmeName;

  Favorite({ this.id='',required this.filem_id,required this.isFavorite, required this.filmeName});


  Favorite.fromjson(Map<String,dynamic>json):this(
    id:json['id'],
    filem_id:json['filem_id'],
    isFavorite:json['isFavorite'],
    filmeName:json['filmeName'],
  );

  Map<String,dynamic> tojson(){
    return {
      "id":id,
      "filem_id":filem_id,
      "isFavorite":isFavorite,
      "filmeName":filmeName,
    };
  }

}


