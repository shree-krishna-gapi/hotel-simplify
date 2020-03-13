import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:animator/animator.dart';
import 'loginPattern.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loginSwitch = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  static final TextEditingController username = new TextEditingController();
  static final TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 6,
                      child: Stack(
                          children: <Widget>[
                            Container(
                              width:double.infinity,
                              child: Image.network('https://placeimg.com/720/1000/arch',
                                  fit: BoxFit.fill),
                            ),
                            Positioned(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity, color: Colors.black12,
                              ),
                            ),
                            Positioned(child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    child: Container(child:SvgPicture.asset(mainLogo,height: 75, width: 75),
                                    ),
                                    radius: 90,
                                    backgroundColor: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                          ]
                      )
                  ),
                  Expanded(
                      flex: 4,
                      child:Container(
                          color: Colors.purple,
                          child: ListView(
                              padding: const EdgeInsets.fromLTRB(40,40,40,0,), //60, 40, 50, 0
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Container(
                                    height: 75,
                                    child: Animator(
                                      tween: Tween<double>(begin: 0, end: 100),
                                      cycles: 1,
                                      duration: const Duration(milliseconds: 700),
                                      builder: (Animation anim) => Center(
                                        child: Container(
                                          height: anim.value,
                                          width: double.infinity,
                                          child: SvgPicture.asset(mainLogo,fit:BoxFit.fitHeight ,width: 80, height: 80,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                _loginSwitch ?
                                Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 40.0),
                                        TextFormField(
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            hintText: "Enter your username",
                                            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.white70,
                                                fontSize: 16
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white10),
                                            ),
                                            labelStyle: TextStyle(color: Colors.red),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Palatte.yellow1),
                                            ),

                                          ),
                                          textAlign: TextAlign.center,
                                          controller: username,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter your username';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 30.0),
                                        TextFormField(
                                          obscureText: true,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            hintText: "Enter your password",
                                            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.white70,
                                                fontSize: 16
                                            ),
                                            labelStyle: new TextStyle(color: const Color(0xFFff42f2)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Palatte.yellow2),
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                          controller: password,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 60.0),
                                        _isLoading ? CircularProgressIndicator() :
                                        OutlineButton(

                                          child: Text('Login',style: TextStyle(color: Colors.amber,fontSize: 18)),
                                          borderSide: BorderSide(
                                              color: Colors.amber,
                                              style: BorderStyle.solid,
                                              width: 2.0
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              _loginSwitch = !_loginSwitch;
                                            });

                                          },
                                        ),

                                        SizedBox(height: 40),
                                      ],
                                    )) : LoginPattern(),
                                FlatButton (
                                  child: Align(child:Column(
                                    children: <Widget>[
                                      Text('Change login option ?',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Pacifico',
                                              fontSize: 14
                                          )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 1),
                                        child: Container(width:166,height: 2, color: Colors.white70,
                                        ),
                                      )
                                    ],
                                  )),
                                  onPressed: () {
                                    setState(() {
                                      _loginSwitch = !_loginSwitch;
                                    });
                                  },
                                ),
                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
