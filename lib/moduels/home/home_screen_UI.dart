import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:movie/base.dart';
import 'package:movie/core/colorApp.dart';
import 'package:movie/moduels/home/recommende_details.dart';

import 'home_screen_Navigator.dart';
import 'home_screen_VM.dart';
import 'new_relase_details.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeScreenViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      color: ColorApp().backgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: h * .35,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/1.jpeg',
                      width: double.infinity,
                      height: h * 0.25,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 115),
                      child: Text(
                        'Filme name',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Text(
                        '2018 PG-20-5',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.only(bottom: 65.0),
                  child: Icon(Icons.play_circle,color: Colors.white,size: 80,),
                )),

                Padding(
                  padding: const EdgeInsets.only(left:10,top: 80),
                  child: NewRelaseItems( h * 0.22),
                ),
              ],
            ),
          ),
          // new releases
          Container(
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
                Container(
                  width: double.infinity,
                  // width: double.infinity,
                  height: h * 0.19,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return NewRelaseItems( h * 0.17);
                      },
                      itemCount: 10),
                ),
              ],
            ),
          ),
          //recommended
          SizedBox(
            height: h / 30,
          ),
          Container(
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
                Container(
                  width: double.infinity,
                  height: h * 0.22,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Recommended_Details();
                      },
                      itemCount: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeScreenViewModel initViewModel() {
    return HomeScreenViewModel();
  }
}
