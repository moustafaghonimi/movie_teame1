import 'package:flutter/material.dart';

import '../../core/colorApp.dart';

class NewRelaseItems extends StatelessWidget {
  var imageHight;
  NewRelaseItems(this.imageHight);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/1.jpeg',
                    width: 90,
                    height: imageHight,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          Image.asset('assets/images/bookmark.png',)

        ],
      ),
    );
  }

}
