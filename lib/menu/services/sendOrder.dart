import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotelsimplify/utils/utility.dart';
import 'package:hotelsimplify/utils/invalidAlert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/snackbar.dart';
import 'package:hotelsimplify/landing/landing.dart';
showPin1(buildContext,context) async{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // User Data
  var userData = prefs.getString('hotelSimplifyUser');
  var userName = jsonDecode(userData)['Data']['Username'].toString();
  var token = jsonDecode(userData)['Data']['Token'].toString();
  // End of User Data

  // Pos Data
  var singlePosPointData = prefs.getString('singlePosPointData');
  Map posPointData = jsonDecode(singlePosPointData);
  var posId = posPointData['Id'];
  var posPointName = posPointData['PosPointName'];
  // End of Pos Data

  // Child Menu Data
  var singleChildMenu = prefs.getString('singleChildMenu');
  Map childMenuData = json.decode(singleChildMenu);
  var roomTypeId = childMenuData['RoomTypeID'];
  var roomId = childMenuData['ID'];
  var roomName = childMenuData['RoomName'];
  //End of child Menu Data

  // Parent Side Menu Data
  var singleParentMenu = prefs.getString('singleParentMenu');
  // End of Parent Side Menu data

  // Table Section Data
  var singleSectionData1 = prefs.getString('singleSectionData');
  print('table-> $singleSectionData1');
  var pax = prefs.getInt('createPax');
  var singleSectionData = prefs.getString('createData');
  print('create -> $singleSectionData');
  var orderItemString= prefs.getStringList('menuItemsId').toString();
  var orderItemDatas = jsonDecode(orderItemString);
  double totalPrice = 0;
  double price;
  Map sectionTable = jsonDecode(singleSectionData);
  var tableSectionId = sectionTable['ID'];
  var isPaid = sectionTable['IsPaid'];
  var title = sectionTable['Title'];
  var tableId = sectionTable['RoomID'];
  // End of Table Section Data

  bool isComplementary = prefs.getBool('isComplementary');

  var itemL = new List();
  var itemList = new Map();
  double subTot=0.0;
  for (var i = 0; i < orderItemDatas.length; i++) {

    var itemCounter = prefs.getInt('item$i');
    var itemNote = prefs.getString('note$i');
    if(itemCounter == 0) {
//      print(itemCounter);
        continue;
    }

      price = double.parse(orderItemDatas[i]['PricePerUnit']);
      totalPrice += price;
      itemList['ID'] = '00000000-0000-0000-0000-000000000000';
      itemList['OrderMasterID'] = '00000000-0000-0000-0000-000000000000'; //${OrderItemDatas[i]['ID']
      itemList['Name'] = '${orderItemDatas[i]['ItemName']}';
      itemList['POSItemID'] = int.parse(orderItemDatas[i]['ID']);
      itemList['Quantity'] = itemCounter;
      itemList['Rate'] = double.parse(orderItemDatas[i]['PricePerUnit']);
      itemList['Amount'] =
          double.parse(orderItemDatas[i]['PricePerUnit']) * itemCounter;
      itemList['CancelReason'] = '$itemNote';
      itemList['InPropgress'] = false;
      itemList['IsDelivered'] = false;
      itemList['IsNewOrderItem'] = true;
      itemList['OrderItemStatus'] = '$roomId';
      itemList['TableID'] = '$tableSectionId'; //${sectionTable['ID']} tableSectionId
      itemList['RoomID'] = '$roomId'; //roomId
      itemList['OccupiedRoomId'] = 0;
      itemList['ItemName'] = '${orderItemDatas[i]['ItemName']}';
      itemList['OperationMode'] =101;
      itemList['SplitNo'] = 1;
      itemList['OrderMasterIdInt'] = 0;
      itemList['Note'] = '$itemNote';
      itemList['IsActive'] = true;
      itemList['IsDeleted'] = false;
      itemList['UserName'] = '$userName';

      itemL.add(itemList);
      subTot =subTot + itemList['Amount'];
//      print('note is: $itemNote');
  }
  prefs.setDouble('subTot', subTot);
  Map<dynamic,dynamic>OrderData = {
    'ID': '00000000-0000-0000-0000-000000000000', // not needed for post 8739208b-2adb-42e9-902a-3317c7ed35f6
    'RoomID': '$roomId',
//    'OccupiedRoomId': 0, // not needed
    "POSPointID": posId,
    'TableID': '$tableSectionId',
    'UserName': '$userName',
    'TotalAmount': totalPrice,
    'Remarks': '',
    'IsPaid': false,
    'CostCenterName': '$posPointName', //
    'TableName': '$title', //unknown
    'RoomName': '$roomName',
//    'CancelReason': '',
    'ItemList': itemL,
    'OrderStatus': '00000000-0000-0000-0000-000000000000', //861fc4ba-5b6e-43d2-8e8e-b1fb846bd5be
    'Pax': pax,
    'NumberOfSplit': 1,
    'UserName' :'$userName',
    "IsComplementary": isComplementary
    };

  var body = jsonEncode(OrderData);
  print(body);
  var url = '${Urls.BASE_API_URL}/Pos/Add';
  http.post(Uri.encodeFull(url),

      body: body,
      headers: {"Content-Type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token"
      }).then(
          (http.Response response) async{
            final int statusCode = response.statusCode;
            final responseBody = response.body;
            print(statusCode);
            if(statusCode == 200) {
              print('200 success');
              Navigator.push(context, MaterialPageRoute(builder: (context) => Landing(returnMseg:'Data Add Successfully!')));
            }
            else {
              print('esle case');
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Server Error!',style: TextStyle(color: Colors.red[300],fontSize: 22,fontWeight: FontWeight.w400),),
                      content: Text('please, contact to the developer.',style: TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.w400),),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok',style: TextStyle(color: Colors.blue[700],fontSize: 16,fontFamily: 'Ubuntu', fontWeight: FontWeight.w400)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  }
              );
//              invalidAlert(context
//                'Server Error!',
//                'please, contact to the developer.'
//              );
//              errorSnack(BuildContext, context,'Server Error!');
//              Navigator.of(context).pop();
            }
          });

}