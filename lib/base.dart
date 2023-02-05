import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier{

  T? navigator=null;
}

abstract class BaseNavigator{
  void showLoading({String massage});
  void hideDialog();
  void showMassage(String massage);
  void goto(BuildContext context, {String routName});


}

abstract class BaseView<T extends StatefulWidget,VM extends BaseViewModel>extends State<T> implements BaseNavigator{
 late VM viewModel;
  VM initViewModel();
  @override
  void initState() {
    // TODO: implement initState
    viewModel=initViewModel();
  }


 @override
 void hideDialog() {
   Navigator.pop(context);
 }
 @override
 void goto(BuildContext context, {String routName=''})
 {
   Navigator.pushNamed(context,routName);
 }

 @override
 void showLoading({ String massage="Loading.."}) {
   showDialog(
     context: context,
     builder: (context) {
       return AlertDialog(
         icon: Icon(Icons.waving_hand_outlined),
         shape: OutlineInputBorder(
           borderRadius: BorderRadius.circular(18),
           borderSide: BorderSide(color: Colors.blue, width: 2),
         ),
         title: Center(
           child: Row(
             children: [

               CircularProgressIndicator(),
               SizedBox(
                 width: 8,
               ),
               Text(massage),
             ],
           ),
         ),
       );
     },
   );
 }

 @override
 void showMassage(String massage) {
   showDialog(
     context: context,
     builder: (context) {
       return AlertDialog(
         elevation: 3,
         iconColor: Colors.blue,
         icon: Icon(Icons.message),
         shape: OutlineInputBorder(
           borderRadius: BorderRadius.circular(18),
           borderSide: BorderSide(color: Colors.blue, width: 2),
         ),
         title: Center(
             child: Text(massage)
         ),
       );
     },
   );  }
}
