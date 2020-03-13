import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/sendOrder.dart';
import 'package:responsive_container/responsive_container.dart';
class PinDialog extends StatefulWidget {
  @override
  _PinDialogState createState() => _PinDialogState();
}
class _PinDialogState extends State<PinDialog> {

  bool showPin = true;
  String astric = '';
  int counter = 0;
  String pin="";
  getKeyValue(BuildContext context,n) async {
    if (n == 10) {
      setState(() {
        if (counter != 0) {
          counter--;
        }
      });
    }
    else {
      setState(() {
        counter++;
      });
    }
    pin = pin + n.toString();
    switch (counter) {
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

        setState(() {
          showPin =false;
        });
        var myInt = int.parse(pin);
        assert(myInt is int);

        if(myInt  == 1212) {
          setState(() {
            showPin =false;
          });
          showPin1(BuildContext,context);



//          Navigator.of(context).pop();
        }
        else {
          pin ='';
          _showDialog(
              'Invalid Pin!',
              'Please, Try Again...'
          );
        }

        Map pinData = {
          "PinNumber": pin,
        };


      break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ResponsiveContainer(
        heightPercent: 80,
        widthPercent: 32,
          child: Column(
            children: <Widget>[
              Expanded(child: SvgPicture.asset(mainLogo,
                  height: 90.0, width: 90.0),flex: 2,),
              Expanded(flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 30,
                      child:  astric == '' ? Align(child: Text('Enter Your Pin',style: TextStyle(fontSize: 16,color: Colors.white70),),) :
                      Align(child: Text('$astric',style: TextStyle(
                          fontSize: 20,color: Palatte.wtext,letterSpacing: 3
                      ),),),
                    ),


                    Padding(padding: EdgeInsets.fromLTRB(85, 5, 85, 0),
                      child: SizedBox( height: 1, child: Container(color: Colors.amber,)),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 6,
                child: showPin ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getKeyValue(context,1);
                                      });;
                                    },
                                    child: Align(
                                        child: Text(
                                            '1',style: Theme.of(context).textTheme.button)),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () {
                                      getKeyValue(context,2);
                                    },
                                    child: Align(
                                      child: Text(
                                          '2',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,3);},
                                    child: Align(
                                      child: Text('3',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,4);},
                                    child: Align(
                                      child: Text('4',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,5);},
                                    child: Align(
                                      child: Text('5',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,6);},
                                    child: Align(
                                      child: Text('6',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,7);},
                                    child: Align(
                                      child: Text('7',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,8);},
                                    child: Align(
                                      child: Text('8',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,9);},
                                    child: Align(
                                      child: Text('9',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,0);},
                                    child: Align(
                                      child: Text('0',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
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
                                  color: Colors.deepPurple,
                                  child: InkWell(
                                    onTap: () { getKeyValue(context,10);},
                                    child: Align(
                                      child: Text(
                                          'D',style: Theme.of(context).textTheme.button),),
                                    splashColor: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]
                ): Center(child: CircularProgressIndicator(),),
              ),
            ],
          )
      ),
      backgroundColor: Colors.purple[800],
    );
  }
  _showDialog(title, text) {
    setState(() {
      showPin = true;
    });
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
}
