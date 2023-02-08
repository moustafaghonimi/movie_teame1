import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/TopReated.dart';
import '../../../provider/myProvider.dart';
import '../../movie_detiels_screen/movie_detiels.dart';

class NewRelaseItems extends StatelessWidget {
  var imageHight;
  Results results;



  NewRelaseItems(this.imageHight,this.results);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var provider=Provider.of<Myprovider>(context);

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  provider.result_ID=results.id!;
                  print(provider.result_ID);
                  Navigator.pushNamed(context, MovieDetiels.routeName,
                      arguments: results);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original${results.posterPath!}',
                      width: w * .26,
                      height: h * 0.17,
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/bookmark.png',
          )
        ],
      ),
    );
  }
}
