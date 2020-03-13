//import 'package:flutter/material.dart';
////import 'package:expandable/expandable.dart';
//import 'package:hotelsimplify/utils/utility.dart';
//import 'package:http/http.dart' as http;
//import 'services/menuGallery.dart';
//import 'search/searchContainer.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:hotelsimplify/menu/childMenuItems.dart';
//import 'navigate/pageNavigate.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//class ParentMenu extends StatefulWidget {
//  @override
//  _ParentMenuState createState() => _ParentMenuState();
//}
//
//class _ParentMenuState extends State<ParentMenu> {
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder<List<parentMenu1>>(
//      future: fetchParentMenu1(http.Client()),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) ;
//        return snapshot.hasData ?
//        GridView.builder(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//          ),
//          itemCount: snapshot.data == null ?0 : snapshot.data.length,
//          itemBuilder: (context, index) {
//            return InkWell(
//                onTap: (){
////                                showItems(snapshot.data[index].Id);
////                                setState(() {
////                                });
//                },
//                splashColor: Colors.amber,
//                child: Stack(
//                    children: <Widget>[
//                      Container(
//                        child: snapshot.data[index].ImageUrl == null ?
//                        Container( width: 150, height: 100,
//                            child: Padding(padding: EdgeInsets.all(20),
//                              child: SvgPicture.asset(mainLogo),
//                            )                           ):
//                        Image.network(snapshot.data[index].ImageUrl),
//                        decoration: new BoxDecoration(boxShadow: [
//                          new BoxShadow(
//                            color: Colors.black45,
//                            blurRadius: 3,
//                            offset: Offset(
//                              4.0, // horizontal, move right 10
//                              5.0, // vertical, move down 10
//                            ),
//                          ),
//                        ]),
//                      ),
//                      Padding(padding: EdgeInsets.only(top: 80),
//                        child: Opacity(
//                          opacity: 0.5,
//                          child: Container(
//                            color: Colors.black,
//                            height: 70,
//                            width: 150,
//
//                            child: Align(
//                              alignment: Alignment
//                                  .center,
//                              child: Text(snapshot.data[index].Name,style: TextStyle(fontSize: 16,
//                                  fontFamily: 'Pacifico',color: Palatte.wtext),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ]
//                )
//            );
//          },
//        ):Center(child: CircularProgressIndicator());
//      },
//    );
//  }
//}
