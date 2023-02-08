import 'package:flutter/material.dart';
import 'package:movie/moduels/home/recommende_details.dart';

import '../../core/colorApp.dart';
import '../../models/TopReated.dart';
import '../../shared/network/remote/api_Manger.dart';

class RecommendedViewr extends StatefulWidget {

  @override
  State<RecommendedViewr> createState() => _RecommendedViewrState();
}

class _RecommendedViewrState extends State<RecommendedViewr> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      color: ColorApp().graycolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '  Recommended',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          FutureBuilder<TopReated>(
            future: ApiManger().getTopReated(),
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
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                      Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,color: Colors.white,size: 70,),
                      TextButton(
                        onHover: (value) {
                          return activate();
                        },
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text('Try Again',
                              style: TextStyle(color: ColorApp().bottomBarSelectedIconColor,fontSize: 14))),
                    ],
                  ),
                );
              }
              // if (snapshot.data?.success == 'error') {
              //   return Center(
              //     child: Column(
              //       children: [
              //         Text(snapshot.data?. ?? 'style: TextStyle(color: Colors.black)'),
              //         TextButton(onPressed: () {}, child: Text('Try Again')),
              //       ],
              //     ),
              //   );
              // }
              var results = snapshot.data?.results ?? [];
              return Container(
                width: double.infinity,
                height: h * 0.24,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Recommended_Details(results[index]);
                    },
                    itemCount: results.length),
              );
            },
          ),
        ],
      ),
    );
  }
}
