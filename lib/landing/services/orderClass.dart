class OrderClass {

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
  OrderClass({this.iD,this.orderMasterID,this.name,this.pOSItemID,this.quantity,this.rate,this.amount,this.cancelReason,
    this.inProgress,this.isDelivered,this.operationMode,this.isNewOrderItem,this.orderItemStatus,this.tableID,this.roomID,
    this.occupiedRoomId,this.itemName,this.splitNo,this.orderMasterIdInt,this.note,this.isActive,this.isDeleted,this.userName});

  factory OrderClass.fromJson(Map<String, dynamic> json) {
    return OrderClass(
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
