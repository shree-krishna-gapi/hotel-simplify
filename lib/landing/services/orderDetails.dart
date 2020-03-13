//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/foundation.dart';
//import 'package:hotelsimplify/landing/pages/orderDetails.dart';
//import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:hotelsimplify/utils/utility.dart';
//import 'package:flutter/material.dart';
//
//Future<List<OrderDetailData>> fetchOrderDetails(http.Client client) async {
//  final SharedPreferences prefs = await SharedPreferences.getInstance();
//  var token = prefs.getString('hotelSimplifyToken');
//  var posId = prefs.getString('posId');
//  prefs.setBool('selectItems',false);
//  // TODO selectItems
//  var childMenuSectionId = prefs.getString('childMenuSectionId');
//  var uu = 'http://192.168.1.52:9999/api/Pos/GetOrderDetailsByTableId?TableId=897ceeed-e34c-47a5-a683-134c7b52da1b&RoomID=1be32d6e-9991-45b6-a37a-29f41da29351';
//    var url = '${Urls.BASE_API_URL}/Pos/GetOrderDetailsByTableId/?TableId='+childMenuSectionId+'&RoomID='+posId;
//  final response =  await client.get(Uri.encodeFull(uu),
//      headers: {
//        "Content-Type": "application/json",
//        "Authorization": "Bearer $token"
//      });
//  if(response.statusCode == 200) {
//
//    final aa = json.decode(response.body)['Data'];
////    print('this is GetOrder $aa');
//    if(aa == null) {
//      print('data is null');
//    }
//    else {
//      final oo = json.encode(aa).toString();
//      return compute(parseData, oo);
//    }
//
//  }
//  else if(response.statusCode == 400) {
//    print('error 400');
//  }
//  else if(response.statusCode == 401) {
//    print('error 401');
//  }
//  else if(response.statusCode == 500) {
//    print('error 500');
//  }
//  else {
//    print('something wrong');
//  }
//
//}
//
//List<OrderDetailData> parseData(String oo) {
//  final parsed = json.decode(oo).cast<Map<String, dynamic>>();
//  return parsed.map<OrderDetailData>((json) => OrderDetailData.fromJson(json)).toList();
//
//}
//
//class OrderDetailData {
//
//  final String iD;
//  final String orderMasterID;
//  final String name;
//  final int pOSItemID;
//  final double quantity;
//  final double rate;
//  final double amount;
//  final String cancelReason;
//  final bool inProgress;
//  final bool isDelivered;
//  final int operationMode;
//  final bool isNewOrderItem;
//  final String orderItemStatus;
//  final String tableID;
//  final int occupiedRoomId;
//  final String itemName;
//  final int splitNo;
//  final int orderMasterIdInt;
//  final String note;
//  final bool isActive;
//  final bool isDeleted;
//  final String userName;
//  OrderDetailData({this.iD,this.orderMasterID,this.name,this.pOSItemID,this.quantity,this.rate,this.amount,this.cancelReason,
//    this.inProgress,this.isDelivered,this.operationMode,this.isNewOrderItem,this.orderItemStatus,this.tableID,this.occupiedRoomId,
//  this.itemName,this.splitNo,this.orderMasterIdInt,this.note,this.isActive,this.isDeleted,this.userName});
//
//  factory OrderDetailData.fromJson(Map<String, dynamic> json) {
//    return OrderDetailData(
//        iD: json['ID'] as String,
//        orderMasterID: json['OrderMasterID'] as String,
//        name: json['Name'] as String,
//        pOSItemID: json['POSItemID'] as int,
//        quantity: json['Quantity'] as double,
//        rate: json['Rate'] as double,
//        amount: json['Amount'] as double,
//        cancelReason: json['CancelReason'] as String,
//        inProgress: json['InProgress'] as bool,
//        isDelivered: json['IsDelivered'] as bool,
//        operationMode: json['OperationMode'] as int,
//        isNewOrderItem: json['IsNewOrderItem'] as bool,
//        orderItemStatus: json['OrderItemStatus'] as String,
//        tableID: json['TableID'] as String,
//        occupiedRoomId: json['OccupiedRoomId'] as int,
//        itemName: json['ItemName'] as String,
//        splitNo: json['SplitNo'] as int,
//        orderMasterIdInt: json['OrderMasterIdInt'] as int,
//        note: json['Note'] as String,
//        isActive: json['IsActive'] as bool,
//        isDeleted: json['IsDeleted'] as bool,
//        userName: json['UserName'] as String,
//    );
//
//  }
//}
//
