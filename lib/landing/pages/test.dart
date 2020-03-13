import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotelsimplify/utils/utility.dart';

Future<List<OrderCls>> fetchOrderMenu(http.Client client) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('hotelSimplifyToken');
  var childMenuSectionId = prefs.getString('childMenuSectionId');
  var tableId = prefs.getString('tableId');
  var url = '${Urls.BASE_API_URL}/Pos/GetOrderDetailsByTableId?tableId='+tableId+'&RoomID='+childMenuSectionId;
  final response =  await client.get(Uri.encodeFull(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
  print(response.body);
  final decodeResponseData = json.decode(response.body)['Data'];
  final stringData = json.encode(decodeResponseData).toString();
  return compute(parseData, stringData);
}

List<OrderCls> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<OrderCls>((json) => OrderCls.fromJson(json)).toList();

}

class OrderCls {

  final String iD;
  final String orderMasterID;
  final String name;
  final int pOSItemID;
  final double quantity;
  final double rate;
  final double amount;
  final String cancelReason;
  final bool inProgress;
  final bool isDelivered;
  final int operationMode;
  final bool isNewOrderItem;
  final String orderItemStatus;
  final String tableID;
  final String roomID;
  final int occupiedRoomId;
  final String itemName;
  final int splitNo;
  final int orderMasterIdInt;
  final String note;
  final bool isActive;
  final bool isDeleted;
  final String userName;
  OrderCls({this.iD,this.orderMasterID,this.name,this.pOSItemID,this.quantity,this.rate,this.amount,this.cancelReason,
    this.inProgress,this.isDelivered,this.operationMode,this.isNewOrderItem,this.orderItemStatus,this.tableID,this.roomID,
    this.occupiedRoomId,this.itemName,this.splitNo,this.orderMasterIdInt,this.note,this.isActive,this.isDeleted,this.userName});

  factory OrderCls.fromJson(Map<String, dynamic> json) {
    return OrderCls(
      iD: json['ID'] as String,
      orderMasterID: json['OrderMasterID'] as String,
      name: json['Name'] as String,
      pOSItemID: json['POSItemID'] as int,
      quantity: json['Quantity'] as double,
      rate: json['Rate'] as double,
      amount: json['Amount'] as double,
      cancelReason: json['CancelReason'] as String,
      inProgress: json['InProgress'] as bool,
      isDelivered: json['IsDelivered'] as bool,
      operationMode: json['OperationMode'] as int,
      isNewOrderItem: json['IsNewOrderItem'] as bool,
      orderItemStatus: json['OrderItemStatus'] as String,
      tableID: json['TableID'] as String,
      roomID: json['RoomID'] as String,
      occupiedRoomId: json['OccupiedRoomId'] as int,
      itemName: json['ItemName'] as String,
      splitNo: json['SplitNo'] as int,
      orderMasterIdInt: json['OrderMasterIdInt'] as int,
      note: json['Note'] as String,
      isActive: json['IsActive'] as bool,
      isDeleted: json['IsDeleted'] as bool,
      userName: json['UserName'] as String,
    );

  }
}
