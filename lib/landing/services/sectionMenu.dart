import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:flutter/material.dart';
Future<List<SectionData>> fetchSection(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var accessToken = prefs.getString('hotelSimplifyToken');
  var posId = prefs.getString('posId');
  prefs.setBool('selectItems',false);
  // TODO selectItems
  var childMenuSectionId = prefs.getString('childMenuSectionId');

  var url = '${Urls.BASE_API_URL}/Pos/GetTableBySectionID/?sectionId='+childMenuSectionId+'&posId='+posId;

  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken"
      });
  if(response.statusCode == 200) {

    final aa = json.decode(response.body)['Data'];
//    print(aa);
    if(aa == null) {
      print('data is null');
    }
    else {
      final oo = json.encode(aa).toString();
      return compute(parseData, oo);
    }

  }
  else if(response.statusCode == 400) {
    print('error 400');
  }
  else if(response.statusCode == 401) {
    print('error 401');
  }
  else if(response.statusCode == 500) {
    print('error 500');
  }
  else {
    print('something wrong');
  }

}

List<SectionData> parseData(String oo) {
  final parsed = json.decode(oo).cast<Map<String, dynamic>>();
  return parsed.map<SectionData>((json) => SectionData.fromJson(json)).toList();

}
class SectionData {

  final String sectionId;
  final String title;
  final int tableCapacity;
  final String pOSPoint;
  final String roomID;
  final String description;
  final String roomName;
  final bool isPaid;
  final int mainCategoryID;
  final bool isActive;
  final bool isDefault;
  SectionData({this.sectionId,this.title,this.tableCapacity,this.pOSPoint,this.roomID,this.description,this.roomName,this.isPaid,
    this.mainCategoryID,this.isActive,this.isDefault});

  factory SectionData.fromJson(Map<String, dynamic> json) {
    return SectionData(
        sectionId: json['ID'] as String,
        title: json['Title'] as String,
        tableCapacity: json['TableCapacity'] as int,
        pOSPoint: json['POSPoint'] as String,
        roomID: json['RoomID'] as String,
        description: json['Description'] as String,
        roomName: json['RoomName'] as String,
        isPaid: json['IsPaid'] as bool,
        mainCategoryID: json['MainCategoryID'] as int,
        isActive: json['IsActive'] as bool,
        isDefault: json['IsDefault'] as bool
    );

  }
}

