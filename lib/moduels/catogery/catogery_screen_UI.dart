import 'package:flutter/material.dart';
import 'package:movie/core/colorApp.dart';
import 'package:movie/moduels/catogery/catagery_item.dart';
import 'package:movie/moduels/home/topSide_Section/topSide_Details.dart';
import 'package:movie/shared/network/remote/api_Manger.dart';

import '../../models/catogry_models/ReleaseModel.dart';

class CatogeryScreen extends StatefulWidget {
  static const String routeName = 'cat';

  @override
  State<CatogeryScreen> createState() => _CatogeryScreenState();
}

class _CatogeryScreenState extends State<CatogeryScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(

        child: FutureBuilder<ReleaseModel>(
          future: ApiManger.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      'Check Internet And Press Try Again',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Icon(
                      Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
                      color: Colors.white,
                      size: 70,
                    ),
                    TextButton(
                        onHover: (value) {
                          return activate();
                        },
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('Try Again',
                            style: TextStyle(
                                color: ColorApp().bottomBarSelectedIconColor,
                                fontSize: 14))),
                  ],
                ),
              );
            }
            var results = snapshot.data?.genres?? [];
            return GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,childAspectRatio: 10/6 ),
                itemCount: results.length,
                itemBuilder:(context, index) {
                  return CategoryItem(results[index]);

                },

            );

          },
        ),
      ),
    );
  }
}
