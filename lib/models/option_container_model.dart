import 'dart:convert';
import '../enums/option_type.dart';
import '../models/option_model.dart';

class OptionContainerModel {
  final int id; //fieldId
  final String name;
  final String label;
  final int fieldTypeId;
  final OptionType optionType;
  final List<OptionModel> options;

  OptionContainerModel(
      {this.id,
        this.name,
        this.label,
        this.fieldTypeId,
        this.optionType,
        this.options});

  factory OptionContainerModel.fromMap(Map<String, dynamic> json) {
    return OptionContainerModel(
      id: json['fieldId'],
      name: json['name'],
      label: json['label'],
      fieldTypeId: json['fieldTypeId'],
      optionType: json['fieldTypeId'] != null
          ? getOptionTypeFromInt(json['fieldTypeId'])
          : null,
      options: json['fieldOptions'] != null
          ? List<OptionModel>.from(
          json['fieldOptions'].map((x) => OptionModel.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toMap() => {
    "fieldId": id,
    "name": name,
    "label": label,
    "fieldTypeId": fieldTypeId,
    "fieldOptions": List<dynamic>.from(options.map((x) => x.toMap())),
  };

  Map<String, dynamic> toDB() => {
    "id": id,
    "name": name,
    "label": label,
    "fieldTypeId": fieldTypeId,
    "optionType": getOptionString(optionType),
    "fieldOptionsJson":
    json.encode(List<dynamic>.from(options.map((x) => x.toMap()))),
  };

  factory OptionContainerModel.fromDB(Map<String, dynamic> json) {
    return OptionContainerModel(
      id: json['id'],
      name: json['name'],
      label: json['label'],
      fieldTypeId: json['fieldTypeId'],
      optionType: getOptionType(json['optionType']),
      options: List<OptionModel>.from(jsonDecode(json['fieldOptionsJson'])
          .map((x) => OptionModel.fromMap(x))),
    );
  }
}
