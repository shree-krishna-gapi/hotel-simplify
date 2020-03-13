import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';

Future<List<childMenu>> fetchChildMenu(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('hotelSimplifyToken');
  var posId = prefs.getString('posId');
  var sectionId = prefs.getString('dynamicSectionId');
  var url = '${Urls.BASE_API_URL}/Pos/GetSectionByAreaID/?areaId=' +
      sectionId + '&posId=' + posId;
  final response = await client.get(
      Uri.encodeFull(
          url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
  var jbody = json.decode(response.body);
  final aa = jbody['Data'];
  final secId = jbody['Data'][0]['ID'];
  prefs.setString('newsectionId', secId);
//  print('child Menu-> $aa');
  final childData = json.encode(aa).toString(
  );

  return compute(parseChildMenuData, childData);

}

List<childMenu> parseChildMenuData(String childData) {
  final parsed = json.decode(childData).cast<Map<String, dynamic>>();
  return parsed.map<childMenu>((json) => childMenu.fromJson(json)).toList();

}

class childMenu {
  final String childId;
  final String RoomName;
  final String RoomTypeID;
  final String RoomTypeName;
  childMenu({this.childId,this.RoomName,this.RoomTypeID,this.RoomTypeName});

  factory childMenu.fromJson(Map<String, dynamic> json) {
    return childMenu(
      childId: json['ID'] as String,
      RoomName: json['RoomName'] as String,
      RoomTypeID: json['RoomTypeID'] as String,
      RoomTypeName: json['RoomTypeName'] as String,
    );

  }
}

