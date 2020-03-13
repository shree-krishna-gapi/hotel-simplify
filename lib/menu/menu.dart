import 'package:flutter/material.dart';
import 'package:hotelsimplify/header/header.dart';
import 'MenuItems.dart';
import 'rightSideContainer.dart';
import 'services/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'services/scopedModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';
enum PageEnum {
  induceSmile,
  google,
  yahoo,
}
class Menu extends StatefulWidget {
  final pax;
  final id;
  Menu({this.pax,this.id});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
//  void initState(){
//    setState(() {
//      createMasterID();
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();
    return ScopedModel<MainModel>(
        model: _model,
        child: StateContainer(
          child: Scaffold(
            appBar: AppBar(
              leading: Container(width: 0),
              flexibleSpace:
              Header()
            ),
            body: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: MenuItems(),
                ),
                Expanded(
                  flex: 1,
                  child: RightSideContainer(),
                )
              ],
            )
      ),
    ));
  }
}















class NotificationWidget extends PopupMenuEntry<int> {
  @override
  double height = 100;
  @override
  bool represents(int n) => n == 1;
  @override
  NotificationWidgetState createState() => NotificationWidgetState();
}
class NotificationWidgetState extends State<NotificationWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 400,
        color: Colors.purple,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Mark all as read',
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              height: 243,
              child: ListView(
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      Icon(
                        Icons.bubble_chart,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 350,
                        child: Text(
                          'lorem oiahssjabasijgfods9ih fdssdfi jdsbfpusdg gfdsopf hdisfb pesdiohf kdshfpiodssh fpesdsy bfi',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),

                ],
              ),
            )
          ],
        )
    );
  }
}

