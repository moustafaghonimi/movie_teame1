import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/colorApp.dart';
import '../../models/moreLikeThis.dart';
import '../../provider/myProvider.dart';
import '../../shared/network/remote/api_Manger.dart';
import 'more_LikeThise_detiels.dart';

class MoreLikeThis_Viewr extends StatefulWidget {


  @override
  State<MoreLikeThis_Viewr> createState() => _MoreLikeThis_ViewrState();
}

class _MoreLikeThis_ViewrState extends State<MoreLikeThis_Viewr> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<Myprovider>(context);


    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h*0.28,

      color: ColorApp().graycolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '  More Like This',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          FutureBuilder<MoreLikeThis>(
            future: ApiManger().getMoreLikeThise(provider.result_ID),
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
                height: h * 0.24,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MoreLikeThiseDetiels(results[index]);
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
