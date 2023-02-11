import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/favorite.dart';
import 'package:movie/moduels/watchList/watch_item.dart';
import 'package:movie/shared/network/remote/firestore_utiles.dart';
import 'package:provider/provider.dart';

import '../../core/colorApp.dart';
import '../../provider/myProvider.dart';
import '../home/recommended_Section/recommende_details.dart';

class WatchListScreen extends StatefulWidget {
  static const String routeName = 'watchlist';


  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference Favorite = FirebaseFirestore.instance.collection('Favorite');

    var provider = Provider.of<Myprovider>(context);
    return Scaffold(
        backgroundColor: ColorApp().backgroundColor,
        appBar: AppBar(
          title: Text('Browse Category ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                color: Colors.white),),
          backgroundColor: ColorApp().backgroundColor,
          elevation: 0,
          titleSpacing: 10,
          toolbarHeight: 45,
        ),
        body:FutureBuilder<DocumentSnapshot>(
    future: Favorite.doc(Favorite.id).get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

    if (snapshot.hasError) {
    return Text("Something went wrong");
    }

    if (snapshot.hasData && !snapshot.data!.exists) {
    return Text("Document does not exist");
    }

    if (snapshot.connectionState == ConnectionState.done) {
    Map<String, dynamic> favorites = snapshot.data!.data() as Map<String, dynamic>;
    return
      ListView.builder(
        itemBuilder: (context, index) {
          return WatchList_Item(favorites[index]);
        },
        itemCount: favorites.length,
      );
    }

    return Text("loading");
    },
    ),

    //     StreamBuilder<QuerySnapshot<Favorite>>(
    //     stream: getDataFromFirestore(provider.result_ID),
    // builder: (context, snapshot) {
    // if (snapshot.connectionState == ConnectionState.waiting) {
    // return Center(child: CircularProgressIndicator());
    // }
    // if (snapshot.hasError) {
    // return Text("samthing_Has_Error");
    // }
    // var favorites = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
    //
    // return ListView.builder(
    // itemBuilder: (context, index) {
    // return WatchList_Item(favorites[index]);
    // },
    // itemCount: favorites.length,
    // );}));


    // ListView.builder(
    //   itemBuilder: (context, index) {
    //     return WatchList_Item(favorites[index]);
    //   },
    //   itemCount: favorites.length,
    // );
    );}
  }
