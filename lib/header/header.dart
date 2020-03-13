import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth.dart';
class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}
class _HeaderState extends State<Header> {
  void _shownotification() {
    showMenu(
        context: context,
        items: <PopupMenuEntry<int>>[NotificationWidget()],
        position: RelativeRect.fromLTRB(800,80,0.0,0)
    );
  }
  void _showAccount() {
    showMenu(
        context: context,
        items: <PopupMenuEntry<int>>[AccountWidget()],
        position: RelativeRect.fromLTRB(800,80,0.0,0.0)
    );
  }

  void initState() {
    setState(() {
      UserDetails();
    });
    super.initState();
  }
  String UserName;

  Future UserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('hotelSimplifyUser');
    setState(() {
      UserName = jsonDecode(userData)['Data']['Username'].toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palatte.color1,
      leading: Container(width: 0),
      flexibleSpace:
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 3,
                child:Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                          child: SvgPicture.asset(mainLogo,height: 57,width: 57,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 7,
                child:Padding(
                  padding: const EdgeInsets.only(bottom:7,left: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Waiter Module",style: TextStyle(fontSize: 22,color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily:"Montserrat",
                      ),
                      )
                    ],
                  ),
                )
            )
          ]),
      actions: <Widget>[
        InkWell(
          child: SvgPicture.asset(notificationActive,
            height: 30,
          ),
          onTap: _shownotification,
        ),
        SizedBox(width: 22),
        SvgPicture.asset(
          reloadImage,
          height: 30.0,
          color: Colors.white30,
        ),
        SizedBox(width: 22),
        InkWell(
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: SvgPicture.asset(
                  profileImage,
                  height: 100.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 50,
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Wrap(
                  children: <Widget>[
                    Text(UserName == null ? 'Searching...' : '$UserName',style: TextStyle(fontWeight: FontWeight.w700,height: 1.6),),
                    Text('Waiter'),
                  ],
                ),
              ),
            ],
          ),
          onTap: _showAccount,
        ),
        SizedBox(width: 20),
      ],

    );
  }
}


class NotificationWidget extends PopupMenuEntry<int> { //PopupMenuEntry shree krishna gapi
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
        width: 300,
        color: Colors.brown
    );
  }
}

class AccountWidget extends PopupMenuEntry<int> { //PopupMenuEntry shree krishna gapi
  @override
  double height = 100;
  @override
  bool represents(int n) => n == 1;
  @override
  AccountWidgetState createState() => AccountWidgetState();
}
class AccountWidgetState extends State<AccountWidget> {
  bool _loader = false;
  String FirstName;
  String LastName;
  void initState() {
    setState(() {
      _getUsers();
    });
    super.initState();
  }
  Future _getUsers() async {
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    var userData = prefs.getString('hotelSimplifyUser');
    print(jsonDecode(userData)['Data']['FirstName']);
    FirstName = jsonDecode(userData)['Data']['FirstName'].toString();
    LastName = jsonDecode(userData)['Data']['LastName'].toString();
  }
  _logout() async {
    setState(() {
      _loader = true;
    });
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('userPin','');
    prefs.setString('hotelSimplifyUser','');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 100.0,
                color: Colors.purple[700],
                width: double.infinity,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  height: 90,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_a_photo,color: Colors.grey, size: 14,),
                            SizedBox(height: 4),
                            Text('Change Profile',style: TextStyle(fontSize: 14,
                                color: Colors.black54),)
                          ],
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.settings,color: Colors.grey,size: 14,),
                            SizedBox(height: 4),
                            Text('Account Setting',style: TextStyle(fontSize: 14,
                                color: Colors.black54))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(FirstName ==null && LastName == null ? 'Loading...' :'$FirstName $LastName',
                            style: TextStyle(color: Colors.black54)
                        ),

                        Row(
                          children: <Widget>[
                            Icon(Icons.edit,size: 16, color: Colors.black54,),
                            Text('edit',style: TextStyle(color: Colors.black54),)
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 26),
                      child: _loader == false ?Material(
                        child:OutlineButton(onPressed: _logout,
                          splashColor: Palatte.yellow1,
                          child: Text('Sign Out', style:
                          TextStyle(fontSize: 13,color: Palatte.yellow1),),
                          borderSide: BorderSide(color: Palatte.yellow1)
                        ),
                      ): Center(child: CircularProgressIndicator(),),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Center(
                child:Padding(padding: EdgeInsets.only(bottom: 100),
                  child:Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: const Color(0xff7c94b6),shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: new NetworkImage('https://placeimg.com/720/1000/arch'),
                        fit: BoxFit.cover,
                      ),
                      border: new Border.all(
                        color: Colors.black26,
                        width: 1.0,
                      ),
                    ),
                  ),
                )

            ),
          ),


        ],
      ),
    );
  }
}

