import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';


Future<List<Photo>> fetchPhotos(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var access_token = prefs.getString('hotelSimplifyToken');

  var pos_id = prefs.getString('posId');
  print('posId = $pos_id');
  var url = '${Urls.BASE_API_URL}/Pos/GetMenu/?MenuId=13&posId='+
      pos_id;
  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $access_token"
      });

  final decodeResponseData = json.decode(response.body)['Data'];
  final stringData = json.encode(decodeResponseData);
  print(stringData);
//  prefs.setString('firstSectionId',firstSectionId); // for default menu
//  return compute(parseData, stringData);
  return compute(parsePhotos, stringData);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int Id;
  final String Name;
  Photo({this.Id, this.Name});

  factory Photo.fromJson(Map<String, dynamic> json) {

    return Photo(
      Id: json['ID'] as int,
      Name: json['Name'] as String,
    );
  }
}
