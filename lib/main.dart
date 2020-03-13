import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth/auth.dart';
import 'package:hotelsimplify/utils/utility.dart';
void main(){
  runApp(StartingApp());
}

class StartingApp extends StatefulWidget {
  @override
  _StartingAppState createState() => _StartingAppState();
}

class _StartingAppState extends State<StartingApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Hotel Simplify',
      theme: basicTheme(),
      color: Palatte.color1,
      home: Auth(),
    );
  }
}
