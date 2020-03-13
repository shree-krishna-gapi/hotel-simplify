import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'posPage.dart';
class LoginPattern extends StatefulWidget {
  @override
  _LoginPatternState createState() => _LoginPatternState();
}

class _LoginPatternState extends State<LoginPattern> {
  @override
  bool showPin = true;
  String astric = '';
  int counter = 0;
  String pin="";
  getKeyValue(n) async {
    if(n == 10) {
      setState(() {
        if (counter != 0){counter--;}
      });
    }
    else {
      setState(() {counter++;});
    }
    pin=pin+n.toString();
    switch(counter) {
      case 0:
        astric = '';
        break;
      case 1:
        astric = '*';
        break;
      case 2:
        astric = '**';
        break;
      case 3:
        astric = '***';
        break;
      case 4:
        counter = 0;
        astric = '****';
        showPin = false;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('tempPin',pin);
        Map data = {
          "PinNumber": pin,
        };
        var url = '${Urls.BASE_API_URL}/Users/pinAuthenticate';
        http.post(Uri.encodeFull(url),
            body: jsonEncode(data).toString(),
            headers: {"Content-Type": "application/json",}).then(
                (http.Response response) {
              final int statusCode = response.statusCode;
              final responseBody = response.body;
              final pinData = jsonDecode(response.body);
              if (statusCode == 200) {
                final hotelSimplifyUser = responseBody.toString();
                prefs.setString('hotelSimplifyUser', hotelSimplifyUser);
                final tokenData = pinData['Data']['Token'].toString();

                prefs.setString('hotelSimplifyToken',tokenData);
                final posList = pinData['Data']['Pos'].length;
                if(posList > 1) {
                  final posData = pinData['Data']['Pos'];
                  final rr = jsonEncode(posData);
                  final posdata = rr.toString();
                  prefs.setString('pos', posdata);
                  Timer(Duration(seconds: 1), () {
                    final posSaveData = prefs.getString('pos');
                    if(posSaveData != null) {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PosPage(returnMseg:''))); //LandingHead
                      });
                    }
                    else {
                      _showDialog(
                          'Pos is Empty',
                          'Cannot login deu to error on pos'
                      );
                    }
                  });
                } // if pos more than 1
              } // main if 200
              else if((statusCode == 400)) {
                print('------------400-----------------');
                String rdata = responseBody.toString();
                prefs.setString('usersPin_error', rdata);
                setState(() {
                  showPin = true;
                });
                _showDialog(
                    'Invalid Pin!',
                    'Please, Try Again...'
                );
              }
              else {
                _showDialog(
                  '',
                  'OPPS!!! Something Wrong...',
                );
              }
            });
        pin = '';
        break;
    }
  }

  _showDialog(title, text) {
    counter = 0;
    astric = '';
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title,style: TextStyle(color: Colors.red[300],fontSize: 22,fontWeight: FontWeight.w400),),
            content: Text(text,style: TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.w400),),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok',style: TextStyle(color: Colors.blue[700],fontSize: 16,fontFamily: 'Ubuntu', fontWeight: FontWeight.w400)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:0.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                height: 30,
                child:  astric == '' ? Align(child: Text('Enter Your Pin',
                    style: TextStyle(fontSize: 16,color: Colors.white70,fontWeight: FontWeight.w400)),) : Align(child: Text(astric,style:
                TextStyle(
                    fontSize: 20,color: Palatte.wtext,letterSpacing: 3
                ),),),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(100, 5, 100, 0),
              child: SizedBox( height: 1, child: Container(color: Colors.amber,)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  30, 20, 30, 20),
              child: showPin ?
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                  onTap: () {
                                    getKeyValue(1);
                                  },
                                  child: Align(
                                      child: Text(
                                          '1',style: Theme.of(context).textTheme.button)),
                                  splashColor: Palatte.yellow1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                  onTap: () {
                                    getKeyValue(2);
                                  },
                                  child: Align(
                                    child: Text(
                                        '2',style: Theme.of(context).textTheme.button),),
                                  splashColor: Palatte.yellow1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                  onTap: () { getKeyValue(3);},
                                  child: Align(
                                    child: Text('3',style: Theme.of(context).textTheme.button),),
                                  splashColor: Palatte.yellow1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                    onTap: () { getKeyValue(4);},
                                    child: Align(
                                      child: Text('4',style: Theme.of(context).textTheme.button),),
                                    splashColor: Palatte.yellow1
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                    onTap: () { getKeyValue(5);},
                                    child: Align(
                                      child: Text('5',style: Theme.of(context).textTheme.button),),
                                    splashColor: Palatte.yellow1
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                    onTap: () { getKeyValue(6);},
                                    child: Align(
                                      child: Text('6',style: Theme.of(context).textTheme.button),),
                                    splashColor: Palatte.yellow1
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                    onTap: () { getKeyValue(7);},
                                    child: Align(
                                      child: Text('7',style: Theme.of(context).textTheme.button),),
                                    splashColor: Palatte.yellow1
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                  onTap: () { getKeyValue(8);},
                                  child: Align(
                                    child: Text('8',style: Theme.of(context).textTheme.button),),
                                  splashColor: Palatte.yellow1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                  onTap: () { getKeyValue(9);},
                                  child: Align(
                                    child: Text('9',style: Theme.of(context).textTheme.button),),
                                  splashColor: Palatte.yellow1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                    onTap: () { getKeyValue(0);},
                                    child: Align(
                                      child: Text('0',style: Theme.of(context).textTheme.button),),
                                    splashColor: Palatte.yellow1
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipOval(
                            child: Container(
                              width: 52.0, height: 52.0,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(
                                    25.0),
                              ),
                              child: Material(
                                color: Palatte.ptrnColor,
                                child: InkWell(
                                    onTap: () { getKeyValue(10);},
                                    child: Align(
                                      child: Text(
                                          'D',style: Theme.of(context).textTheme.button),),
                                    splashColor: Palatte.yellow1
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 90),
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }

}

