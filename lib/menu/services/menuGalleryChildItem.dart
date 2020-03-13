import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';

Future<List<parentMenu>> fetchParentMenu(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var access_token = prefs.getString('hotelSimplifyToken');
  var menuId = prefs.getString('menuId');
  var url = '${Urls.BASE_API_URL}/Pos/GetMenuItems?CategoryId='+
      menuId;
  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $access_token"
      });
  final decodeResponseData = json.decode(response.body)['Data'];
//  print(decodeResponseData);
  final stringData = json.encode(decodeResponseData).toString();
//  print(stringData);
  return compute(parseData, stringData);
}



List<parentMenu> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<parentMenu>((json) => parentMenu.fromJson(json)).toList();

}
class parentMenu {
  final int ID;
  final String ItemName;
  final int CategoryID;
  final String ItemCode;
  final bool IsExpirable;
  final String ItemCategory;
  final String UOMID;
  final String MeasurementUnit;
  final String Procedures;
  final double PricePerUnit;
  final String ImageURL;
  final bool HasExtraItem;
  final String ExtraIngredientJSON;
  final String IngredientJSON;
  final String IngredientID;
  final double IngredientQuantity;
  final String IncludedTax;
  parentMenu({this.ID,
    this.ItemName,this.CategoryID,this.ItemCode,this.IsExpirable,this.ItemCategory,this.UOMID,this.MeasurementUnit,
    this.Procedures,this.PricePerUnit,this.ImageURL,this.HasExtraItem,this.ExtraIngredientJSON,this.IngredientJSON,
    this.IngredientID,this.IngredientQuantity,this.IncludedTax
  });
  factory parentMenu.fromJson(Map<String, dynamic> json) {
    return parentMenu(
      ID: json['ID'] as int,
      ItemName: json['ItemName'] as String,
      CategoryID: json['CategoryID'] as int,
      ItemCode: json['ItemCode'] as String,
      IsExpirable: json['IsExpirable'] as bool,
      ItemCategory: json['ItemCategory'] as String,
      UOMID:json['UOMID'] as String,
      MeasurementUnit: json['MeasurementUnit'] as String,
      Procedures: json['Procedures'] as String,
      PricePerUnit: json['PricePerUnit'] as double,
      ImageURL: json['ImageURL'] as String,
      HasExtraItem: json['HasExtraItem'] as bool,
      ExtraIngredientJSON : json['ExtraIngredientJSON'] as String,
      IngredientJSON : json['IngredientJSON'] as String,
      IngredientID: json['IngredientID'] as String,
      IngredientQuantity: json['IngredientQuantity'] as double,
      IncludedTax: json['IncludedTax'] as String
    );

  }
}

