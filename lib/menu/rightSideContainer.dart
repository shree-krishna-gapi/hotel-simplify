import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/utility.dart';
import '../bill/costsecton.dart';
import 'table/orderedtab.dart';
import 'table/pinDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'services/sendOrder.dart';

import 'services/main.dart';
import 'services/todo_service.dart';
//
//import 'package:scoped_model/scoped_model.dart';
//import 'services/scopedModel.dart';
import 'package:hotelsimplify/utils/snackbar.dart';
import 'table/totalDisplay.dart';
class RightSideContainer extends StatefulWidget {
  RightSideContainer({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RightSideContainerState();
  }
//  _RightSideContainerState createState() => _RightSideContainerState();
}
class _RightSideContainerState extends State<RightSideContainer> with TickerProviderStateMixin{
//  todoService = totalService

  @override
  Widget build(BuildContext context) {
    final TodoService todoService = StateContainer.of(context).todoService;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child:Padding(padding: EdgeInsets.fromLTRB(30,30,30,5),
            child: OrderedTab(),
          ),flex: 7,),
          Expanded(flex:3,
              child: Column(
                children: <Widget>[
                  Expanded( flex: 2,
                      child:Padding(padding: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          children: <Widget>[
                            OutlineButton(
                              onPressed: () {},
                              child: Padding(padding: EdgeInsets.all(10),
                                // TODO Menu Send Order Button
                                child: InkWell(child: Text('Send Order', style: TextStyle(fontSize: 16,color: Colors.amber),),
                                  onTap: (){
//                                    showPin1();
//                                    final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
//                                    Scaffold.of(context).showSnackBar(snackBar,
//
//                                    );


                                    sendOrder(context);
                                  }, //
                                ),),
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              color: Palatte.yellow1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(padding: EdgeInsets.
                                  fromLTRB(30,6,6,10),
                                    child: InkWell(
                                      child: Container(
                                        height: 40,
                                        child: TotalDisplay(),
//                                        child: Text('${TodoService.p}')
                                      ),
                                      onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return CostSection();
                                            }
                                        );
//                                        Navigator.push(context, MaterialPageRoute(builder: (context) => CostSection()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            bottom: 0,
                            right: 0,left: 0,
                          )
                        ],
                      ))
                ],
              )
          ),
        ],
      ),
    );
  }


  sendOrder(BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var selectItems = prefs.getBool('selectItems');
    if(selectItems==true){

      showDialog(
          context: context,
          builder: (_) {
            return PinDialog();
          }
      );
    }else {
      emptySnack(BuildContext, context,'Item is Empty!');
    }
  }
}

