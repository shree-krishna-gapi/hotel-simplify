import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';

Future<List<billData>> fetchBillData(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('hotelSimplifyToken');
//  var posId = prefs.getString('posId');
  var tableId = '16f39a64-89b9-43eb-b505-7dc98fe4429e';
  var roomId =  '3b2965b1-1676-41bf-a0d1-a3c6343ad7db';

  var singleChildMenu = prefs.getString('singleChildMenu');
  var singleSectionData = prefs.getString('singleSectionData');

  Map childMenuData = json.decode(singleChildMenu);
  Map childSectionData = json.decode(singleSectionData);
  var tableId1 = childMenuData['ID'];
  var roomId1 = childSectionData['ID'];
//  print(roomId1);
//  print(tableId1);

  var url = '${Urls.BASE_API_URL}/Pos/GetOrderDetailsByTableId/?TableId='+tableId+'&RoomID='+
      roomId;
//  print(url);
  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      );

  final decodeResponseData = json.decode(response.body)['Data'];
  final stringData = json.encode(decodeResponseData).toString();
//  print(stringData);
  return compute(parseData, stringData);
}



List<billData> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<billData>((json) => billData.fromJson(json)).toList();

}
class billData {
  final String ID;
  final String OrderMasterID;
  final String Name;
  final int POSItemID;
  final double Quantity;
  final double Rate;
  final double Amount;
  final String CancelReason;
  final bool InProgress;
  final bool IsDelivered;
  final int OperationMode;
  final bool IsNewOrderItem;
  final String OrderItemStatus;
  final String TableID;
  final String RoomID;
  final int OccupiedRoomId;
  final String ItemName;
  final int SplitNo;
  final int OrderMasterIdInt;
  final String Note;
  final bool IsActive;
  final bool IsDeleted;
  final String UserName;
  billData({this.ID,this.OrderMasterID,this.Name,this.POSItemID,this.Quantity,this.Rate,this.Amount,this.CancelReason,this.InProgress,
  this.IsDelivered,this.OperationMode,this.IsNewOrderItem,this.OrderItemStatus,this.TableID,this.RoomID,this.OccupiedRoomId,this.ItemName,
  this.SplitNo,this.OrderMasterIdInt,this.Note,this.IsActive,this.IsDeleted,this.UserName});

  factory billData.fromJson(Map<String, dynamic> json) {
    return billData(
      ID: json['ID'] as String,
      OrderMasterID : json['OrderMasterID'] as String,
      Name: json['Name'] as String,
      POSItemID: json['POSItemID'] as int,
      Quantity: json['Quantity'] as double,
      Rate : json['Rate'] as double,
      Amount : json['Amount'] as double,
      CancelReason : json['CancelReason'] as String,
      InProgress: json['InProgress'] as bool,
      IsDelivered: json['IsDelivered'] as bool,
      OperationMode: json['OperationMode'] as int,
      IsNewOrderItem: json['IsNewOrderItem'] as bool,
      OrderItemStatus : json['OrderItemStatus'] as String,
      TableID : json['TableID'] as String,
      RoomID : json['RoomID'] as String,
      OccupiedRoomId : json['OccupiedRoomId'] as int,
      ItemName : json['ItemName'] as String,
      SplitNo: json['SplitNo'] as int,
      OrderMasterIdInt: json['OrderMasterIdInt'] as int,
      Note: json['Note'] as String,
      IsActive: json['IsActive'] as bool,
      IsDeleted: json['IsDelete'] as bool,
      UserName: json['UserName'] as String

    );

  }
}

class SubTot{
  double tot;
  SubTot(this.tot){
    this.tot = 14.0;
  }
}
