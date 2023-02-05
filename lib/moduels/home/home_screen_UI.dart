import 'package:flutter/material.dart';
import 'package:movie/base.dart';
import 'package:movie/core/colorApp.dart';

import 'home_screen_Navigator.dart';
import 'home_screen_VM.dart';

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
return Container(
  color: ColorApp().backgroundColor,
);
}

  @override
  HomeScreenViewModel initViewModel() {
    return HomeScreenViewModel();
  }
}
