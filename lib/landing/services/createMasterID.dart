import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../menu/menu.dart';

class CreateMasterID extends StatefulWidget {
  final id;
  final pax;
  CreateMasterID({this.id,this.pax});
  @override
  _CreateMasterIDState createState() => _CreateMasterIDState();
}

class _CreateMasterIDState extends State<CreateMasterID> {
  @override
  void initState() {
    setState(() {
      createFn();
    });
    super.initState();
  }

  Future createFn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('hotelSimplifyToken');
    prefs.setInt('createPax', widget.pax);
    var posId = prefs.getString('posId');
    var url = '${Urls.BASE_API_URL}/Pos/Create?ID=' + '${widget.id}' + '&posId=' +'$posId';
print('uirl $url');
    http.get(Uri.encodeFull(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        }).then(
            (http.Response response) {
          final int statusCode = response.statusCode;

          print(statusCode);
          var data = jsonDecode(response.body)['Data'][0];
          var aa = jsonEncode(data).toString();
          prefs.setString('createData',aa);
        });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));

  }



    @override
    Widget build(BuildContext context) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),

      );
    }

}
