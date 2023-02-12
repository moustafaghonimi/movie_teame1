import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/favorite.dart';
import 'package:movie/moduels/watchList/watch_item.dart';
import 'package:movie/shared/network/remote/firestore_utiles.dart';
import 'package:provider/provider.dart';

import '../../core/colorApp.dart';
import '../../provider/myProvider.dart';

class WatchListScreen extends StatefulWidget {
  static const String routeName = 'watchlist';

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Myprovider>(context);
    return Scaffold(
      backgroundColor: ColorApp().backgroundColor,
      appBar: AppBar(
        title: Text(
          'Browse Category ',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: ColorApp().backgroundColor,
        elevation: 0,
        titleSpacing: 10,
        toolbarHeight: 45,
      ),
      body: StreamBuilder<QuerySnapshot<Favorite>>(
          stream: getDataFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(
                "samthing_Has_Error",
                style: TextStyle(color: Colors.white60),
              );
            }
            var favorite =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

            return favorite.length==0?Center(
              child: Column(
                children: [
                   Icon(Icons.movie_filter_rounded,color: Colors.white70,size: 80,),
                  SizedBox(height: 8,),
                  Text('No Filmes Are Watched ',style: TextStyle(color: Colors.white60,fontSize: 23),)
                ],
              ),
            ):ListView.builder(
              itemBuilder: (context, index) {
                print(favorite.length);
                return WatchList_Item(favorite[index]);
              },
              itemCount: favorite.length,
            );
          }),
    );
  }
}
