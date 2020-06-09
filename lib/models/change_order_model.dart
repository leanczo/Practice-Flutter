import '../models/cost_model.dart';

class ChangeOrderModel {
  final int id;
  final int projectId;
  final String display;
  List<CostModel> costList;

  ChangeOrderModel({this.id, this.projectId, this.display, this.costList});

  factory ChangeOrderModel.fromMap(Map<String, dynamic> json) {
    return ChangeOrderModel(
      id: json['orderId'],
      projectId: json['projectId'],
      display: json['display'],
      costList: List<CostModel>.from(
        json['tasks'].map((x) => CostModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toApi({bool toSyncWithApi = false}) => {
    //"orderId": id,
    //"projectId": projectId,
    "display": display,
    "tasks": List<dynamic>.from(
        costList.map((x) => x.toMap(toSyncWithApi: toSyncWithApi)))
  };

  Map<String, dynamic> toMap() => {
    "orderId": id,
    "projectId": projectId,
    "display": display,
    "tasks": List<dynamic>.from(costList.map((x) => x.toMap()))
  };

  Map<String, dynamic> toDB() =>
      {"id": id, "projectId": projectId, "display": display};

  factory ChangeOrderModel.fromDB(Map<String, dynamic> json) {
    return ChangeOrderModel(
      id: json['id'],
      projectId: json['projectId'],
      display: json['display'],
    );
  }
}
