import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'services/childMenu.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/stateContainer.dart';
class ChildMenu extends StatefulWidget {
  final parentId;
  final roomType;
  final description;
  const ChildMenu({Key key, this.parentId,this.roomType,this.description}): super(key: key);
  @override
  _ChildMenuState createState() => _ChildMenuState();
}

class _ChildMenuState extends State<ChildMenu> {
  void initState(){
    setState(() {
      setSectionID();
    });
    super.initState();
  }

  Future setSectionID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dynamicSectionId', widget.parentId);
    var details = new Map();
    details['"ID"'] = '"${widget.parentId}"';
    details['RoomType'] = '"${widget.roomType}"';
    details['"Description"'] = '"${widget.description}"';
    prefs.setString('singleParentMenu', details.toString());
  }
  void getSectionContent(childId,val1,val2,val3) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('childMenuSectionId', childId);
    var details = new Map();
    details['"ID"'] = '"$childId"';
    details['"RoomName"'] = '"$val1"';
    details['"RoomTypeID"'] = '"$val2"';
    details['"RoomTypeName"'] = '"$val3"';
    prefs.setString('singleChildMenu', details.toString());
    final myInheritedWidget = StateContainer.of(context);
    myInheritedWidget.updateEventInfo(eventName: childId);
  }
  double itemHeight = 58;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: FutureBuilder<List<childMenu>>(
        future: fetchChildMenu(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) ;
          return snapshot.hasData ?
          Container(

            height: itemHeight*snapshot.data.length,
            child: ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) {  // 1st child menu
                return
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: InkWell(
                      onTap: ()=>getSectionContent(
                      snapshot.data[index].childId,
                      snapshot.data[index].RoomName,
                      snapshot.data[index].RoomTypeID,
                      snapshot.data[index].RoomTypeName
                      ),
                      child: Container(
                        height: itemHeight-2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(snapshot.data[index].RoomName,style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),)
                        ),
                      )

                  ),
                );
              },
            ),
          )
              :Container(
            height: itemHeight,
            child: Center(child: CircularProgressIndicator()
            )
          );
        },
      ),
    );
  }
}
