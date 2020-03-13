import 'package:flutter/material.dart';

successSnack(buildContext,context,title) {

  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black.withOpacity(0.5),
    content: Text('Order Send Succefully!',style: TextStyle(color:Colors.white,
        fontSize: 16
    ),),
    duration: Duration(seconds: 2),
  ));
}


// used on send order button
emptySnack(buildContext,context,title) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black.withOpacity(0.5),
    content: Text('$title',style: TextStyle(color:Colors.white,
        fontSize: 16,fontWeight: FontWeight.w500
    ),),
    duration: Duration(seconds: 2),
  ));
}
// snackSuccess(BuildContext,context);

errorSnack(buildContext,context,title) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black.withOpacity(0.5),
    content: Text('$title',style: TextStyle(color:Colors.white,
        fontSize: 16
    ),),
    duration: Duration(seconds: 2),
  ));
}