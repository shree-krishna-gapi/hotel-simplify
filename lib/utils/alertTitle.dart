import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/utility.dart';
class AlertTitle extends StatelessWidget {
  final titleText;
  AlertTitle({this.titleText});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palatte.color1,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,10,15,10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(titleText,style: TextStyle(color: Colors.white,
                  fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 0.2
              ),),
              InkWell(child: Icon(Icons.close,color: Colors.black87,),onTap: (){
                Navigator.of(context).pop(true);},)
            ],
          ),
        ),
      ),
    );
  }
}
