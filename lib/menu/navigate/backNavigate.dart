//import 'package:flutter/material.dart';
//import 'package:hotelsimplify/utils/utility.dart';
//import '../menu.dart';
//class BackNavigate extends StatefulWidget {
//  @override
//  _BackNavigateState createState() => _BackNavigateState();
//}
//
//class _BackNavigateState extends State<BackNavigate> {
//  bool _showCase = true;
//  @override
//  Widget build(BuildContext context) {
//    return Padding(padding: EdgeInsets.fromLTRB(0,42,30,10),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//          InkWell(
//            child: Icon(Icons.arrow_back,
//              color: Colors.cyan,
//            ),
//            onTap: (){
//              setState(() {
//                print('back navigate');
//                _showCase = !_showCase;
//            });},
//          ),
//          SizedBox(
//            width: 20,
//          ),
//          Text(
//            '|',
//            style: TextStyle(color: Colors.cyan),
//          ),
//          SizedBox(
//            width: 20,
//          ),
//          Icon(
//            Icons.refresh,
//            color: Colors.cyan,
//          ),
//        ],
//      ),
//
//    );
//  }
//}
//
