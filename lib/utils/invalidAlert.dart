import 'package:flutter/material.dart';
import 'utility.dart';
invalidAlert(BuildContext,title, text) {
  showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(title,style: TextStyle(color: Colors.red[300],fontSize: 22,fontWeight: FontWeight.w400),),
          content: Text(text,style: TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.w400),),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok',style: TextStyle(color: Colors.blue[700],fontSize: 16,fontFamily: 'Ubuntu', fontWeight: FontWeight.w400)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
  );
}