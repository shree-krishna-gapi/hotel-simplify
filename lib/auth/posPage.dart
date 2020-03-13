import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsimplify/landing/landing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'service/posService.dart';
import 'package:hotelsimplify/utils/snackbar.dart';
class PosPage extends StatefulWidget {
  final returnMseg;
  PosPage({this.returnMseg});
  @override
  _PosPageState createState() => _PosPageState();
}

class _PosPageState extends State<PosPage> {
  List<Pos> _notes = List<Pos>();
  Future<List<Pos>> fetchNotes() async {
    final SharedPreferences uu = await SharedPreferences.getInstance(
    );
    var responsePos = uu.getString('pos');
    if(responsePos != null) {
      var notes = List<Pos>();
      var notesJson = json.decode(responsePos);
      for (var noteJson in notesJson) {
        notes.add(Pos.fromJson(noteJson));
      }
      return notes;
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
//        if(widget.returnMseg == null) {
//          print('success from add');
//          successSnack(BuildContext, context,widget.returnMseg);
//        }
      });
    });
    super.initState();
  }
  final mainLogo = 'assets/svg/HotelSimplifyLogo.svg';
  final bg_image = "assets/background/background.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: <Widget>[
              Container(
                child: Image.asset(bg_image),
              ),
              Positioned(child: Column(
                children: <Widget>[

                ],
              ),
              ),
              Positioned(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black26,
                    padding: EdgeInsets.symmetric(horizontal:150, vertical: 120),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: _notes.length,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 40.0,
                      itemBuilder: (BuildContext context, int index) =>PosContainer(
                        pinId: _notes[index].PinId,
                        posPointId: _notes[index].PosPointId,
                        posPointName: _notes[index].PosPointName,
                        hasReadPermission: _notes[index].HasReadPermission,
                        hasCreatePermission: _notes[index].HasCreatePermission,
                        hasUpdatePermission: _notes[index].HasUpdatePermission,
                        hasDeletePermission: _notes[index].HasDeletePermission,


                      ),
                      staggeredTileBuilder: (_) => StaggeredTile.fit(2),
                    ),
                  )
              ),
              Positioned(
                child: Container(
                  height: 100,
                  child: SvgPicture.asset(mainLogo,height: 100, width: 100,fit: BoxFit.fitHeight,),
                ),
                top: 30, left: 0, right: 0,
              ),
            ]
        )
    );
  }


}

class PosContainer extends StatelessWidget {
  final pinId;
  final posPointId;
  final posPointName;
  final hasReadPermission;
  final hasCreatePermission;
  final hasUpdatePermission;
  final hasDeletePermission;
  PosContainer({this.pinId,this.posPointId,this.posPointName,this.hasReadPermission,this.hasCreatePermission,this.hasDeletePermission,this.hasUpdatePermission});
  @override

  Widget build(BuildContext context) {
    void _getPos(val,val1,val2,val3,val4,val5,val6) async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('posId', val);
      var details = new Map();
      details['"Id"'] = '"$val"';
      details['"PosPointId"'] = '"$val1"';
      details['"PosPointName"'] = '"$val2"';
      details['"HasReadPermission"'] = '"$val3"';
      details['"HasCreatePermission"'] = '"$val4"';
      details['"HasUpdatePermission"'] = '"$val5"';
      details['"HasDeletePermission"'] = '"$val6"';
      prefs.setString('singlePosPointData', details.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => Landing(returnMseg:'')));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          width: 440,
//          color: Colors.white54,
          child: Container(
            color: Colors.white30,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: ()=>_getPos(pinId,
                       posPointId,
                       posPointName,
                       hasReadPermission,
                       hasCreatePermission,
                       hasUpdatePermission,
                       hasDeletePermission

                  ),
//                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => LandingHead(pos_id: id))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(posPointName,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.amber.shade50
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
//              top: BorderSide(width: 5.0, color: Colors.amber.shade600),
              top: BorderSide(width: 2.0, color: Colors.white70),
              bottom: BorderSide(width: 2.0, color: Colors.white70),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

