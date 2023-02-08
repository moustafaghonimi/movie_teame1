import 'package:flutter/material.dart';

import '../../../core/colorApp.dart';
import '../../../models/newReleases.dart';
import '../../../shared/network/remote/api_Manger.dart';
import 'new_relase_details.dart';

class NewReleaseViewr extends StatefulWidget {

  @override
  State<NewReleaseViewr> createState() => _NewReleaseViewrState();
}

class _NewReleaseViewrState extends State<NewReleaseViewr> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h*0.23,
      color: ColorApp().graycolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '  New Releases',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),

          FutureBuilder<NewReleases>(
            future: ApiManger().getNewRelases(),
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
              var results = snapshot.data?.results ?? [];
              return Container(
                width: double.infinity,
                // width: double.infinity,
                height: h * 0.19,
                child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NewRelaseItems(h * 0.20,results[index]);
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
