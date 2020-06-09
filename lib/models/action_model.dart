import 'dart:convert';

import '../enums/action_type.dart';
import '../models/change_order_model.dart';

import '../enums/action_type.dart';

class ActionModel {
  final int id;
  final int customerId;
  final String customerName;
  final int projectId;
  final String projectName;
  final int changeOrderId;
  final String changeOrderName;
  final String address;
  final DateTime date;
  final ActionType actionType;
  final ChangeOrderModel changeOrder;
  bool synced;

  ActionModel(
      {this.id,
        this.customerId,
        this.customerName,
        this.projectId,
        this.projectName,
        this.changeOrderId,
        this.changeOrderName,
        this.address,
        this.date,
        this.actionType,
        this.changeOrder,
        this.synced = false});

  Map<String, dynamic> toMap() => {
    "customerId": customerId,
    "customerName": customerName,
    "projectId": projectId,
    "projectName": projectName,
    "changeOrderId": changeOrderId,
    "changeOrderName": changeOrderName,
    "address": address,
    "stamp": date.toIso8601String(),
    "actionType": getActionString(actionType),
    "changeOrder": changeOrder.toApi(toSyncWithApi: true),
    "inputSourceId": 1,
  };

  Map<String, dynamic> toDB() => {
    "id": id,
    "customerId": customerId,
    "customerName": customerName,
    "projectId": projectId,
    "projectName": projectName,
    "changeOrderId": changeOrderId,
    "changeOrderName": changeOrderName,
    "address": address,
    "date": date.toIso8601String(),
    "actionType": getActionString(actionType),
    "changeOrderJson": jsonEncode(changeOrder.toMap()),
    "synced": synced ? 1 : 0
  };

  factory ActionModel.fromDB(Map<String, dynamic> json) {
    return ActionModel(
      id: json['id'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      projectId: json['projectId'],
      projectName: json['projectName'],
      changeOrderId: json['changeOrderId'],
      changeOrderName: json['changeOrderName'],
      address: json['address'],
      date: DateTime.parse(json['date']),
      actionType: getActionType(json['actionType']),
      changeOrder:
      ChangeOrderModel.fromMap(jsonDecode(json['changeOrderJson'])),
      synced: json['synced'] == 1 ? true : false,
    );
  }
}
