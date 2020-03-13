import 'package:flutter/material.dart';
//import 'package:expandable/expandable.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:http/http.dart' as http;
import 'services/menuGallery.dart';
import 'search/searchContainer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/menu/childMenuItems.dart';
//import 'navigate/pageNavigate.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'parentMenu.dart';
class MenuItems extends StatefulWidget {
  @override
  _MenuItemsState createState() => _MenuItemsState();
}
class _MenuItemsState extends State<MenuItems> {
  bool showCase = true;
  showItems(menuId) async{
    String id = menuId.toString();
    final SharedPreferences prefs  = await SharedPreferences.getInstance();
    prefs.setString('menuId',id);
  }
  NavigatePage(val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('showcaseMenu', val);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palatte.color1,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(flex:2,child: Row(
            children: <Widget>[
              Expanded(child: SearchContainer(),flex: 5,),
              Expanded(child: Padding(padding: EdgeInsets.fromLTRB(0,42,30,10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          child: showCase ? Icon(Icons.arrow_back,
                            color: Palatte.am1,
                          ):Icon(Icons.print,
                            color: Colors.red,
                          ),
                          onTap: (){
                            setState(() {
                              if(showCase == true) {
                                Navigator.pop(context);
                              }
                              else if (showCase == false) {
                                showCase = ! showCase;

                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '|',
                          style: TextStyle(color: Palatte.am1),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.refresh, //refresh
                          color: Palatte.am1,
                        ),

                      ]
                  )
              ),flex: 2,),
            ],
          )), //SearchContainer
          Expanded(flex: 8,
              child:Container(
                width: double.infinity,
                height: double.infinity,
                decoration: new BoxDecoration(
                  color: Colors.amber,
                  gradient: new LinearGradient(
                    colors: [Colors.black87, Palatte.color1, Palatte.color1, Palatte.color1, Palatte.color1],
                    begin: Alignment.bottomRight,
                    end: new Alignment(0.9, -0.8),
                  ),
                ),
                child: Padding(padding: EdgeInsets.fromLTRB(30,30,30,0),
                    child: showCase == true ? FutureBuilder<List<ParentMenu1>>(
                      future: fetchParentMenu1(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) ;
                        return snapshot.hasData ?
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: snapshot.data == null ?0 : snapshot.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: (){

                                setState(() {
                                  showItems(snapshot.data[index].id);
                                  showCase = !showCase;
                                });
                                },
                                splashColor: Colors.amber,
                                child: Stack(
                                    children: <Widget>[
                                      Container(
                                        child: snapshot.data[index].imageUrl == null ?
                                        Container( width: 150, height: 100,
                                            child: Padding(padding: EdgeInsets.all(20),
                                              child: SvgPicture.asset(mainLogo),
                                            )                           ):
                                        Image.network(snapshot.data[index].imageUrl),
                                        decoration: new BoxDecoration(boxShadow: [
                                          new BoxShadow(
                                            color: Colors.black45,
                                            blurRadius: 3,
                                            offset: Offset(
                                              4.0, // horizontal, move right 10
                                              5.0, // vertical, move down 10
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 80),
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: Container(
                                            color: Colors.black,
                                            height: 70,
                                            width: 150,

                                            child: Align(
                                              alignment: Alignment
                                                  .center,
                                              child: Text(snapshot.data[index].name,style: TextStyle(fontSize: 16,
                                                  color: Palatte.wtext,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.1,
                                              ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                )
                            );
                          },
                        ):Center(child: CircularProgressIndicator());
                      },
                    ) : ChildMenuItems(),

                ),
              )

          ),


        ],
      ),
    );
  }

}




