import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'services/sectionMenu.dart';
import 'package:http/http.dart' as http;
import 'services/stateContainer.dart';
import 'services/event.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../menu/menu.dart';
import 'package:responsive_container/responsive_container.dart';
import 'pages/orderDetails.dart';
import 'package:hotelsimplify/utils/alertTitle.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Section extends StatefulWidget {
  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  Event event;
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget= StateContainer.of(context);
    event= myInheritedWidget.event;
    return event != null ? BodySection(sectionId:event.eventName) :
    Padding(padding: EdgeInsets.all(30),child: Text('Loading!...'),);
  }
}
class BodySection extends StatefulWidget {
  final sectionId;
  BodySection({this.sectionId});
   @override
  _BodySectionState createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,30,30,0),
      child: Container(
        child: FutureBuilder<List<SectionData>>(
          future: fetchSection(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) ;
            return snapshot.hasData ?
            new StaggeredGridView.countBuilder(
              crossAxisCount: 18,
//              itemCount: 6,
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => new Container(
                  child: InkWell(
                    onTap: () {
                      snapshot.data[index].isPaid == true && snapshot.data[index].isActive == false ?

                      paxDialog(context, snapshot.data[index].sectionId,
                        snapshot.data[index].title,
                        snapshot.data[index].tableCapacity,
                        snapshot.data[index].pOSPoint,
                        snapshot.data[index].roomID,
                        snapshot.data[index].description,
                        snapshot.data[index].roomName,
                        snapshot.data[index].isPaid,
                        snapshot.data[index].mainCategoryID,
                        snapshot.data[index].isActive,
                        snapshot.data[index].isDefault
                      ): showDialog(
                          context: context,
                          builder: (_) {
                            return OrderDetails(tableId:snapshot.data[index].sectionId,roomId:snapshot.data[index].roomID);
                          }
                      );

                    },
//                  onLongPress: _showPopupMenu,
//                  onTapDown: _storePosition,
                    child: Card(
                      child: Container(
                        width: 150.0,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(width: 1.0),
                                Text('14:06'),
                                Text('22:03'),
                                SizedBox(width: 0.0)
                              ],
                            ),
                            snapshot.data[index].isPaid == true && snapshot.data[index].isActive == false ?
                            SvgPicture.asset(tableGreen,
                                height: 95.0, width: 95.0)
                            :
                            SvgPicture.asset(tableRed,
                                height: 95.0, width: 95.0),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(snapshot.data[index].title),
                          ],
                        ),
                      ),
                      elevation: 5.5,
                    ),
                  )),
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.extent(5,190),
              mainAxisSpacing: 18.0,
              crossAxisSpacing: 18.0,
//            new StaggeredTile.count(2, index.isEven ? 2 : 1),

            ):Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
  bool overPax = true;

  paxDialog(BuildContext context,sectionId,val1,int maxPax,val3,val4,val5,val6,val7,val8,val9,val10) async {

    return showDialog(
        context: context,
        builder: (context) {
          return Center(
               child: SingleChildScrollView(
                 child: Card(
                   child: ResponsiveContainer(
                    heightPercent: 40,
                    widthPercent: 38,
                    child: Column(
                      children: <Widget>[
                        AlertTitle(titleText:'Number of Pax'),
                        Padding(padding: EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Max Pax of Size: $maxPax',style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black87,letterSpacing: 0.1
                              ),),)
                        ),
                        Container(
                          height: 144,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, //spaceAround
                              children: <Widget>[
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: _paxFieldController,
                                  decoration: InputDecoration(hintText: "Pax "),
                                  cursorColor: Palatte.color2,
                                ),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row( mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    OutlineButton(
                                      onPressed: () {},
                                      child: Padding(padding: EdgeInsets.all(10),
                                        // TODO Menu Send Order Button
                                        child: InkWell(child: Text('Close', style: TextStyle(fontSize: 16,color: Palatte.errorBg),),
                                          onTap: (){//
                                            Navigator.of(context).pop();
                                          }, //
                                        ),),
                                      borderSide: BorderSide(color: Palatte.errorBg),
                                    ),
                                    SizedBox(width: 30,),
                                    OutlineButton(
                                      onPressed: () {},
                                      child: Padding(padding: EdgeInsets.all(10),
                                        // TODO Menu Send Order Button
                                        child: InkWell(child: Text('Take Order', style: TextStyle(fontSize: 16,color: Colors.amber),),
                                          onTap: (){//
//                                            print('clk');
                                            int paxIs = int.parse(_paxFieldController.text);
                                            setState(() {
                                              if (_paxFieldController == null){
                                                print('null');
                                              }
                                              else if( paxIs<= maxPax) {
  //                                  createMasterID(sectionId,paxIs);
                                                  createMasterID(paxIs,sectionId);
                                                  Navigator.of(context).pop();

//                                                  createMasterID(int paxIs,String sectionId);
//                                                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(id:sectionId,pax:paxIs)));
                                              }
                                              else {
                                                print('false');
                                                overPax = false;

                                              }

                                            });

                                          }, //
                                        ),),
                                      borderSide: BorderSide(color: Colors.amber),
                                    ),
                                  ],
                                ),
                              ),
                                ],
                            ),
                          ),
                        ),
                      ],
                    ),
                   ),
                 ),
               )
          );
        });

  }
  TextEditingController _paxFieldController = TextEditingController();
  Future createMasterID(int paxIs,String sectionId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('hotelSimplifyToken');
    prefs.setInt('createPax', paxIs);
    var posId = prefs.getString('posId');
    var url = '${Urls.BASE_API_URL}/Pos/Create?ID=$sectionId'+'&posId='+'$posId';
    http.get(Uri.encodeFull(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        }).then(
            (http.Response response) {
          final int statusCode = response.statusCode;
          if(statusCode==200) {
            var data = jsonDecode(response.body)['Data'][0];
            var menuId = jsonDecode(response.body)['Data'][0]['MainCategoryID'];
            prefs.setInt('menuId', menuId);
            var aa = jsonEncode(data).toString();
            prefs.setString('createData',aa);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(id:sectionId,pax:paxIs)));
          }
          else {
            print('something wrong');
          }
        });
//    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));

  }
}
