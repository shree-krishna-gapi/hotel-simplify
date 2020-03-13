//import 'package:flutter/material.dart';
//import 'package:responsive_container/responsive_container.dart';
//import 'package:hotelsimplify/utils/utility.dart';
//_displayDialog(BuildContext context) async {
//  return showDialog(
//      context: context,
//      builder: (context) {
//        return AlertDialog(
//            title: Text('Extra Notes',style: TextStyle(color: Palatte.color1,fontSize: 18),),
//            content: ResponsiveContainer(
//              heightPercent: 18,
//              widthPercent: 30,
//              child: Column(
//                children: <Widget>[
//                  Expanded(child: TextField(
////                    controller: _textFieldController,
//                    decoration: InputDecoration(hintText: "Enter Extra Notes"),
//                    cursorColor: Palatte.color2,
//                  ),flex: 2,),
//                  Expanded(child:  Row( mainAxisAlignment: MainAxisAlignment.end,
//                    crossAxisAlignment: CrossAxisAlignment.end,
//
//                    children: <Widget>[
//
//                      OutlineButton(
//                        onPressed: () {},
//                        child: Padding(padding: EdgeInsets.all(10),
//                          // TODO Menu Send Order Button
//                          child: InkWell(child: Text('Cancel', style: TextStyle(fontSize: 16,color: Palatte.errorBg),),
//                            onTap: (){//
//
//                              setState(() {
////                                alertAction(widget.note,_textFieldController.text = '');
//                              });
//                              Navigator.of(context).pop();
//                            }, //
//                          ),),
//                        borderSide: BorderSide(color: Palatte.errorBg),
//                      ),
//                      SizedBox(width: 30,),
//                      OutlineButton(
//                        onPressed: () {},
//                        child: Padding(padding: EdgeInsets.all(10),
//                          // TODO Menu Send Order Button
//                          child: InkWell(child: Text('OK', style: TextStyle(fontSize: 16,color: Colors.amber),),
//                            onTap: (){//
//                              setState(() {
//                                alertAction(widget.note,_textFieldController.text);
//                              });
//                              Navigator.of(context).pop();
//                            }, //
//                          ),),
//                        borderSide: BorderSide(color: Colors.amber),
//                      ),
//                    ],
//                  ),flex: 1,)
//
//
//                ],
//              ),
//            )
//        );
//      });
//}


