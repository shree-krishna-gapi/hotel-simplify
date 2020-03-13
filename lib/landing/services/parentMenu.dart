import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';

Future<List<parentMenu>> fetchParentMenu(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('hotelSimplifyToken');
  var posId = prefs.getString('posId');
  var url = '${Urls.BASE_API_URL}/Pos/GetAllAreaByPosId?posPointId='+posId;
//  print(url);
  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
//  print(response.body);
  final decodeResponseData = json.decode(response.body)['Data'];
  final stringData = json.encode(decodeResponseData).toString();
  final firstSectionId = json.decode(response.body)['Data'][0]['ID'];
  prefs.setString('firstSectionId',firstSectionId); // for default menu

//  print("parent menu-> $decodeResponseData");
  return compute(parseData, stringData);
}



List<parentMenu> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<parentMenu>((json) => parentMenu.fromJson(json)).toList();

}
class parentMenu {
  final String ID;
  final String RoomType;
  final String Description;
  parentMenu({this.ID,this.RoomType,this.Description});

  factory parentMenu.fromJson(Map<String, dynamic> json) {
    return parentMenu(
        ID: json['ID'] as String,
        RoomType: json['RoomType'] as String,
        Description: json['Description'] as String
    );

  }
}

