import 'package:flutter/material.dart';
import 'package:movie/models/TopReated.dart';
import 'package:movie/moduels/search/search_Items.dart';
import 'package:movie/shared/network/remote/api_Manger.dart';

import '../../core/colorApp.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String quary = '';
  List<Results> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    quary = value;
                  });
                  print(quary);
                },
                enableSuggestions: true,
                style: TextStyle(color: Colors.white, fontSize: 20),
                autocorrect: true,
                cursorColor: Colors.white,
                showCursor: true,
                cursorWidth: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white60,
                        width: 2,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white60,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search ',
                  hintStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                  fillColor: ColorApp().graycolor,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            quary == ''
                ? Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_movies,
                            size: 120,
                            color: Colors.white60,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'No Movies Found',
                            style: TextStyle(fontSize: 18, color: Colors.white60),
                          )
                        ],
                      )),
                )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SearchItems(search().elementAt(index));
                      },
                      itemCount: search().length,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  List<Results> search() {
    ApiManger()
        .getSearch(quary)
        .then((searchResponces) => {searchList = searchResponces.results ?? []})
        .catchError(
      (error) {
        debugPrint('Error in Api ${error}');
      },
    );
    return searchList;
  }
}
