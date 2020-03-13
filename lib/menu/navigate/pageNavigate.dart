//import 'package:flutter/material.dart';
//import 'package:hotelsimplify/utils/utility.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//class PageNavigate extends StatefulWidget {
//  @override
//  _PageNavigateState createState() => _PageNavigateState();
//}
//
//class _PageNavigateState extends State<PageNavigate> {
//  bool _showCase;
//  NavigatePage() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    bool isTrue = prefs.getBool('showcaseMenu');
//    if(isTrue == true) {
//      setState(() {
//        print('this isTrue');
//        Navigator.pop(context);
//      });
//    }
//    else if(isTrue == false) {
//      print('this isFalse');
//     setState(() {
//       _showCase = !_showCase;
//       prefs.setBool('showcaseMenu',true);
//     });
//    }
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Padding(padding: EdgeInsets.fromLTRB(0,42,30,10),
//        child: Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              InkWell(
//                child: Icon(Icons.arrow_back,
//                  color: Palatte.am1,
//                ),
//                onTap: (){
////                  print('page back');
////                  setState(() {
////                    Navigator.pop(context);
////                  });
//                  NavigatePage();
//                },
//              ),
//              SizedBox(
//                width: 20,
//              ),
//              Text(
//                '|',
//                style: TextStyle(color: Palatte.am1),
//              ),
//              SizedBox(
//                width: 20,
//              ),
//              Icon(
//                Icons.title, //refresh
//                color: Palatte.am1,
//              ),
//            ]
//        )
//    );
//  }
//}
