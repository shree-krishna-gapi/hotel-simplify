import 'package:flutter/material.dart';
import 'package:hotelsimplify/auth/posPage.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animator/animator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState(){
    setState(() {
      existUser();
    });
    super.initState();
  }
  Future existUser() async{
    final SharedPreferences prefs  = await SharedPreferences.getInstance();
    final existUser = prefs.getString('hotelSimplifyUser');
    if(existUser == null || existUser == '') {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PosPage(returnMseg:'')));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palatte.color2,
        child: Center(
          child: Animator(
            tween: Tween<double>(begin: 0, end: 100),
            cycles: 1,
            duration: const Duration(milliseconds: 1500),
            builder: (Animation anim) => Center(
              child: Container(

                height: anim.value,
                width: double.infinity,
                child: SvgPicture.asset(mainLogo,fit:BoxFit.fitHeight ,width: 240,
                  height: 240,),
              ),
            ),
          ),


        ),
      ),
    );
  }
}
