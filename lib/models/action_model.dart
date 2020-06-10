import 'dart:convert';

import '../enums/action_type.dart';

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
      synced: json['synced'] == 1 ? true : false,
    );
  }
}
