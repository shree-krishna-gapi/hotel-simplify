import 'package:flutter/material.dart';
import 'services/stateContainer.dart';
import 'package:hotelsimplify/header/header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'sideMenu.dart';
import 'section.dart';
import 'package:hotelsimplify/utils/snackbar.dart';
import 'package:hotelsimplify/auth/posPage.dart';
enum PageEnum {
  induceSmile,
  google,
  yahoo,
}
class Landing extends StatefulWidget {
  final returnMseg;
  Landing({this.returnMseg});
  @override
  _LandingState createState() => _LandingState();
}
class _LandingState extends State<Landing> {
  @override
  void initState() {

      setState(() {
        if(widget.returnMseg == null) {
          print('success from add');
          successSnack(BuildContext, context,widget.returnMseg);
        }
      });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(width: 0),
          flexibleSpace:
          Header()
      ),
//      body: StateContainer(child: LandingBody(),),
      body: StateContainer(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                color: Palatte.color2,
                child: SingleChildScrollView(

                  child: Container(

                    child: Column(
                      children: <Widget>[
                        // 86 appbar h
                        Container(
                          height:75,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 35),
                                child: Text(
                                  'Room Types',style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height:MediaQuery.of(context).size.height - 316,
                          child: SideMenu(),
                        ),

                        Container(
                          height:155,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30,top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child:Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2.0,color: Colors.white,
                                        )
                                    ),
                                    height: 36,
                                    child: RaisedButton(
                                      padding: EdgeInsets.all(0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        color: Palatte.color2,
                                        alignment: Alignment.center,
                                        child: Text('Back to Menu',style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500
                                        )
                                        ),
                                      ),
                                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PosPage()));},
//                                  onPressed: (){Navigator.pop(context);},
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                          'Powered By',
                                          style: TextStyle(color: Colors.white,fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 5.0,
                                                color: Colors.black26,
                                                offset: Offset(-2.0, 12.0,),

                                              ),
                                            ],

                                          )
                                      ),
                                      Spacer(),
                                      SvgPicture.asset(
                                        danfeLogo,
                                        height: 70,
                                        width: 70,
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Section()
            ),
          ],
        ),
      ),
    );
  }
}
