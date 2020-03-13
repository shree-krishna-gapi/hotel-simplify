import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';

Future<List<ParentMenu1>> fetchParentMenu1(http.Client client) async {

//  print('menu gallery'); //todo gallery
  final SharedPreferences prefs = await SharedPreferences.getInstance();
//  print('1');
  var accessToken = prefs.getString('hotelSimplifyToken');
//  print('2');
  var posId = prefs.getString('posId');
//  print('3');
  var menuId = prefs.getInt('menuId');
//  print('4');
  var url = '${Urls.BASE_API_URL}/Pos/GetMenu/?MenuId=$menuId&posId='+
      posId;
//  print(url);

  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken"
      });

  final decodeResponseData = json.decode(response.body)['Data'];

  final stringData = json.encode(decodeResponseData).toString();
//  print(response.body);
  return compute(parseData, stringData);
}



List<ParentMenu1> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ParentMenu1>((json) => ParentMenu1.fromJson(json)).toList();

}
class ParentMenu1 {
  final int id;
  final String name;
  final int parentCategoryId;
  final String imageUrl;
  final bool isInMenu;
  final bool isInventoryItem;
  ParentMenu1({this.id,this.name,this.parentCategoryId,this.imageUrl,this.isInMenu,this.isInventoryItem});

  factory ParentMenu1.fromJson(Map<String, dynamic> json) {
    return ParentMenu1(
        id: json['ID'] as int,
        name: json['Name'] as String,
        parentCategoryId: json['ParentCategoryID'] as int,
        imageUrl: json['ImageURL'] as String,
        isInMenu: json['IsInMenu'] as bool,
        isInventoryItem: json['IsInventoryItem'] as bool

    );

  }
}

