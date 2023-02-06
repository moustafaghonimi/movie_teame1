import 'package:flutter/material.dart';

import '../../core/colorApp.dart';

class Recommended_Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(

                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    color: ColorApp().itemRecommendColor.withOpacity(.30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/2.jpeg',
                            width: w * .26,
                            height: h * 0.14,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Text('7.7',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Filme Name',
                            style: TextStyle(fontSize: 12,color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text('2020 / 4 / 6',
                              style: TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Image.asset('assets/images/bookmark.png',)
        ],
      ),
    );
  }
}
